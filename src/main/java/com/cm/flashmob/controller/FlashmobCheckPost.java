package com.cm.flashmob.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;


@WebServlet("/flashmob/check")
public class FlashmobCheckPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FlashmobCheckPost() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_no = Integer.parseInt(request.getParameter("post_no"));

		Flashmob check = new FlashmobService().checkPost(post_no);
		request.setAttribute("post", check);

		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob/check_post.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
