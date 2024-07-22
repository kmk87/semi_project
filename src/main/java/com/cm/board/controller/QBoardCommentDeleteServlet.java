package com.cm.board.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.board.service.QBoardCommentService;

@WebServlet("/qboard/comment/delete")
public class QBoardCommentDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QBoardCommentDeleteServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int commentNo = Integer.parseInt(request.getParameter("comment_no"));
        int postNo = Integer.parseInt(request.getParameter("post_no"));
        
        int result = new QBoardCommentService().deleteComment(commentNo);
        
        if (result > 0) {
            response.sendRedirect("/qboard/detail?post_no=" + postNo);
        } else {
            response.sendRedirect("/views/qboard/comment_delete_fail.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}