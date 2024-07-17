package com.cm.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.board.service.QBoardService;
import com.cm.board.vo.QBoard;


@WebServlet("/QBoardUpdateEndServlet")
public class QBoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardUpdateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("post_title");
		String text = request.getParameter("post_text");
		
		QBoard qb = new QBoard();
		qb.setPostTitle(title);
		qb.setPostText(text);
		
		int result = new QBoardService().updateBoard(qb);
		RequestDispatcher view = request.getRequestDispatcher("/views/qboard/udate_fail.jsp");
		if(result > 0) {
			view = request.getRequestDispatcher("/views/qboard/update_success.jsp");
		}
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
