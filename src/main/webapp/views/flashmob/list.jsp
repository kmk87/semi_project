<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href='../../resources/css/flashmob/list.css' rel="stylesheet" type="text/css">
<link href='../../resources/css/flashmob/paging.css' rel="stylesheet" type="text/css">
<style>
        a {
            color: inherit;
            text-decoration: none;
        }
        a:visited {
            color: inherit;
        }
        a:hover {
            text-decoration: none;
        }
        a:active {
            text-decoration: none;
        }
    </style>
</head>
<body>

	<section>
		<div id="section_wrap">
			<div id="word">
				<h3>게시글 목록</h3>
			</div><br>
			<div class="flashmob_list">
			<table>
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="40%">
					<col width="15%">					
					<col width="5%">
					<col width="10%">
					<col width="5%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>지역</th>
						<th>제목</th>
						<th>남은시간</th>
						<th>작성일</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<%@ page import="com.cm.flashmob.vo.Flashmob, java.util.*" %>
					<% 	List<Flashmob> list = (List<Flashmob>)request.getAttribute("resultList");
						for(int i=0;i<list.size();i++){%>
							<tr>
								<td><%=list.get(i).getPost_no() %></td>
								<td><%=list.get(i).getFlashmob_location() %></td>
								<td><a href="/flashmob/check?post_no=<%=list.get(i).getPost_no()%>"><%=list.get(i).getPost_title() %></a></td>
								<td id ="timer" data-end-time="<%= list.get(i).getFlashmob_date() %>">Loading...</td>
								<td><%=list.get(i).getPost_reg_date() %></td>
								<td><%=list.get(i).getUser_no() %></td>
								<td><%=list.get(i).getBoard_type_id() %></td>
								<td><%=list.get(i).getLike_count() %></td>

							</tr>
						<%} %>
				</tbody>
				</table>
			</div>
		</div>

	</section>
	<%Flashmob paging=(Flashmob)request.getAttribute("paging"); %>	
	<%if(paging != null){ %>
		<div class="center">
			<div id="pagination">
				<%if(paging.isPrev()){ %>
					<a href="/flashmob/list?nowPage=<%=(paging.getPageBarStart()-1)%>">&laquo;</a>
				<% } %>
				<% for(int i=paging.getPageBarStart();i<=paging.getPageBarEnd();i++){ %>
					<a href="/flashmob/list?nowPage=<%=i %>"<%=paging.getNowPage()==i?"class='active'":"" %>><%=i %></a>
				<% } %>
				<%if(paging.isNext()){ %>
					<a href="/flashmob/list?nowPage=<%=(paging.getPageBarEnd()+1) %>">&raquo;</a>
				<% } %>
				
			</div>
		</div>
	<%} %>
	
	
</body>
</html>