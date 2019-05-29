/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.17
 * Generated at: 2019-05-26 18:09:33 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WebProject.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <title>Game Castle</title>\r\n");
      out.write("  <meta charset=\"EUC-KR\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"../../css/style.css\" />\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"login\">\r\n");
      out.write("\t  \t");

  		String sessionID = null;
  		if (session.getAttribute("userID") != null) {
  			sessionID = session.getAttribute("userID").toString();
  		}
  		
  		if (sessionID != null) {
	  	
      out.write("\r\n");
      out.write("  \t\t\t");
 if (sessionID.equals("admin")) {
      out.write("\r\n");
      out.write("  \t\t\t\t\t관리자 모드&nbsp;&nbsp;\r\n");
      out.write("  \t\t\t\t\t<a href=\"logout.jsp\">Logout</a>\r\n");
      out.write("  \t\t\t");
 } else { 
      out.write("\r\n");
      out.write("  \t\t\t\t\t");
      out.print( sessionID );
      out.write("님 반갑습니다!&nbsp;&nbsp;\r\n");
      out.write("\t\t  \t\t\t<a href=\"logout.jsp\">Logout</a>&nbsp;\r\n");
      out.write("\t\t  \t\t\t<a href=\"login.jsp\">MyPage</a>\r\n");
      out.write("  \t\t\t");
 } 
      out.write("\r\n");
      out.write("\t  \t");

	  		} else {
	  	
      out.write("\r\n");
      out.write("\t\t  \t<a href=\"login.jsp\">Login</a>&nbsp;\r\n");
      out.write("\t\t \t<a href=\"join.jsp\">회원가입</a>\r\n");
      out.write("\t\t ");

	  		}
		 
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("  \r\n");
      out.write("  <div class=\"serch\">\r\n");
      out.write(" \t<input type=\"text\" placeholder=\"검색어 입력\">\r\n");
      out.write("  \t<button>검색</button>\r\n");
      out.write("  </div> \r\n");
      out.write("  \r\n");
      out.write("  <h1 class=\"title\"><a href=\"../user/index.jsp\">Game Castle</a></h1>\r\n");
      out.write("  \r\n");
      out.write("  <ul> \r\n");
      out.write("  \t<li class=\"list\"><a href=\"/jsp/WebProject/user/index.jsp\">메인</a></li>\r\n");
      out.write("  \t<li class=\"list\">리스트</li>\r\n");
      out.write("  \t<li class=\"list\"><a href=\"../bbs/bbs.jsp\">게시판</a></li>\r\n");
      out.write("  </ul>\r\n");
      out.write("  <hr>\r\n");
      out.write(" <div id=\"grid\">    \t\t\r\n");
      out.write("  \r\n");
      out.write("    <ul class=\"genre\">\r\n");
      out.write("    \t<li><a href=\"action.jsp\">액션</a></li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>어드벤쳐</li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>레이싱</li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>스포츠</li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>슈팅/FPS</li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>퍼즐</li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>시뮬래이션</li>\r\n");
      out.write("    \t<br>\r\n");
      out.write("    \t<li>기타</li>\r\n");
      out.write("    </ul>\r\n");
      out.write("\t<div class=\"White space\">\r\n");
      out.write("\t\t <table class=\"table1\">\r\n");
      out.write("      <tr class=\"test1\">\r\n");
      out.write("         <td class=\"test1\">\r\n");
      out.write("            aaa-0<hr>\r\n");
      out.write("            aaa-1<hr>\r\n");
      out.write("            aaa-2<hr>\r\n");
      out.write("            aaa-3<hr>\r\n");
      out.write("            aaa-4<hr>\r\n");
      out.write("            <a href=\"https://store.steampowered.com\"/>steam\r\n");
      out.write("         </td>\r\n");
      out.write("         <td class=\"test1\">\r\n");
      out.write("            bbb-0<hr>\r\n");
      out.write("            bbb-1<hr>\r\n");
      out.write("            bbb-2<hr>\r\n");
      out.write("            bbb-3<hr>\r\n");
      out.write("            bbb-4<hr>\r\n");
      out.write("            <a href=\"https://www.fanatical.com/\"/>fanatical\r\n");
      out.write("         </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr class=\"test1\">\r\n");
      out.write("         <td class=\"test1\">\r\n");
      out.write("            ccc-0<hr>\r\n");
      out.write("            ccc-1<hr>\r\n");
      out.write("            ccc-2<hr>\r\n");
      out.write("            ccc-3<hr>\r\n");
      out.write("            ccc-4<hr>\r\n");
      out.write("            <a href=\"https://www.gamersgate.com/\"/>gamersgate\r\n");
      out.write("         </td>\r\n");
      out.write("         <td class=\"test1\">\r\n");
      out.write("            ddd-0<hr>\r\n");
      out.write("            ddd-1<hr>\r\n");
      out.write("            ddd-2<hr>\r\n");
      out.write("            ddd-3<hr>\r\n");
      out.write("            ddd-4<hr>\r\n");
      out.write("            <a href=\"https://www.gog.com/\"/>gog</li>\r\n");
      out.write("         </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("   </table>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("  </div>\r\n");
      out.write("  </body>\r\n");
      out.write("  </html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
