package com.cm.service;

import java.sql.Connection;

import com.cm.dao.UserDao;
import com.cm.vo.User;

import static com.cm.common.sql.JDBCTemplate.getConnection;
import static com.cm.common.sql.JDBCTemplate.close;

public class UserService {
	public int createUser(User u) {
		Connection conn = getConnection();
		int result = new UserDao().createUser(u,conn);
		close(conn);
		return result;
	}
	
	public int check(String id) {
		Connection conn = getConnection();
		int result = new UserDao().check(id,conn);
		close(conn);
		return result;
	}
	
	public int checkNick(String nick) {
		Connection conn = getConnection();
		int result = new UserDao().checkNick(nick,conn);
		close(conn);
		return result;
	}
	
	
	public User getUserInfo(String id,String pw) {
		Connection conn = getConnection();
		User result = new UserDao().getUserInfo(id,pw,conn);
		close(conn);
		return result;
	}
}
