package com.cm.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.board.service.QBoardService;
import com.cm.board.vo.QBoard;


@WebServlet("/qboard/list")
public class QBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public QBoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("post_title");
		System.out.println("제목"+title);
		QBoard qb = new QBoard();
		qb.setPostTitle(title);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			qb.setNowPage(Integer.parseInt(nowPage));
		}
		
		qb.setTotalData(new QBoardService().selectBoardCount(qb));
			
		List<QBoard> list = new QBoardService().selectBoardList(qb);
		
		request.setAttribute("paging",qb);
		request.setAttribute("qbList",list);
		
		System.out.println("totaldata"+qb.getTotalData());
		System.out.println(list);
		System.out.println("listsize"+ list.size());
		
		RequestDispatcher view = request.getRequestDispatcher("/views/qboard/list.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
