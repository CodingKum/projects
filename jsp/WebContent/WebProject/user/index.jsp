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
  
  <h1 class="title"><a href="../user/index.jsp">Game Castle</a></h1>
  
  <ul> 
  	<li class="list"><a href="/jsp/WebProject/user/index.jsp">메인</a></li>
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
		 <table class="table1">
      <tr class="test1">
         <td class="test1">
            aaa-0<hr>
            aaa-1<hr>
            aaa-2<hr>
            aaa-3<hr>
            aaa-4<hr>
            <a href="https://store.steampowered.com"/>steam
         </td>
         <td class="test1">
            bbb-0<hr>
            bbb-1<hr>
            bbb-2<hr>
            bbb-3<hr>
            bbb-4<hr>
            <a href="https://www.fanatical.com/"/>fanatical
         </td>
      </tr>
      <tr class="test1">
         <td class="test1">
            ccc-0<hr>
            ccc-1<hr>
            ccc-2<hr>
            ccc-3<hr>
            ccc-4<hr>
            <a href="https://www.gamersgate.com/"/>gamersgate
         </td>
         <td class="test1">
            ddd-0<hr>
            ddd-1<hr>
            ddd-2<hr>
            ddd-3<hr>
            ddd-4<hr>
            <a href="https://www.gog.com/"/>gog</li>
         </td>
      </tr>
   </table>

	</div>

  </div>
  </body>
  </html>