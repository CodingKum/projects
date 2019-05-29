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
		String ParamUserID = request.getParameter("userID");
		String ParamUserPassword = request.getParameter("userPassword");
		String ParamUserName = request.getParameter("userName");
		String ParamUserGender = request.getParameter("userGender");
		String ParamUserEmail = request.getParameter("userEmail");
		User user = new User(ParamUserID, ParamUserPassword, ParamUserName, ParamUserGender, ParamUserEmail);
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		if (user.getUserID() == null || user.getUserPassword() == null || 
			user.getUserName() == null || user.getUserGender() == null || 
			user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				// 같은 아이디 사용 = DB 오류(id가 프라이머리키임.)
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
			}
		}

	%>
</body>
</html>