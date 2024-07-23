package com.cm.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.board.service.QboardLikeService;
import com.cm.board.vo.QBoardLike;

@WebServlet("/QBoard/like")
public class QBoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QBoardLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      int post_no=Integer.parseInt(request.getParameter("post_no"));
	      int user_no=1;
	      QBoardLike bl = new QBoardLike();
	      bl.setPost_no(post_no);
	      bl.setUser_no(user_no);
	      System.out.println("여기보:"+bl.getLike_no());
	      int result = new QboardLikeService().like(bl);
	      System.out.println("서블릿1"+bl);
	      System.out.println("서블릿2"+bl.getPost_no());
	      System.out.println("서블릿3"+bl.getUser_no());
	      System.out.println("서블릿4"+result);
	      
	      RequestDispatcher view = request.getRequestDispatcher("/views/qboard/like.jsp");
	      view.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
