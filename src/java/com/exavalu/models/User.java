/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.models.services.AdminService;
import com.exavalu.models.services.UserService;
import com.exavalu.models.services.VoterService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;
/**
 *
 * @author Admin
 */
public class User extends ActionSupport implements ApplicationAware, SessionAware, Serializable{
    private String emailAddress;
    private String firstName;
    private String lastName;
    private String password;
    private String roleId;
    private String voterId;
    
    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();
    
    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getVoterId() {
        return voterId;
    }

    public void setVoterId(String voterId) {
        this.voterId = voterId;
    }
    
    
    
    public String doLogin() throws Exception {
        String result="FAILURE";
        int x=UserService.doLogin(this);
        if(x==0)
            sessionMap.put("Error","Wrong data");
        else if(x==2)
        {
            result="ADMIN";
            Admin admin = AdminService.getAdmin(this.emailAddress);
            if(admin.getFirstName()==null)
            {
                sessionMap.put("Error","Wrong data");
                return "FAILURE";
            }
            sessionMap.put("Admin",admin);
        }
        else if(x==1 && !this.voterId.equalsIgnoreCase(""))
        {
            result="VOTER";
            Voter voter = VoterService.getVoter(this.voterId);
            System.out.println(voter.getFirstName());
            if(voter.getFirstName()==null)
            {
                sessionMap.put("Error","Wrong data");
                return "FAILURE";
            }
            if(Integer.parseInt(voter.getAdminStatus())==0)
            {
                sessionMap.put("Error","Admin has not approved you profile yet!!");
                return "FAILURE";
            }
            sessionMap.put("Voter",voter);
        }
        
        return result;
    }
}
