package com.cm.service;

import java.sql.Connection;
import static com.cm.common.sql.JDBCTemplate.*;

import com.cm.dao.UserDao;
import com.cm.vo.User;

import static com.cm.common.sql.JDBCTemplate.getConnection;
import static com.cm.common.sql.JDBCTemplate.close;

public class UserService {
	 private UserDao ud = new UserDao();
	 
	 // 회원가입
	public int createUser(User u) {
		
		// 디버깅 출력
		System.out.println("UserService createUser called");
		
		Connection conn = getConnection();
		
		// 디버깅 출력
		int result = 0;
		try {
            result = ud.createUser(u, conn);
            if(result > 0) {
                commit(conn);
            } else {
                rollback(conn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(conn);
        }
        System.out.println("UserService createUser result: " + result);
        return result;
    }
	
	
	// 아이디 중복 체크
	
	public int check(String id) {
		Connection conn = getConnection();
		int result = new UserDao().check(id,conn);
		close(conn);
		return result;
	}
	
	// 닉네임 중복 체크
	public int checkNick(String nick) {
		Connection conn = getConnection();
		int result = new UserDao().checkNick(nick,conn);
		close(conn);
		return result;
	}
	
	// 로그인
	public User getUserInfo(String id,String pw) {
		Connection conn = getConnection();
		User user  = new UserDao().getUserInfo(id,pw,conn);
		close(conn);
		return user;
	}
	
	// 아이디 찾기
	public String findUserIdByNickAndEmail(String nick, String email) {
	    Connection conn = getConnection();
	    String userId = ud.findUserIdByNickAndEmail(nick, email, conn);
	    close(conn);
	    return userId;
	}
	
	// 비밀번호 찾기
	public User findUserPw(String id, String nick, String question, String answer) {
	    Connection conn = getConnection();
	    User user = ud.findUserPw(id, nick, question, answer, conn);
	    close(conn);
	    return user;
	}
	

	// 회원탈퇴
	
	public boolean deleteUser(String id,String pw) {
		Connection conn = getConnection();
		boolean isDeleted = ud.deleteUser(id, pw, conn); // UserDao의 인스턴스 변수 사용
        close(conn);
        return isDeleted;
	}
	
	
	
}
