package com.cm.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;


@WebServlet("/user/pwChangeEnd")
public class PwChangeEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PwChangeEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User u = new User();
		UserService us = new UserService();

		String id = request.getParameter("user_id");
		String email = request.getParameter("user_email");
		String newPw = request.getParameter("pwChange");
		String pwCheck = us.passwordCheck(id);
		 
		 
		if(pwCheck != null && pwCheck.equals(newPw)) {
			response.getWriter().write("error_same_password");
            return;
			}
		
		boolean pwCh = us.changePw(id,email,newPw);
		
		if(pwCh) {
			response.getWriter().write("success"); // 성공 응답
		} else {
			response.getWriter().write("error_failed_to_change"); // 실패 응답
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
