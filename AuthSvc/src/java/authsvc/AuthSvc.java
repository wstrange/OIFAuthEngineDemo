package authsvc;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 * Sample Web Service used to demo a custom OIF Authentication Engine.
 * 
 * This provides a dummy authentication web service that the OIF forward.jsp snippet
 * will call out to. 
 * 
 * @author warren
 */
@WebService(serviceName = "AuthSvc")
public class AuthSvc {
    /**
     * Sample Auth Service.
     * 
     * Any username starting with "test" is authenticated. Anything else
     * fails 
     * 
     * @param userid  userid to authenticate
     * @param password password
     * @return AuthInfo - showing that we can pass back sample attributes 
     *  on authentication. OIF will later insert these into the SSO session.
     */
    @WebMethod(operationName = "authenticate")
    public AuthInfo authenticate(@WebParam(name = "userid") String userid,
            @WebParam(name = "password") String password) {

        AuthInfo a = new AuthInfo();

        if (userid != null && userid.startsWith("test")) {
            a.setZipcode("12345");
            a.setStatus("OK");
            a.setSubscriberid(userid + "1234");
            return a;
        }
        a.setStatus("ERROR-Auth");
        return a;    
    }
}