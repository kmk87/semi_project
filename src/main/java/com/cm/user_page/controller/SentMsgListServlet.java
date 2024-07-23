package com.cm.user_page.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.vo.User;
import com.cm.user_page.service.MsgService;
import com.cm.user_page.vo.Message;

@WebServlet("/sentMsg/list")
public class SentMsgListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SentMsgListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 사용자 정보 가져오기
        HttpSession session = request.getSession(false); // false로 설정하여 새 세션 생성 안 함
        if (session != null) {
            // 세션에서 사용자 객체 가져오기
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userNo = user.getUser_no();
				Message option = new Message();
				option.setSender_no(userNo);
				
				String nowPage = request.getParameter("nowPage");
				if(nowPage != null) {
					option.setNowPage(Integer.parseInt(nowPage));
				}
				
				option.setTotalData(new MsgService().selectSentMsgCount(option));
				
				List<Message> list = new MsgService().selectSentMsgList(option);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/user_page/sent_msg_list.jsp");
				request.setAttribute("resultList", list);
				request.setAttribute("paging", option);
				view.forward(request, response);
            }
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
