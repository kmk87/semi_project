package com.cm.user_page.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;
import com.cm.user.vo.User;

@WebServlet("/user/MylikeFlashmob")
public class MyLikeFlashmob extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyLikeFlashmob() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session!=null) {
			User user = (User)session.getAttribute("user");
			if(user!=null) {
			int userNo = user.getUser_no();
			List<Flashmob> mylikelist = new FlashmobService().mylikeFlashmob(userNo);
			request.setAttribute("mylike", mylikelist);
			RequestDispatcher view = request.getRequestDispatcher("/views/user_page/mylike_flashmob.jsp");
			view.forward(request, response);
		}}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
