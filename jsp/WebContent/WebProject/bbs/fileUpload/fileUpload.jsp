<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="file.*" %>
<%@ page import="bbs.*" %>    
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
	String path = request.getSession().getServletContext().getRealPath("WebProject/bbs/fileUpload/fileFolder");
	//System.out.println(path);
	int size = 1024 * 1024 * 10; //10Mbyte
	int fileNumber = -1;
	String file = "";
	String oriFile = "";
	
	try {
		System.out.println("파일 업로드 도착");
		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		System.out.println("파일 업로드 도착2");
		Enumeration files = multi.getFileNames();
		System.out.println("파일 업로드 도착3");
		String str = (String)files.nextElement();
		System.out.println("파일 업로드 도착4");
		
		file = multi.getFilesystemName(str);
		oriFile = multi.getOriginalFileName(str);
		System.out.println(path + "\\" + oriFile);
		//System.out.println(oriFile);
		System.out.println("111111111111");
		
		
		FilesDAO filesDAO = new FilesDAO();
		fileNumber = filesDAO.getFileID();
		
		
		System.out.println("1222222222");
		System.out.println("파일 번호 : " + fileNumber);
		
		BbsDAO bbsdao = new BbsDAO();
		int bbsID = bbsdao.getNext();
		System.out.println("fileNumber : " + fileNumber);
		System.out.println("file : " + file);
		System.out.println("orifile : " + oriFile);
		System.out.println("path : " + path);
		System.out.println("bbsID : " + bbsID);
		
		filesDAO.insertFile(fileNumber, oriFile, path, bbsID);
		
		//System.out.println("writeAction.jsp로 갑니다");
		//response.sendRedirect("../writeAction.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%-- <form method="post" action="fileCheck2.jsp" name="fileCheck2">
	<input type="hidden" name="file" value="<%= file %>">
	<input type="hidden" name="oriFile" value="<%= oriFile %>">
</form>
<a href="#" onclick="javascript:fileCheck2.submit()">페이지에서 업로드 즉시 확인 </a>
<br><br>
--%>

<form method="post" action="fileLoad.jsp" name="fileLoad">
	<input type="hidden" name="file" value="<%= file %>">
	<input type="hidden" name="oriFile" value="<%= oriFile %>">
	<input type="hidden" name="fileNumber" value="<%= fileNumber %>">
</form>
<a href="#" onclick="javascript:fileLoad.submit()">DB 업로드 확인 </a>
<br>

<a href="../writeAction.jsp">writeAction으로 이동.</a>

</body>
</html>