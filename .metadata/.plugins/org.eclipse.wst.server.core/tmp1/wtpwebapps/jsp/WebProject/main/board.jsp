<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Game Castle</title>
  <meta charset="EUC-KR">
  <link rel="stylesheet" href="./style.css" />
</head>

<body>
  <div class="login"><a href="login.jsp">Login</a>&nbsp;
 				     <a href="join.jsp">회원가입</a></div>
  
  <div class="serch">
 	<input type="text" placeholder="검색어 입력">
  	<button>검색</button>
  </div> 
  
  <h1 class="title"><a href="index.jsp">Game Castle</a></h1>
  
  <ul> 
  	<li class="list"><a href="index.jsp">메인	</a></li>
  	<li class="list">리스트</li>
  	<li class="list"><a href="board.jsp">게시판</a></li>
  </ul>
  <hr>
 <div id="grid">    		
  
    <ul class="genre">
    	<%String list = "action"; %>
    	<li><a href="action.jsp?list=<%=list%>">액션</a></li>
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
		<table>
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 50px">번호</th>
					<th style="background-color: #eeeeee; text-align: center; width: 100%">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width: 200px">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width: 200px">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<th>
				hello!!
				</th>
				</tr>
	      	</tbody>
	   	</table>
	  
		<a href="write.jsp" style="text-align:right;">글쓰기</a>
	</div>

  </div>
  </body>
  </html>