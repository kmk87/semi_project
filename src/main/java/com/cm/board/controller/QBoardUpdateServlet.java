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



@WebServlet("/qboard/update")
public class QBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("post_no"));
		
		QBoard result = new QBoardService().getQBoard(postNo); 
		request.setAttribute("qboard", result);
		RequestDispatcher view = request.getRequestDispatcher("/views/qboard/update.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
