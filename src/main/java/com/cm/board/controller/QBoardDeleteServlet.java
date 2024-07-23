package com.cm.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.board.service.QBoardService;

@WebServlet("/qboard/delete")
public class QBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       int postNo = Integer.parseInt(request.getParameter("post_no"));
	        QBoardService service = new QBoardService();
	        boolean isDeleted = service.deleteBoard(postNo);

	        if (isDeleted) {
	            response.sendRedirect(request.getContextPath() + "/qboard/list");
	        } else {
	            request.setAttribute("errorMessage", "게시글 삭제에 실패했습니다.");
	            request.getRequestDispatcher("/views/qboard/qboard_detail.jsp").forward(request, response);
	        }
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
