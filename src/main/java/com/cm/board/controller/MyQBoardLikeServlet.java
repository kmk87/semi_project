package com.cm.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.board.service.QBoardService;
import com.cm.board.vo.QBoard;
import com.cm.user.vo.User;


@WebServlet("/user/myLikes")
public class MyQBoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyQBoardLikeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User currentUser = (User) session.getAttribute("user");
            if (currentUser != null) {
              
                List<QBoard> likedPosts = new QBoardService().getLikedPosts(currentUser.getUser_no());

                request.setAttribute("likedPosts", likedPosts);
                request.getRequestDispatcher("/views/user/myQBoardLike.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
