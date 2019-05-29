<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="file.*" %>
<%@ page import="bbs.*" %>    
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1"> <!-- 핸드폰에서 접속할 때 화면이 잘 나오도록 함.  -->
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
				try {
					String directory = application.getRealPath("/upload/");
					int maxSize = 1024 * 1024 * 100;
					String encoding = "UTF-8";
					
					MultipartRequest multipartRequest
					= new MultipartRequest(request, directory, maxSize, encoding,
							new DefaultFileRenamePolicy());
					

					
					//String path = request.getSession().getServletContext().getRealPath("WebProject/bbs/fileUpload/fileFolder");
					
					//int size = 1024 * 1024 * 10; //10Mbyte
					//MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
					
					String paramBbsTitle = multipartRequest.getParameter("bbsTitle");
					String paramBbsContent = multipartRequest.getParameter("bbsContent");
					Bbs bbs = new Bbs(0, paramBbsTitle, "", "", paramBbsContent, 0);
					if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('입력이 안 된 사항이 있습니다.')");
							script.println("history.back()");
							script.println("</script>");
					} else {
						if (multipartRequest.getFilesystemName("file") != null) {
							String fileName = multipartRequest.getOriginalFileName("file");
							String fileRealName = multipartRequest.getFilesystemName("file");
							
							BbsDAO bbsDAO = new BbsDAO();
							int bbsID = bbsDAO.getNext();
							
							new FilesDAO().upload(fileName, fileRealName, bbsID);
							out.write("파일명: " + fileName + "<br>");
							out.write("파일명: " + fileRealName + "<br>");
						}
 						/*if (multi.getFilesystemName("file") != null) {
							int fileNumber = -1;
							String file = "";
							String oriFile = "";
							
							Enumeration files = multi.getFileNames();
							String str = (String)files.nextElement();
							
							file = multi.getFilesystemName(str);
							oriFile = multi.getOriginalFileName(str);
							
							FilesDAO filesDAO = new FilesDAO();
							fileNumber = filesDAO.getFileID();
							
							BbsDAO bbsDAO = new BbsDAO();
							int bbsID = bbsDAO.getNext();
							
							filesDAO.insertFile(fileNumber, oriFile, path, bbsID);
							System.out.println(path);
						} */
						
						BbsDAO bbsDAO = new BbsDAO();
						int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
						if (result == -1) { //데이터베이스 오류
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
%>
</body>
</html>