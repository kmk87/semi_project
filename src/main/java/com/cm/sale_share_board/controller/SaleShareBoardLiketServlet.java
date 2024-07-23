package com.cm.sale_share_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.sale_share_board.service.SaleShareBoardService;
import com.cm.sale_share_board.vo.SaleShareLike;


@WebServlet("/sale_share_board/like")
public class SaleShareBoardLiketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaleShareBoardLiketServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String post = request.getParameter("id");
		int postNo = Integer.parseInt(post);
	     int user_no=1;
	     SaleShareLike like = new SaleShareLike();
	     like.setPost_no(postNo);
	     like.setLike_user_no(user_no);
	     int result = new SaleShareBoardService().saleLike(like);
	      
	      
	     response.sendRedirect(request.getContextPath() +"/sale_share_board/sale_share_board_detail?id="+postNo);
	   }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
