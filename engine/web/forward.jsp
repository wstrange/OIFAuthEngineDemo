<%@page buffer="5kb" autoFlush="true" session="false"%>
<%@page language="java" import="java.util.*, javax.naming.*, javax.naming.directory.*, java.net.*"%>
<%@page import="client.*"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "Thu, 29 Oct 1969 17:04:19 GMT");
String refid = request.getParameter("refid");
String authnMethod = "oracle:fed:authentication:password-protected";
String userID = request.getParameter("username");
String password = request.getParameter("password");
// you get this id from OIF->AuthEngine->Custom page
String TEST_ENGINE_ID = "8172C8E5A7";
Date now = new Date();

AuthSvc_Service authsvc = new AuthSvc_Service();

AuthSvc svc = authsvc.getAuthSvcPort();

AuthInfo info = svc.authenticate(userID,password);

if( info == null || info.getStatus().startsWith("ERROR") ) 
{
	String message = info.getStatus();

 String redirectURL = "/engine/loginpage.jsp?refid=" +
	(refid != null ? URLEncoder.encode(refid) : "") + 
	"&message=" + URLEncoder.encode(message);
	response.sendRedirect(redirectURL);
	return;
}

Map attrs = new HashMap();  // Attribute map to put in the SSO sesion
// Attributes from the sample web service
attrs.put("zipcode", info.getZipcode() );
attrs.put("subscriberid", info.getSubscriberid() );
// You can also pass in multi-valued attributes
HashSet s = new HashSet();
s.add("Bill");
s.add("Sue");
attrs.put("children", s);


request.setAttribute("oracle.security.fed.authn.attributes", attrs);

request.setAttribute("oracle.security.fed.authn.engineid", TEST_ENGINE_ID);
request.setAttribute("oracle.security.fed.authn.userid", userID);
request.setAttribute("oracle.security.fed.authn.refid", refid);
request.setAttribute("oracle.security.fed.authn.authnmech", authnMethod);
request.setAttribute("oracle.security.fed.authn.authntime", now);
request.getSession().getServletContext().getContext("/fed").
getRequestDispatcher("/user/loginsso").forward(request, response);
%>

