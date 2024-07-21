package com.cm.sale_share_board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.sale_share_board.service.SaleShareBoardService;
import com.cm.sale_share_board.vo.SaleShareList;


@WebServlet("/sale_share_board/share_array")
public class SaleShareBoardArrayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaleShareBoardArrayServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleShareList option = new SaleShareList();
		String array = request.getParameter("array");
		int arrayInt = Integer.parseInt(array);
		String nowPage = request.getParameter("nowPage");
		
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		option.setTotalData(new SaleShareBoardService().selectListCount(option));
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		
		switch(arrayInt) {
			case 0 : response.sendRedirect(request.getContextPath() +"/sale_share_board/sale_share_board_list");
			case 1 : list = new SaleShareBoardService().selectSaleSearchText(arrayInt); break;
			case 2 : list = new SaleShareBoardService().selectSaleSearchNic(arrayInt); break;
		}
		
		
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);

		
		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_search_list.jsp");
		view.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
