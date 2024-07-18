package com.cm.flashmob.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.flashmob.service.FlashmobApplyService;
import com.cm.flashmob.vo.FlashmobApply;

@WebServlet("/flashmob/apply")
public class FlashmobApplyEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobApplyEnd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String introduce = request.getParameter("introduce");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		FlashmobApply fa = new FlashmobApply();
		fa.setPost_no(postNo);
		fa.setApplication_text(introduce);
		fa.setUser_no(1);
		int result = new FlashmobApplyService().createApply(fa);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
