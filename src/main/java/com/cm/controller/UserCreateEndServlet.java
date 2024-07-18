package com.cm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.service.UserService;
import com.cm.vo.User;


@WebServlet(name="userCreateEnd",urlPatterns="/user/createEnd")
public class UserCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserCreateEndServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_email = request.getParameter("user_email");
		String user_address = request.getParameter("user_address");
		String user_nick = request.getParameter("user_nick");
		
		UserService userService = new UserService();
        int idCheckResult = userService.check(user_id);
        int nickCheckResult = userService.checkNick(user_nick);

        if (idCheckResult != 1) {
            request.setAttribute("errorMessage", "아이디 중복 확인을 완료해주세요.");
            RequestDispatcher view = request.getRequestDispatcher("/views/user/create_fail.jsp");
            view.forward(request, response);
            return;
        }

        if (nickCheckResult != 1) {
            request.setAttribute("errorMessage", "닉네임 중복 확인을 완료해주세요.");
            RequestDispatcher view = request.getRequestDispatcher("/views/user/create_fail.jsp");
            view.forward(request, response);
            return;
        }
		
		User u = new User();
		u.setUser_id(user_id);
		u.setUser_pw(user_pw);
		u.setUser_email(user_email);
		u.setUser_address(user_address);
		u.setUser_nick(user_nick);
		
		
		
		int result = new UserService().createUser(u);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/user/create_fail.jsp");
		if(result > 0) {
			view = request.getRequestDispatcher("/views/user/create_success.jsp");
			
		}
		
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
