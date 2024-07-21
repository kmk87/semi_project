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
			String sql = "INSERT INTO sale_share_post (board_type_id, local_gu_no, cate_code, user_no, post_title, post_text, prod_price)"
					+"VALUES (2, (SELECT local_gu_no FROM location_gu WHERE local_gu_name = ?), ?, 1, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ssb.getLocal_gu_name());
			pstmt.setInt(2, ssb.getCate_code());
			pstmt.setString(3, ssb.getPost_title());
			pstmt.setString(4, ssb.getPost_text());
			pstmt.setInt(5, ssb.getProd_price());
			
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
	
	// 리스트 (시간순) & 검색(제목)조회
	public List<SaleShareList> selectSaleBoardList(SaleShareList option, Connection conn){
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		SaleShareList ssl = new SaleShareList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT p.post_no, p.cate_code,u.local_gu_name, p.user_no,p.post_release_yn, p.deal_status, p.post_title, p.post_text, p.prod_price,p.prod_reg_date ,p.prod_mod_date, i.image_new_name "
			           + "FROM `sale_share_post` p " 
			           + "JOIN `sale_share_image` i ON p.post_no = i.post_no "
			           + "JOIN `location_gu` u ON p.local_gu_no = u.local_gu_no "
			           + "WHERE post_release_yn= 'Y'";
			
			if(option.getPost_title() != null) {
				sql += " AND post_title LIKE CONCAT('%','"+option.getPost_title()+"','%')";
			}
			sql += " ORDER BY p.prod_reg_date DESC"
				+" LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ssl = new SaleShareList(rs.getString("Image_new_name"),
						rs.getInt("post_no"),
						rs.getInt(1),
						rs.getString("local_gu_name"),
						rs.getTimestamp("prod_reg_date").toLocalDateTime(),
						rs.getTimestamp("prod_mod_date").toLocalDateTime(),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getInt("prod_price"),
						rs.getInt(1),
						rs.getInt("deal_status"),
						rs.getInt(1),
						rs.getString("post_release_yn"));
					list.add(ssl);
			}
			System.out.println(list.get(0).getUser_no());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 검색(내용) 조회
	public List<SaleShareList> selectSaleSearchText(SaleShareList option, Connection conn){
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		SaleShareList ssl = new SaleShareList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT p.post_no, p.cate_code,u.local_gu_name, p.user_no, p.post_release_yn,p.deal_status, p.post_title, p.post_text, p.prod_price,p.prod_reg_date, p.prod_mod_date, i.image_new_name "
			           + "FROM `sale_share_post` p " 
			           + "JOIN `sale_share_image` i ON p.post_no = i.post_no "
			           + "JOIN `location_gu` u ON p.local_gu_no = u.local_gu_no "
			           + "WHERE post_release_yn= 'Y'";
			
			if(option.getPost_title() != null) {
				sql += " AND post_text LIKE CONCAT('%','"+option.getPost_title()+"','%')";
			}
			sql += " ORDER BY p.prod_reg_date DESC"
				+" LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ssl = new SaleShareList(rs.getString("Image_new_name"),
						rs.getInt("post_no"),
						rs.getInt(1),
						rs.getString("local_gu_name"),
						rs.getTimestamp("prod_reg_date").toLocalDateTime(),
						rs.getTimestamp("prod_mod_date").toLocalDateTime(),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getInt("prod_price"),
						rs.getInt(1),
						rs.getInt("deal_status"),
						rs.getInt(1),
						rs.getString("post_release_yn"));
					list.add(ssl);
			}
			System.out.println(list.get(0).getUser_no());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 검색(닉네임) 조회
	public List<SaleShareList> selectSaleSearchNic(SaleShareList option, Connection conn){
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		SaleShareList ssl = new SaleShareList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT p.post_no, p.cate_code,u.local_gu_name, p.user_no,p.post_release_yn, p.deal_status, p.post_title, p.post_text, p.prod_price, p.prod_reg_date,p.prod_mod_date, i.image_new_name "
			           + "FROM `sale_share_post` p " 
			           + "JOIN `sale_share_image` i ON p.post_no = i.post_no "
			           + "JOIN `location_gu` u ON p.local_gu_no = u.local_gu_no "
			           + "WHERE post_release_yn= 'Y'";
			
			if(option.getPost_title() != null) {
				sql += " AND user_no LIKE CONCAT('%','"+option.getPost_title()+"','%')";
			}
			sql += " ORDER BY p.prod_reg_date DESC"
				+" LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ssl = new SaleShareList(rs.getString("Image_new_name"),
						rs.getInt("post_no"),
						rs.getInt(1),
						rs.getString("local_gu_name"),
						rs.getTimestamp("prod_reg_date").toLocalDateTime(),
						rs.getTimestamp("prod_mod_date").toLocalDateTime(),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getInt("prod_price"),
						rs.getInt(1),
						rs.getInt("deal_status"),
						rs.getInt(1),
						rs.getString("post_release_yn"));
					list.add(ssl);
			}
			System.out.println(list.get(0).getUser_no());
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
			String sql = "select count(*) as cnt from sale_share_post where post_release_yn= 'Y' ";
			if(option.getPost_title() != null) {
				sql +=" and post_title like concat('%','"+option.getPost_title()+"','%')";
			}
			
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
	
	// 상세페이지
	public SaleShareList selectBoard(int postNo,Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		SaleShareList ssl = new SaleShareList();
		
		try {
			String sql =  "SELECT p.post_no,p.deal_status,u.local_gu_name,c.cate_code, p.post_release_yn,p.user_no, p.post_title, p.post_text, p.prod_price, p.prod_reg_date,p.prod_mod_date, i.image_new_name"
					+ " FROM sale_share_post p"
					+ " JOIN sale_share_image i ON p.post_no = i.post_no"
					+ " JOIN prod_category c ON p.cate_code = c.cate_code"
					+ " JOIN location_gu u ON p.local_gu_no = u.local_gu_no "
					+" where p.post_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ssl = new SaleShareList(rs.getString("Image_new_name"),
						rs.getInt("post_no"),
						rs.getInt(1),
						rs.getString("local_gu_name"),
						rs.getTimestamp("prod_reg_date").toLocalDateTime(),
						rs.getTimestamp("prod_mod_date").toLocalDateTime(),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getInt("prod_price"),
						rs.getInt(1),
						rs.getInt("deal_status"),
						rs.getInt(1),
						rs.getString("post_release_yn"));
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
	public int editSale(String visiblity,int postNo,SaleShareBoard ssb, SaleShareImage ssi,Connection conn ) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			String sql = "update sale_share_post set cate_code = ?, post_title = ?, post_text = ?,"
					+ "prod_price = ?, deal_status = ?, post_release_yn = ? where post_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ssb.getCate_code());
			pstmt.setString(2, ssb.getPost_title());
			pstmt.setString(3, ssb.getPost_text());
			pstmt.setInt(4, ssb.getProd_price());
			pstmt.setInt(5, ssb.getDeal_status());
			pstmt.setString(6, visiblity);
			pstmt.setInt(7, postNo);
		
			
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
				String sql = "SELECT p.post_no,u.local_gu_name, p.cate_code,p.post_release_yn, p.user_no, p.deal_status, p.post_title, p.post_text, p.prod_price, p.prod_reg_date,p.prod_mod_date, i.image_new_name"
						+ " FROM `sale_share_post` p JOIN `sale_share_image` i ON p.post_no = i.post_no"
						+ " JOIN location_gu u ON p.local_gu_no = u.local_gu_no "
						+ " WHERE p.prod_price = 0 and post_release_yn= 'Y'"
						+ " ORDER BY p.prod_reg_date DESC"
				        + " LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ssl = new SaleShareList(rs.getString("Image_new_name"),
							rs.getInt("post_no"),
							rs.getInt(1),
							rs.getString("local_gu_name"),
							rs.getTimestamp("prod_reg_date").toLocalDateTime(),
							rs.getTimestamp("prod_mod_date").toLocalDateTime(),
							rs.getString("post_title"),
							rs.getString("post_text"),
							rs.getInt("prod_price"),
							rs.getInt(1),
							rs.getInt("deal_status"),
							rs.getInt(1),
							rs.getString("post_release_yn"));
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
		
		// 나눔리스트 - 카운트
		public int selectBoardShareCount(SaleShareList option,Connection conn) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "select count(*) as cnt from sale_share_post where prod_price = 0 and post_release_yn = 'Y'";				
				
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

		// 판매리스트
		public List<SaleShareList> selectSale(SaleShareList option,Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<SaleShareList> list = new ArrayList<SaleShareList>();
			SaleShareList ssl = null;
			
			try {
				String sql = "SELECT p.post_no,u.local_gu_name, p.post_release_yn,p.cate_code, p.user_no, p.deal_status, p.post_title, p.post_text, p.prod_price, p.prod_reg_date,p.prod_mod_date, i.image_new_name "
				           + "FROM `sale_share_post` p " 
				           + "JOIN `sale_share_image` i ON p.post_no = i.post_no "
				           + "JOIN location_gu u ON p.local_gu_no = u.local_gu_no "
				           + "WHERE p.prod_price > 0 and post_release_yn= 'Y'"
				           + "ORDER BY p.prod_reg_date DESC "
				           + "LIMIT " + option.getLimitPageNo() + ", " + option.getNumPerPage();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ssl = new SaleShareList(rs.getString("Image_new_name"),
							rs.getInt("post_no"),
							rs.getInt(1),
							rs.getString("local_gu_name"),
							rs.getTimestamp("prod_reg_date").toLocalDateTime(),
							rs.getTimestamp("prod_mod_date").toLocalDateTime(),
							rs.getString("post_title"),
							rs.getString("post_text"),
							rs.getInt("prod_price"),
							rs.getInt(1),
							rs.getInt("deal_status"),
							rs.getInt(1),
							rs.getString("post_release_yn"));
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
		// 페이지카운트 - 판매
		public int selectBoardSellCount(SaleShareList option,Connection conn) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "select count(*) as cnt from sale_share_post where prod_price > 0 and post_release_yn = 'Y'";				
				
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
		
		// 끌어올리기
		public int salePull(int postNo, Connection conn) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE sale_share_post SET prod_reg_date = NOW() WHERE post_no=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, postNo);
				
				result = pstmt.executeUpdate();
						
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
	}

