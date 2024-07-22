package com.cm.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.board.service.QBoardService;
import com.cm.board.vo.QBoard;
import com.cm.vo.User;

@WebServlet("/qboard/createEnd")
public class QBoardCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QBoardCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("postTitle");
		String text = request.getParameter("postText");
		System.out.println("제목"+title);
		System.out.println("내용"+text);
	
		QBoard qb = new QBoard();
		qb.setPostTitle(title);
		qb.setPostText(text);
		
//		HttpSession session = request.getSession(false);
//		if(session != null) {
//			User u = (User)session.getAttribute("user");
//			int userNo = u.getUser_no();
//			qb.setUserNo(userNo);
//		}
		
		int result = new QBoardService().createBoard(qb);
		RequestDispatcher view = request.getRequestDispatcher("/views/qboard/create_fail.jsp");
		if(result > 0) {
			view = request.getRequestDispatcher("/views/qboard/create_success.jsp");
		}
		view.forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
