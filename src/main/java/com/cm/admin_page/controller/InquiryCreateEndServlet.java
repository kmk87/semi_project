package com.cm.admin_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.admin_page.service.InquiryService;
import com.cm.admin_page.vo.Inquiry;

@WebServlet("/admin/inquiryFormEnd")
public class InquiryCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InquiryCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("inquiry_title");
		String text = request.getParameter("inquiry_text");
		
		Inquiry i = new Inquiry();
		i.setInquiry_title(title);
		i.setInquiry_text(text);
		
		int result = new InquiryService().createInquiry(i);
		
		if(result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("/views/admin_page/customer_center.jsp");
			view.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
