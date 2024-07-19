package com.cm.sale_share_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cm.sale_share_board.service.SaleShareBoardService;
import com.cm.sale_share_board.vo.SaleShareBoard;
import com.cm.sale_share_board.vo.SaleShareImage;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/saleShare/edit")
public class SaleShareEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaleShareEditEndServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			 // 2. 파일 저장 위치 설정
			 String dir = request.getServletContext().getRealPath("upload"); // 기본이 webapp에서 시작
			 // 3. 저장 파일의 최대 크기 설정(10MB) byte = 1024
			 int maxSize = 1024 * 1024 * 10;
			 // 4. 인코딩 설정
			 String encoding = "UTF-8";
			 // 5. Rename 클래스
			 DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			 //6. MultipartRequest 객체 매개변수(5개) 
			 // HttpServletRequest, 저장위치, 최대크기, 인코딩, Rename 규칙
			 MultipartRequest mr = new MultipartRequest(request,dir,maxSize,encoding,dfr);
			 // 7. 파일명 정보
			 String oriName = mr.getOriginalFileName("thumbnail");
			 String reName = mr.getFilesystemName("thumbnail");
			 System.out.println(oriName+"->"+reName);
			 
			 String name = mr.getParameter("post_title");
			 String price = mr.getParameter("prod_price");
			 int priceInt = Integer.parseInt(price);
			 String cate = mr.getParameter("prod_cate");
			 int cateInt = Integer.parseInt(cate);
			 String deal = mr.getParameter("deal_status");
			 int dealStatus = Integer.parseInt(deal);
			 
			 
			 String post = mr.getParameter("postNo");
			 int postNo = Integer.parseInt(post);
			 System.out.println("엔드서블릿 : "+postNo);
			 
			 
			 
			 
			 
			 String place = mr.getParameter("place_label");
			 String text = mr.getParameter("post_text");
//			 String deal = mr.getParameter("deal_label");
			 HttpSession session = request.getSession(false);
			 
			 SaleShareBoard ssb = new SaleShareBoard();
			 SaleShareImage ssi = new SaleShareImage();
			 
			 ssb.setPost_title(name);
			 ssb.setPost_text(text);
			 ssb.setProd_price(priceInt);
			 ssb.setCate_code(cateInt);
			 ssi.setImage_ori_name(oriName);
			 ssi.setImage_new_name(reName);
			 ssb.setDeal_status(dealStatus);
			
//			 if(session != null) {
//				 User u  = (User)session.getAttribute("user");
//				 int userNo = u.getUser_no();
//				 ssb.setUser_no(userNo);
//			 }
			 // board 객체에 정보 담기
			 
			 
			 int result = new SaleShareBoardService().saleEdit(postNo,ssb,ssi);
			 RequestDispatcher view = null;
				if(result > 0) {
					view = request.getRequestDispatcher("/index.jsp");
					view.forward(request, response);
				}
				else {
					view = request.getRequestDispatcher("/views/sale_share_board/sale_share_borad_detail.jsp");
					view.forward(request, response);
					
				}
	
			}else {
				response.sendRedirect("/index.jsp");
			}
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
