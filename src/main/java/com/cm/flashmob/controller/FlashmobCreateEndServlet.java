package com.cm.flashmob.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/flashmob/createEnd")
public class FlashmobCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 아직 유저 로그인 구현 전
		int user = 1;
		int boardtype = 3;
		int local_gu=1;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		if(ServletFileUpload.isMultipartContent(request)) {
			String dir = request.getServletContext().getRealPath("/upload");
			int maxSize = 1024*1024*10; // 10mb
			String encoding ="UTF-8";
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			MultipartRequest mr = new MultipartRequest(request,dir,maxSize,encoding,dfr);
			
			String oriName = mr.getOriginalFileName("thumbnail");
			String reName = mr.getFilesystemName("thumbnail");
			
			String title = mr.getParameter("flashmob_post_title");
			LocalDateTime time = LocalDateTime.parse(mr.getParameter("flashmob_time"),formatter);
			String text = mr.getParameter("flashmob_post_text");
			String location = mr.getParameter("flashmob_location");
			int number = Integer.parseInt(mr.getParameter("flashmob_number"));
			String privacy = mr.getParameter("privacy");
			if (privacy == null) {
			    privacy = "Y";
			}else {
				privacy="N";
			}
			HttpSession session = request.getSession(false);
			
			Flashmob f = new Flashmob();
			f.setFlashmob_location(location);
			f.setFlashmob_date(time);
			f.setFlashmob_number(number);
			f.setPost_title(title);
			f.setPost_text(text);
			f.setPost_release_yn(privacy);
			f.setUser_no(user);
			f.setBoard_type_id(boardtype);
			f.setLocal_gu_no(local_gu);
			
			int result = new FlashmobService().createFlashmob(user,boardtype,local_gu,f);
			RequestDispatcher view = request.getRequestDispatcher("/views/flashmob/create_fail.jsp");
			if(result>0) {
				view=request.getRequestDispatcher("/views/flashmob/create_success.jsp");
			}
			view.forward(request, response);
		}else {
			response.sendRedirect("flashmob/create");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
