<%@page buffer="5kb" autoFlush="true" session="false"%>
<%@page language="java" import="java.net.*"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "Thu, 29 Oct 1969 17:04:19 GMT");
String refid = (String) request.getAttribute("oracle.security.fed.authn.refid");
//String postURL = "/engine/ldapforward.jsp?refid=" + (refid != null ? URLEncoder.encode(refid) : "");
String postURL = "http://demo.oracleads.com:7499/engine/forward.jsp?refid=" + (refid != null ? URLEncoder.encode(refid) : "");
String msg = request.getParameter("message");
%>
<HTML>
<BODY>
<FORM action="<%=postURL%>" method="POST">
<% if(msg != null && msg.length() > 0) { %> <%=msg%><BR/> <%}%>
Username: <INPUT type="text" name="username"/><BR/>
Password: <INPUT type="password" name="password"/><BR/>
<INPUT type="submit" value="Submit"/>
</FORM>
</BODY>
</HTML>
