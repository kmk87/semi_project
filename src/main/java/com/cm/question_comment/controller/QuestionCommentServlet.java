package com.cm.question_comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.question_comment.service.QuestionService;


@WebServlet("/sale_share_borad/comment")
public class QuestionCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public QuestionCommentServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_nic = "abc";
		String text = request.getParameter("comment_text");
		String post = request.getParameter("post_no");
		int postNo = Integer.getInteger(post);
//		int postNo = Integer.getInteger(post);
		
		int result = new QuestionService().createComment(user_nic,text,postNo);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
