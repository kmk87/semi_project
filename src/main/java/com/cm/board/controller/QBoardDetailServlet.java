package com.cm.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.board.service.QBoardCommentService;
import com.cm.board.service.QBoardService;
import com.cm.board.vo.QBoard;
import com.cm.board.vo.QBoardComment;
import com.cm.user.vo.User;


@WebServlet("/qboard/detail")
public class QBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QBoardDetailServlet() {
        super();

    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("post_no"));
		System.out.println(postNo);
		QBoard result = new QBoardService().getQBoard(postNo); 
		System.out.println(result);
		List<QBoardComment> commentList = new QBoardCommentService().selectCommentsList(postNo);
		 for (QBoardComment comment : commentList) {
	            System.out.println(comment.getCommentText()); // 댓글 내용 출력
	        }
	    HttpSession session = request.getSession(false);
	     if (session != null) {
	        User u = (User) session.getAttribute("user");
	         if (u != null) {
	             int userNo = u.getUser_no();
	             // 여기에서 사용자 정보를 필요한 경우 사용할 수 있습니다.
	             // 예를 들어, result.setUserNo(userNo);와 같은 방식으로 사용할 수 있습니다.
	             System.out.println("User No: " + userNo);
	            } else {
	             System.out.println("User not found in session.");
	            }
	      } else {
	         System.out.println("Session not found.");
	      }

		request.setAttribute("qboard", result);
		request.setAttribute("commentList", commentList);
		RequestDispatcher view = request.getRequestDispatcher("/views/qboard/qboard_detail.jsp");
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
