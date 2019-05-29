<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Game Castle</title>
  <meta charset="EUC-KR">
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
  
  <h1 class="title"><a href="index.jsp">Game Castle</a></h1>
  
  <ul> 
  	<li class="list"><a href="index.jsp">메인	</a></li>
  	<li class="list">리스트</li>
  	<li class="list">게시판</li>
  </ul>
  <hr>
 <div id="grid">    		
    <ul class="genre">
    	<li><a href="action.jsp">액션</a></li><br>
    	<li>어드벤쳐</li><br>
    	<li>레이싱</li><br>
    	<li>스포츠</li><br>
    	<li>슈팅/FPS</li><br>
    	<li>퍼즐</li><br>
    	<li>시뮬래이션</li><br>
    	<li>기타</li>
    </ul>

  	<form method="post" action="joinAction.jsp">
		<h3 style="text-align: center;">회원가입</h3>
		<div class="form-group">
			<input type="text" placeholder="아이디" name="userID" maxlength="20">
		</div>
		<div class="form-group">
			<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
		</div>
		<div class="form-group">
			<input type="text" placeholder="이름" name="userName" maxlength="20">
		</div>
		
		<div class="form-group">
			<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
			<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
		</div>
		
		<div class="form-group">
			<input type="email" placeholder="이메일" name="userEmail" maxlength="20">
		</div>
		
		<div class="form-group">
			<input type="submit" value="회원가입">
		</div>
	</form>
	
  
  </div>
  </body>
  </html>