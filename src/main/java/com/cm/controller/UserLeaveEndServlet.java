package com.cm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.dao.UserDao;
import com.cm.service.UserService;
import com.cm.vo.User;


@WebServlet(name="userLeaveEnd",urlPatterns="/user/userLeaveEnd")
public class UserLeaveEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserLeaveEndServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String password = request.getParameter("password");
        System.out.println(password);

        if (user != null && password != null) {
            UserService us = new UserService();
            boolean isDeleted = us.deleteUser(user.getUser_id(), password);
            System.out.println(isDeleted);

            	if (isDeleted) {
            		session.invalidate(); // 세션 무효화
               
            		RequestDispatcher view = request.getRequestDispatcher("/views/user/userLeave_success.jsp");
            		view.forward(request,response);
            	} else {
            		RequestDispatcher view = request.getRequestDispatcher("/views/user/userLeave_fail.jsp");
            		view.forward(request,response);
            	}
         } else {
        	RequestDispatcher view = request.getRequestDispatcher("/");
        	view.forward(request,response);
        	
         }
        
	
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
