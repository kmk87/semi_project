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
import com.cm.board.vo.LocationGu;

@WebServlet("/qboard/create")
public class QBoardCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardCreateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       // location_gu 테이블의 데이터를 가져옴
        List<LocationGu> locationGuList = new QBoardService().getLocationGuList();
        request.setAttribute("locationGuList", locationGuList);
        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/create.jsp");
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
