package com.cm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cm.vo.User;

import static com.cm.common.sql.JDBCTemplate.close;
import com.cm.service.UserService;

public class UserDao {
	public int createUser(User u, Connection conn) {
		PreparedStatement pstmt = null;
		
		int result =0;
		try {
			String sql = "INSERT INTO `user`(`user_id`,`user_pw`,`user_email`,`user_address`,`user_nick`) VALUES(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, u.getUser_id());
			pstmt.setString(2, u.getUser_pw());
			pstmt.setString(3, u.getUser_email());
			pstmt.setString(4, u.getUser_address());
			pstmt.setString(5, u.getUser_nick());
			
			result=pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 로그인
	public User getUserInfo(String userId, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		User user = null;
		try {
			String sql = "SELECT*FROM user WHERE user_id =? AND user_pw =?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,userId);
			pstmt.setString(2,password);
			
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setUser_id(rs.getString("user_id"));
				user.setUser_pw(rs.getString("user_pw"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_nick(rs.getString("user_nick"));
				user.setUser_address(rs.getString("user_address"));
				
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
