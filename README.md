
This is a sample authentication engine for Oracle Identity Federation. 

Please see http://blog.warrenstrange.com/  for more complete documentation.

The AuthSvc/ folder contains a simple Netbeans project that provides a sample SOAP authentication service. The service is just for illustrative purposes; Don't be overly concerned with the implemenation.


The engine/ folder contains the OIF engine that calls out to the sample web service. 

The interesting bits are:

- loginpage.jsp:  The page presented to the user.
- forward.jsp:  After the login page OIF forwards control to this page. This
	is where the custom authentication logic happens
- logout.jsp - The logout page kills the OIF session and terminates SSO.



