<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.*" %>
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
  <title>Game Castle</title>
  <meta charset="EUC-KR">
</head>

<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�̹� �α����� �Ǿ��ֽ��ϴ�.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		
		String ParamUserID = (String)request.getParameter("userID");
		String ParamUserPassword = (String)request.getParameter("userPassword");
		User user = new User(ParamUserID, ParamUserPassword, "", "", "");
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1) { // �α��� ����
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		} 
		else if (result == 0 || result == -1) { //�α��� ����
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ���ϼ���.')");
			script.println("history.back()");
			script.println("</script>");
		}
/* 		else if (result == 0) { //��й�ȣ Ʋ��
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) { // ���̵� ����
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�������� �ʴ� ���̵��Դϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		} */
		else if (result == -2) { // �����ͺ��̽� ����
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�����ͺ��̽� ������ �߻��߽��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
  </body>
  </html>