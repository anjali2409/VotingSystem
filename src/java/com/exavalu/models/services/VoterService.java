/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models.services;

import com.exavalu.models.Voter;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class VoterService {

    public static Voter getVoter(String voterId) {
        Voter voter = new Voter();

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select * from voters "
                    + "where voterId = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, Integer.parseInt(voterId));

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                voter.setVoterId(rs.getInt("voterId"));
                voter.setFirstName(rs.getString("firstName"));
                voter.setLastName(rs.getString("lastName"));
                voter.setPassword(rs.getString("password"));
                voter.setAge(rs.getString("age"));
                voter.setGender(rs.getString("gender"));
                voter.setState(rs.getString("state"));
                voter.setAdminStatus(rs.getString("adminStatus"));
                voter.setVotingStatus(rs.getString("votingStatus"));
                voter.setDob(rs.getString("dob"));
                voter.setEmailAddress(rs.getString("emailAddress"));
                System.out.println(voter.getVoterId()+" Found!!!");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return voter;
    }

    public static ArrayList getStates() {
        ArrayList stateList = new ArrayList();
        try {

            Connection con = JDBCConnectionManager.getConnection();

            String sql = "Select * from states";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Voter voter = new Voter();

                voter.setStateCode(rs.getString("stateCode"));
                voter.setStateName(rs.getString("stateName"));

                stateList.add(voter);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return stateList;
    }

    public static boolean doSignup1(String emailAddress, String password, String firstName, String lastName, int roleId, int voterId) {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection();
        
        String sql="INSERT INTO users(emailAddress,firstName,lastName,password,roleId,voterId)"
                + "VALUES(? ,? ,? ,? ,? ,? );";
        
        try {
            
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);
            preparedStatement.setString(2, firstName);
            preparedStatement.setString(3, lastName);
            preparedStatement.setString(4, password);
            preparedStatement.setInt(5, roleId);
            preparedStatement.setInt(6, voterId);
            
            int rs = preparedStatement.executeUpdate();

            if(rs!=0)
            {
                result=true;
            }
            
            
        } catch (SQLException ex) {
            
            ex.printStackTrace();
            
        }
        
        return result;
    }

    public static boolean doSignup2(Voter voter) {
        boolean result = false;
        Connection con = JDBCConnectionManager.getConnection();
        
        String sql="INSERT INTO voters(voterId,firstName,lastName,emailAddress,password,age,dob,gender,state)"
                + "VALUES(? ,? ,? ,? ,? ,?, ?, ?, ?);";
        
        try {
            
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setInt(1, voter.getVoterId());
            preparedStatement.setString(2, voter.getFirstName());
            preparedStatement.setString(3, voter.getLastName());
            preparedStatement.setString(4, voter.getEmailAddress());
            preparedStatement.setString(5, voter.getPassword());
            preparedStatement.setString(6, voter.getAge());
            preparedStatement.setString(7, voter.getDob());
            preparedStatement.setString(8, voter.getGender());
            preparedStatement.setString(9, voter.getState());
            
            int rs = preparedStatement.executeUpdate();

            if(rs!=0)
            {
                result=true;
            }
            
            
        } catch (SQLException ex) {
            
            ex.printStackTrace();
            
        }
        
        return result;
    }
    
}
