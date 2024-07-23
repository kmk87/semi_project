package com.cm.question_comment.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.cm.question_comment.dao.QuestionDao;

public class QuestionService {
	public int createComment(String user_nic,String text,int postNo) {
		Connection conn = getConnection();
		int result = 0;
//		int result = new QuestionDao().createComment(user_nic,text,postNo,conn);
		close(conn);
		return result;
	}
}
