package com.cm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import com.cm.vo.User;

import static com.cm.common.sql.JDBCTemplate.close;



public class UserDao {
	User uu = new User();
	
	// 회원가입
	public int createUser(User u, Connection conn) {
		// 디버깅 출력
		System.out.println("UserDao createUser called");
		
		PreparedStatement pstmt = null;
		
		int result =0;
		try {
			String sql = "INSERT INTO `user`(`user_id`,`user_pw`,`user_email`,`user_address`,`user_nick`,`user_question`,`user_answer`) VALUES(?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_email());
			pstmt.setString(4, u.getUser_address());
			pstmt.setString(5, u.getUser_nick());
			pstmt.setInt(6, u.getUser_question());
			pstmt.setString(7, u.getUser_answer());
			
			result=pstmt.executeUpdate();
			
			 // 디버깅용 출력
            System.out.println("Insert SQL Result: " + result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		// 디버깅 출력
		System.out.println("UserDao createUser result: " + result);
		return result;
	}
	
	// 로그인
	public User getUserInfo(String userId, String password,Connection conn) {
		
		PreparedStatement pstmt = null;
		User user = null;
		try {
			String sql = "SELECT * FROM user WHERE user_id =? AND user_pw =?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			pstmt.setString(2,password);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user=new User(rs.getInt("user_no")
						,rs.getString("user_id"),
						rs.getString("user_pw")
						,rs.getString("user_email")
						,rs.getString("user_address")
						,rs.getTimestamp("user_reg_date").toLocalDateTime()
						,rs.getString("profile_text")
						,rs.getString("user_nick")
						,rs.getString("profile_ori_image_name")
						,rs.getString("profile_new_image_name")
						,rs.getInt("user_question")
						,rs.getString("user_answer")
						);
				
			}
			
			
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	// 아이디 중복 체크
	public int check(String id,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 1;
		
		try {
			String sql = "SELECT * FROM user WHERE user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 0;
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 닉네임 중복 체크
	public int checkNick(String nick,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 1;
		
		try {
			String sql = "SELECT * FROM user WHERE user_nick=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 0;
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	// 아이디 찾기
	public String findUserIdByNickAndEmail(String nick, String email, Connection conn) {
	    String userId = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT user_id FROM user WHERE user_nick = ? AND user_email = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, nick);
	        pstmt.setString(2, email);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            userId = rs.getString("user_id");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    return userId;
	}
	
	
	// 비밀번호 찾기
	public User findUserPw(String id, String nick, String question, String answer, Connection conn) {
	    User user = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String sql = "SELECT * FROM user WHERE user_id = ? AND user_nick = ? AND user_question = ? AND user_answer = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        pstmt.setString(2, nick);
	        pstmt.setString(3, question);
	        pstmt.setString(4, answer);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            user = new User(rs.getInt("user_no"),
	                            rs.getString("user_id"),
	                            rs.getString("user_pw"),
	                            rs.getString("user_email"),
	                            rs.getString("user_address"),
	                            rs.getTimestamp("user_reg_date").toLocalDateTime(),
	                            rs.getString("profile_text"),
	                            rs.getString("user_nick"),
	                            rs.getString("profile_ori_image_name"),
	                            rs.getString("profile_new_image_name"),
	                            rs.getInt("user_question"),
	                            rs.getString("user_answer"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }

	    return user;
	}
	
	// 회원탈퇴
	
	public boolean deleteUser(String userId, String password,Connection conn) {
		PreparedStatement pstmt = null;
		boolean isDeleted = false;
		
		try {
			String sql= "DELETE FROM `user` WHERE user_id =? AND user_pw = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
	        pstmt.setString(2, password);
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
                isDeleted = true;
            }
		} catch(Exception e) {
			e.printStackTrace();
		}
		return isDeleted;
	}
	
	
}
