package com.cm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import com.cm.vo.User;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;
import com.cm.service.UserService;

public class UserDao {
	User uu = new User();
	public int createUser(User u, Connection conn) {
		PreparedStatement pstmt = null;
		
		int result =0;
		try {
			String sql = "INSERT INTO `user`(`user_id`,`user_pw`,`user_email`,`user_address`,`user_nick`) VALUES(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_email());
			pstmt.setString(4, "마포구");
			pstmt.setString(5, u.getUser_nick());
			
			result=pstmt.executeUpdate();
			
			System.out.println(result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
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


	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
