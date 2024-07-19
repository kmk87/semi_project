package com.cm.sale_share_board.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.sale_share_board.vo.SaleShareBoard;
import com.cm.sale_share_board.vo.SaleShareImage;
import com.cm.sale_share_board.vo.SaleShareList;

public class SaleShareBoardDao {
	
	// 생성
	public int createBoard(SaleShareBoard ssb,SaleShareImage ssi ,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		int postNo = 0;
		try {
			String sql = "insert into `sale_share_post`(board_type_id,local_gu_no,cate_code,user_no,post_title,"
					+ "post_text,prod_price) values (2,1,?,1,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ssb.getCate_code());
			pstmt.setString(2, ssb.getPost_title());
			pstmt.setString(3, ssb.getPost_text());
			pstmt.setInt(4, ssb.getProd_price());
			
			result = pstmt.executeUpdate();
			
			if(result>0) {
				String sql2 = "select post_no from `sale_share_post` where cate_code = ? and post_title = ? and post_text = ? and prod_price =?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, ssb.getCate_code());
				pstmt.setString(2, ssb.getPost_title());
				pstmt.setString(3, ssb.getPost_text());
				pstmt.setInt(4, ssb.getProd_price());
				rs = pstmt.executeQuery();	
			}
			if(rs.next()) {
				postNo = rs.getInt("post_no");
				ssb.setPost_no(postNo);
			}
			String sql3 = "insert into `sale_share_image` (post_no,image_ori_name,image_new_name) values (?,?,?)";
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, ssb.getPost_no());
			pstmt.setString(2, ssi.getImage_ori_name());
			pstmt.setString(3, ssi.getImage_new_name());
			
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리스트 (시간순)
	public List<SaleShareList> selectSaleBoardList(SaleShareList option, Connection conn){
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		SaleShareList ssl = new SaleShareList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT p.post_no, p.cate_code, p.user_no, p.deal_status, p.post_title, p.post_text, p.prod_price, p.prod_mod_date, i.image_new_name "
			           + "FROM `sale_share_post` p " 
			           + "JOIN `sale_share_image` i ON p.post_no = i.post_no "
			           + "ORDER BY p.prod_mod_date DESC "
			           + "LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ssl = new SaleShareList(rs.getString("Image_new_name"),
										rs.getInt("post_no"),
										rs.getInt(1),
										rs.getTimestamp("prod_mod_date").toLocalDateTime(),
										rs.getString("post_title"),
										rs.getString("post_text"),
										rs.getInt("prod_price"),
										rs.getInt(1),
										rs.getInt("deal_status"),
										rs.getInt(1));
				list.add(ssl);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	// 갯수
	public int selectSaleBoardCount(SaleShareList option,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) as cnt from sale_share_post";
//			if(option.getPost_title() != null) {
//				sql += "where post_title like concat('%','"+option.getPost_title()+",'%'";
//			}
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 상세조회
	public SaleShareList selectBoard(int postNo,Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		SaleShareList ssl = new SaleShareList();
		
		try {
			String sql =  "SELECT p.post_no,p.deal_status ,c.cate_code, p.user_no, p.post_title, p.post_text, p.prod_price, p.prod_mod_date, i.image_new_name"
					+ " FROM sale_share_post p"
					+ " JOIN sale_share_image i ON p.post_no = i.post_no"
					+ " JOIN prod_category c ON p.cate_code = c.cate_code"
					+" where p.post_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ssl = new SaleShareList(rs.getString("Image_new_name"),
						rs.getInt("post_no"),
						rs.getInt(1),
						rs.getTimestamp("prod_mod_date").toLocalDateTime(),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getInt("prod_price"),
						rs.getInt(1),
						rs.getInt("deal_status"),
						rs.getInt("cate_code"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return ssl;
	}
	
	// 수정
	public int editSale(int postNo,SaleShareBoard ssb, SaleShareImage ssi,Connection conn ) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			String sql = "update sale_share_post set cate_code = ?, post_title = ?, post_text = ?,"
					+ "prod_price = ?, deal_status = ? where post_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ssb.getCate_code());
			pstmt.setString(2, ssb.getPost_title());
			pstmt.setString(3, ssb.getPost_text());
			pstmt.setInt(4, ssb.getProd_price());
			pstmt.setInt(5, ssb.getDeal_status());
			pstmt.setInt(6, postNo);
		
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				String sql2 = "update sale_share_image set image_new_name = ? where post_no = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, ssi.getImage_new_name());
				pstmt.setInt(2, postNo);
				
				result = pstmt.executeUpdate();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 삭제
	public int deleteSale(int postNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			String sql = "delete from sale_share_image where post_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				String sql2 = "delete from sale_share_post where post_no = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, postNo);
				
				 result = pstmt.executeUpdate();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	// 나눔 리스트
		public List<SaleShareList> selectShare(SaleShareList option,Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<SaleShareList> list = new ArrayList<SaleShareList>();
			SaleShareList ssl = null;
			
			try {
				String sql = "SELECT p.post_no, p.cate_code, p.user_no, p.deal_status, p.post_title, p.post_text, p.prod_price, p.prod_mod_date, i.image_new_name"
						+ " FROM `sale_share_post` p JOIN `sale_share_image` i ON p.post_no = i.post_no"
						+ " WHERE p.prod_price = 0"
						+ " ORDER BY p.prod_mod_date DESC"
				        + " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ssl = new SaleShareList(rs.getString("Image_new_name"),
											rs.getInt("post_no"),
											rs.getInt(1),
											rs.getTimestamp("prod_mod_date").toLocalDateTime(),
											rs.getString("post_title"),
											rs.getString("post_text"),
											rs.getInt("prod_price"),
											rs.getInt(1),
											rs.getInt("deal_status"),
											rs.getInt(1));
						list.add(ssl);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					close(rs);
					close(pstmt);
				}
				return list;
			}

		// 판매리스트
		public List<SaleShareList> selectSale(SaleShareList option,Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<SaleShareList> list = new ArrayList<SaleShareList>();
			SaleShareList ssl = null;
			
			try {
				String sql = "SELECT p.post_no, p.cate_code, p.user_no, p.deal_status, p.post_title, p.post_text, p.prod_price, p.prod_mod_date, i.image_new_name "
				           + "FROM `sale_share_post` p " 
				           + "JOIN `sale_share_image` i ON p.post_no = i.post_no "
				           + "WHERE p.prod_price = 0 "
				           + "ORDER BY p.prod_mod_date DESC "
				           + "LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ssl = new SaleShareList(rs.getString("Image_new_name"),
											rs.getInt("post_no"),
											rs.getInt(1),
											rs.getTimestamp("prod_mod_date").toLocalDateTime(),
											rs.getString("post_title"),
											rs.getString("post_text"),
											rs.getInt("prod_price"),
											rs.getInt(1),
											rs.getInt("deal_status"),
											rs.getInt(1));
						list.add(ssl);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					close(rs);
					close(pstmt);
				}
				return list;
			}
		

	}

