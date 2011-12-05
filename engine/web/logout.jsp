<%@page buffer="5kb" autoFlush="true" session="false"%>
<%@page language="java" import="java.net.*"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "Thu, 29 Oct 1969 17:04:19 GMT");
String TEST_ENGINE_ID = "8172C8E5A7"; 
request.getSession().removeAttribute("feduserid");
 
//request.setAttribute("oracle.security.fed.sp.engineid", TEST_ENGINE_ID); 
 
request.setAttribute("oracle.security.fed.authn.engineid", TEST_ENGINE_ID);

request.getSession().getServletContext().getContext("/fed").getRequestDispatcher("/user/logoutretsso").forward(request, response);
%>
