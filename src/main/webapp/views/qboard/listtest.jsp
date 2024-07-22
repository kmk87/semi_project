<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <section>
        <div id="section_wrap">
            <div class="container ">
                <h3>게시글 목록</h3>
            </div><br>
            <div class="book_list">
                <table>
                    <thead>
                        <tr>
                            <th>게시글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>좋아요 수</th>
                        </tr>
                    </thead>
                    <tbody>
						<%@page import="com.cm.board.vo.QBoard, java.util.*" %>
						<%
							List<QBoard> list = (List<QBoard>)request.getAttribute("qbList");
							for(int i = 0 ; i < list.size(); i++){ %>
								<tr>
									<td><%=list.get(i).getPostNo()%></td>
									<td><%=list.get(i).getPostTitle()%></td>
									<td><%=list.get(i).getUserNo()%></td>
									<td><%=list.get(i).getPostModDate()%></td>
									<td><%=list.get(i).getLikeCount()%></td>																											
								</tr>
						<% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
 	<% QBoard paging = (QBoard)request.getAttribute("paging");%>
	<% if(paging != null){ %>
		<div class="center">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/qboard/list?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%}%>
				<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++) {%>
					<a href="/qboard/list?nowPage=<%=i%>" 
					<%=paging.getNowPage() == i ? "class='active'" : ""%>>
						<%=i%>
					</a>
				<%}%>
				<% if(paging.isNext()){%>
					<a href="/qboard/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
				<%}%>
			</div>
		</div>
	<% } %>

</body>
</html>