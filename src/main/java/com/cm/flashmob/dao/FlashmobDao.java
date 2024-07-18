package com.cm.flashmob.dao;

import static com.cm.common.sql.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.flashmob.vo.Flashmob;

public class FlashmobDao {
	
	// 검색 기능을 구현한 리스트
	public List<Flashmob> selectFlashmobList(Flashmob option,Connection conn){
		List<Flashmob> list = new ArrayList<Flashmob>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no ,p.flashmob_location ,p.flashmob_date ,p.flashmob_number ,p.user_no ,p.board_type_id ,p.local_gu_no ,p.post_title ,p.post_text ,p.post_reg_date ,p.post_mod_date ,p.post_release_yn ,COUNT(l.post_no) AS like_count FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no";
			if(option.getPost_title() != null) {
				sql += " WHERE p.post_title LIKE CONCAT('%','"+option.getPost_title()+"','%')";
			}
			sql += " GROUP BY p.post_no, p.flashmob_location, p.flashmob_date, p.flashmob_number, p.user_no, p.board_type_id, p.local_gu_no, p.post_title, p.post_text, p.post_reg_date, p.post_mod_date, p.post_release_yn";
			sql += " LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flashmob resultVo = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count")
						);
				
				list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int selectFlashmobCount(Flashmob option,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM flashmob_post";
			if(option.getPost_title() != null) {
				sql+=" WHERE post_title LIKE CONCAT ('%','"+option.getPost_title()+"','%')";
			}
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// 번개모임 게시판 게시글 작성
	public int createFlashmob(int user,int boardtype,int local_gu,Flashmob f,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO `flashmob_post` (flashmob_location,flashmob_date,flashmob_number,user_no,board_type_id,local_gu_no,post_title,post_text,post_release_yn) VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFlashmob_location());
			pstmt.setObject(2, f.getFlashmob_date());
			pstmt.setInt(3, f.getFlashmob_number());
			pstmt.setInt(4, user);
			pstmt.setInt(5, boardtype);
			pstmt.setInt(6, local_gu);
			pstmt.setString(7, f.getPost_title());
			pstmt.setString(8, f.getPost_text());
			pstmt.setString(9, f.getPost_release_yn());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	// 상세 글 조회
	public Flashmob checkPost(int post_no,Connection conn) {
		Flashmob result = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no ,p.flashmob_location ,p.flashmob_date ,p.flashmob_number ,p.user_no ,p.board_type_id ,p.local_gu_no ,p.post_title ,p.post_text ,p.post_reg_date ,p.post_mod_date ,p.post_release_yn ,COUNT(l.post_no) AS like_count FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no WHERE p.post_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count")
						);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
}
