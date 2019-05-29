<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 핸드폰에서 접속할 때 화면이 잘 나오도록 함.  -->
<link rel="stylesheet" href="../../css/style.css" />
<script src="test.js"></script>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다..')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
	%>
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
  					<a href="logout.jsp">Logout</a>
  			<% } else { %>
  					<%= sessionID %>님 반갑습니다!&nbsp;&nbsp;
		  			<a href="logout.jsp">Logout</a>&nbsp;
		  			<a href="login.jsp">MyPage</a>
  			<% } %>
	  	<%
	  		} else {
	  	%>
		  	<a href="login.jsp">Login</a>&nbsp;
		 	<a href="join.jsp">회원가입</a>
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
	<div class="White space">
		<div class="container">
			<div class="row">
				<form action="updateAction.jsp?bbsID=<%= bbsID %>" method="post">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%= bbs.getBbsContent() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="button" value="취소" onclick="history.back()">
					<input type="submit" class="btn btn-primary pull-right" value="글수정">
				</form>
			</div>
		</div>
	</div>
  </div>
</body>
</html>