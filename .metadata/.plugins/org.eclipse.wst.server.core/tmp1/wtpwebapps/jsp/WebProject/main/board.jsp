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
 				     <a href="join.jsp">ȸ������</a></div>
  
  <div class="serch">
 	<input type="text" placeholder="�˻��� �Է�">
  	<button>�˻�</button>
  </div> 
  
  <h1 class="title"><a href="index.jsp">Game Castle</a></h1>
  
  <ul> 
  	<li class="list"><a href="index.jsp">����	</a></li>
  	<li class="list">����Ʈ</li>
  	<li class="list"><a href="board.jsp">�Խ���</a></li>
  </ul>
  <hr>
 <div id="grid">    		
  
    <ul class="genre">
    	<%String list = "action"; %>
    	<li><a href="action.jsp?list=<%=list%>">�׼�</a></li>
    	<br>
    	<li>��庥��</li>
    	<br>
    	<li>���̽�</li>
    	<br>
    	<li>������</li>
    	<br>
    	<li>����/FPS</li>
    	<br>
    	<li>����</li>
    	<br>
    	<li>�ùķ��̼�</li>
    	<br>
    	<li>��Ÿ</li>
    </ul>
	<div class="White space">
		<table>
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 50px">��ȣ</th>
					<th style="background-color: #eeeeee; text-align: center; width: 100%">����</th>
					<th style="background-color: #eeeeee; text-align: center; width: 200px">�ۼ���</th>
					<th style="background-color: #eeeeee; text-align: center; width: 200px">�ۼ���</th>
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
	  
		<a href="write.jsp" style="text-align:right;">�۾���</a>
	</div>

  </div>
  </body>
  </html>