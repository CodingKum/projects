<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%@ page import="file.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	
	out.clear();  // getOutputStream() has already been called 오류 제거하기 위함.
	out = pageContext.pushBody(); // 위와 동일

	OutputStream output = response.getOutputStream();
	InputStream input = null;
	int fileNumber = 0; //초기값
	
	FilesDAO filesDAO = new FilesDAO();
	//fileNumber = Integer.parseInt(request.getParameter("fileNumber"));
	fileNumber = 6;
	input = filesDAO.getFile(fileNumber);
	
	int byteRead;
    while((byteRead = input.read()) != -1) {
    	output.write(byteRead);
    }
    
%>
</body>
</html>