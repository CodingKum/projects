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
  					������ ���&nbsp;&nbsp;
  					<a href="logout.jsp">Logout</a>
  			<% } else { %>
  					<%= sessionID %>�� �ݰ����ϴ�!&nbsp;&nbsp;
		  			<a href="logout.jsp">Logout</a>&nbsp;
		  			<a href="login.jsp">MyPage</a>
  			<% } %>
	  	<%
  		} else {
	  	%>
		  	<a href="login.jsp">Login</a>&nbsp;
		 	<a href="join.jsp">ȸ������</a>
		 <%
	  		}
		 %>
	</div>
  
  <div class="serch">
 	<input type="text" placeholder="�˻��� �Է�">
  	<button>�˻�</button>
  </div> 
  
  <h1 class="title"><a href="index.jsp">Game Castle</a></h1>
  
  <ul> 
  	<li class="list"><a href="index.jsp">����	</a></li>
  	<li class="list">����Ʈ</li>
  	<li class="list">�Խ���</li>
  </ul>
  <hr>
 <div id="grid">    		
    <ul class="genre">
    	<li><a href="action.jsp">�׼�</a></li><br>
    	<li>��庥��</li><br>
    	<li>���̽�</li><br>
    	<li>������</li><br>
    	<li>����/FPS</li><br>
    	<li>����</li><br>
    	<li>�ùķ��̼�</li><br>
    	<li>��Ÿ</li>
    </ul>

  	<form method="post" action="joinAction.jsp">
		<h3 style="text-align: center;">ȸ������</h3>
		<div class="form-group">
			<input type="text" placeholder="���̵�" name="userID" maxlength="20">
		</div>
		<div class="form-group">
			<input type="password" placeholder="��й�ȣ" name="userPassword" maxlength="20">
		</div>
		<div class="form-group">
			<input type="text" placeholder="�̸�" name="userName" maxlength="20">
		</div>
		
		<div class="form-group">
			<input type="radio" name="userGender" autocomplete="off" value="����" checked>����
			<input type="radio" name="userGender" autocomplete="off" value="����" checked>����
		</div>
		
		<div class="form-group">
			<input type="email" placeholder="�̸���" name="userEmail" maxlength="20">
		</div>
		
		<div class="form-group">
			<input type="submit" value="ȸ������">
		</div>
	</form>
	
  
  </div>
  </body>
  </html>