package com.cm.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cm.board.service.QBoardService;
import com.cm.board.vo.QBoard;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/qboard/updateEnd")
public class QBoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardUpdateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			String dir = request.getServletContext().getRealPath("/upload");
			int maxSize = 1024 * 1024 * 10;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			MultipartRequest mr = new MultipartRequest(request, dir,maxSize,encoding,dfr);
			String oriName = mr.getOriginalFileName("imageName");
			String newName = mr.getFilesystemName("imageName");
            String postNoParam = mr.getParameter("post_no");

            System.out.println("post_no parameter: " + postNoParam);
			int postNo = Integer.parseInt(mr.getParameter("post_no"));
			System.out.println("postno"+postNo);
			String title = mr.getParameter("post_title");
			String text = mr.getParameter("post_text");
			String postReleaseYn = mr.getParameter("post_release_yn");


			System.out.println(postNo);
			System.out.println("제목"+title);
			System.out.println("내용"+text);
			System.out.println("공개"+postReleaseYn);
			QBoard qb = new QBoard();
			qb.setPostNo(postNo);
			qb.setPostTitle(title);
			qb.setPostText(text);
			qb.setPostReleaseYn(postReleaseYn);
			qb.setImageOriName(oriName);
			qb.setImageNewName(newName);
			HttpSession session = request.getSession(false);
			int result = new QBoardService().updateBoard(qb);
			 System.out.println("Update result2: " + result); // 로그 출력
			RequestDispatcher view = request.getRequestDispatcher("/views/qboard/update_fail.jsp");
			if(result > 0) {
				view = request.getRequestDispatcher("/views/qboard/update_success.jsp");
			}
			view.forward(request, response);
		}else {
			response.sendRedirect("/qboard/update.jsp");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
