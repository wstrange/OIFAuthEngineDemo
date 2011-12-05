/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package authsvc;

/**
 * Sample attributes to pass back from the web service. 
 * @author warren
 */
public class AuthInfo {

    private String subscriberid;
    private String zipcode;
    private String status = "OK";

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * private String zipcode;
     *
     * /**
     * Get the value of zipcode
     *
     * @return the value of zipcode
     */
    public String getZipcode() {
        return zipcode;
    }

    /**
     * Set the value of zipcode
     *
     * @param zipcode new value of zipcode
     */
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

     /** Get the value of subscriberid
     *
     * @return the value of subscriberid
     */
    public String getSubscriberid() {
        return subscriberid;
    }

    /**
     * Set the value of subscriberid
     *
     * @param subscriberid new value of subscriberid
     */
    public void setSubscriberid(String subscriberid) {
        this.subscriberid = subscriberid;
    }

}
