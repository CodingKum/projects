<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 핸드폰에서 접속할 때 화면이 잘 나오도록 함.  -->
<title>게시판</title>
<link rel="stylesheet" href="../../css/style.css" />
</head>
<body>
	<div class="login">
	  	<%
  		String sessionID = null;
  		if (session.getAttribute("userID") != null) {
  			sessionID = session.getAttribute("userID").toString();
  		}
  		
  		if (sessionID != null) {
	  	%>
  			<% if (sessionID.equals("admin")) {%>
  					관리자 모드&nbsp;&nbsp;
  					<a href="/jsp/WebProject/user/logout.jsp">Logout</a>
  			<% } else { %>
  					<%= sessionID %>님 반갑습니다!&nbsp;&nbsp;
		  			<a href="/jsp/WebProject/user/logout.jsp">Logout</a>&nbsp;
		  			<a href="/jsp/WebProject/user/login.jsp">MyPage</a>
  			<% } %>
	  	<%
	  		} else {
	  	%>
		  	<a href="/jsp/WebProject/user/login.jsp">Login</a>&nbsp;
		 	<a href="/jsp/WebProject/user/join.jsp">회원가입</a>
		 <%
	  		}
		 %>
	</div>
  
	<div class="serch">
		<input type="text" placeholder="검색어 입력">
		<button>검색</button>
	</div> 
  
  <h1 class="title"><a href="../user/index.jsp">Game Castle</a></h1>
  
  <ul> 
  	<li class="list"><a href="../user/index.jsp">메인	</a></li>
  	<li class="list">리스트</li>
  	<li class="list"><a href="../bbs/bbs.jsp">게시판</a></li>
  </ul>
  <hr>
 <div id="grid">    		
  
    <ul class="genre">
    	<li><a href="action.jsp">액션</a></li>
    	<br>
    	<li>어드벤쳐</li>
    	<br>
    	<li>레이싱</li>
    	<br>
    	<li>스포츠</li>
    	<br>
    	<li>슈팅/FPS</li>
    	<br>
    	<li>퍼즐</li>
    	<br>
    	<li>시뮬래이션</li>
    	<br>
    	<li>기타</li>
    </ul>
    <%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 600px">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 300px">작성자</th>
						<th style="background-color: #eeeeee; text-align: center; width: 200px">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i=0; i<list.size(); i++) {
							%>
							<tr>
								<td><%= list.get(i).getBbsID()  %></td>
								<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
								<td><%= list.get(i).getUserID()  %></td>
								<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분 "  %></td>
							</tr> 
							<%
						}
					%>
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>	
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if (bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arraw-right">다음</a>
			<%
				}
			%>
			
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			
		</div>
	</div>
  </div>
</body>
</html>