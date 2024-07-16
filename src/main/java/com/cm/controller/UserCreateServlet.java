package com.cm.controller;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 회원가입

@WebServlet("/user/create")
public class UserCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserCreateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String user_id = request.getParameter("user_id");
//		String user_pw = request.getParameter("user_pw");
//		String user_name = request.getParameter("user_name");
//		String user_email = request.getParameter("user_email");
//		String user_address = request.getParameter("user_address");
//		String user_nick = request.getParameter("user_nick");
//		
//		System.out.println(user_id+", "+user_pw+", "+user_name+", "+user_email+", "+user_address+", "+user_nick);
//		response.sendRedirect("login.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("/views/user/create.jsp");
		view.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
