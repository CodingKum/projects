<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<%@ page import="comment.*" %>
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
			script.println("location.href = '/jsp/WebProject/user/login.jsp'");
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
			script.println("location.href = '/jsp/WebProject/bbs/bbs.jsp'");
			script.println("</script>");
		}
		
		int commentNumber = 0;
		if (request.getParameter("commentNumber") != null) {
			commentNumber = Integer.parseInt(request.getParameter("commentNumber"));	
		}
		Comment comment = new CommentDAO().getComment(bbsID, commentNumber);  // 댓글을 수정하기 위해 댓글 정보를 가져온다.
		if (!userID.equals(comment.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			//script.println("location.href = 'history.back()'");
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
    
    
	<form action="updateCommentAction.jsp?bbsID=<%= bbsID %>&commentNumber=<%= commentNumber %>" method="post">
		날짜 : <%= comment.getCommentDate() %><br>
		ID : <%= comment.getUserID() %><br>
		내용 : <input type="text" placeholder="<%= comment.getCommentContent() %>" name="updateComment" required><br>
		<input type="button" value="취소" onclick="history.back()">
		<input type="submit" value="댓글 수정">
	</form>
	
  </div>
</body>
</html>