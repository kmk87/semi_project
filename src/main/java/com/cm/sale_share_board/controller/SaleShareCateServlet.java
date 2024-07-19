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


@WebServlet("/sale_share_board/sale_share_board_cate")
public class SaleShareCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaleShareCateServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("post_title");
		
		String cate = request.getParameter("key");
		
		SaleShareList option = new SaleShareList();
//		option.setPost_title(title);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		option.setTotalData(new SaleShareBoardService().selectListCount(option));
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		
		if(cate.equals("free")) {
			list = new SaleShareBoardService().selectShare(option);
			
		}else if(cate.equals("share")) {
			list = new SaleShareBoardService().selectSale(option);
			
		}else {
			list = new SaleShareBoardService().selectSaleBoardList(option);
		}
		
		
		
		
//		int result = new SaleShareBoardService().selectSaleLikeCount(option);
		
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
//		request.setAttribute("like", result);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_board_list.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
