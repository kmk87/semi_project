package com.cm.flashmob.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.flashmob.service.FlashmobLikeService;
import com.cm.flashmob.vo.FlashmobLike;
import com.cm.user.vo.User;

@WebServlet("/flashmob/like")
public class FlashmobLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FlashmobLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session!=null) {
			User user = (User)session.getAttribute("user");
			if(user!=null) {
				int user_no=user.getUser_no();
		int post_no=Integer.parseInt(request.getParameter("post_no"));
		FlashmobLike fl = new FlashmobLike();
		fl.setPost_no(post_no);
		fl.setLike_user_no(user_no);
		int result = new FlashmobLikeService().like(fl);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob/like.jsp");
		view.forward(request, response);
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
