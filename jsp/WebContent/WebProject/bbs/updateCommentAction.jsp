<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="comment.*" %>
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
		} 
		
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		int commentNumber = 0;
		if (request.getParameter("commentNumber") != null) {
			commentNumber = Integer.parseInt(request.getParameter("commentNumber"));	
		}
		Comment comment = new CommentDAO().getComment(bbsID, commentNumber);  // 댓글을 수정하기 위해 댓글 정보를 가져온다.
		if (!userID.equals(comment.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			if (request.getParameter("updateComment").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
					CommentDAO commentDAO = new CommentDAO();
					String commentContent = request.getParameter("updateComment");
					int result = commentDAO.updateComment(commentContent, bbsID, commentNumber);
					if (result == -1) { //데이터베이스 오류
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('댓글 수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					} 
					else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('댓글 수정이 완료되었습니다.')");
						script.println("location.href = '../bbs/view.jsp?bbsID=" + bbsID + "'");
						script.println("</script>");
					}
				}
		}
		

	%>

</body>
</html>