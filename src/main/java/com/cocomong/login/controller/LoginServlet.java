package com.cocomong.login.controller;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		if("admin".equals(user_id) && "admin1234".equals("user_pw")) {
			HttpSession session = request.getSession();
			session.setAttribute("user_id", user_id);
			response.sendRedirect("welcome.jsp");
		}else {
			response.sendRedirect("login.jsp?error=true");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
