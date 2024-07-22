package com.cm.flashmob.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.flashmob.service.FlashmobApplyService;


@WebServlet("/flashmob/accept")
public class FlashmobApplyAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobApplyAccept() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int app_no = Integer.parseInt(request.getParameter("applyNo"));
		System.out.println("여기보세요 : "+app_no);
		String yn = request.getParameter("yn");
		int result = new FlashmobApplyService().accept(yn,app_no);
		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob/accept.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
