<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일체크 JSP 페이지</title>
</head>

<%
request.setCharacterEncoding("utf-8");
String file = request.getParameter("file");
String oriFile = request.getParameter("oriFile");
%>

<body>
파일명 : <a href="fileFolder/<%=oriFile%>"><%=oriFile%></a><br/>
</body>