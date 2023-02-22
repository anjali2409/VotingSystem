/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models.services;

import com.exavalu.models.Admin;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class AdminService {

    public static Admin getAdmin(String emailAddress) {
        Admin admin = new Admin();

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "select * from admins "
                    + "where emailAddress = ?";

            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, emailAddress);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                admin.setAdminId(rs.getInt("adminId"));
                admin.setEmailAddress(rs.getString("emailAddress"));
                admin.setFirstName(rs.getString("firstName"));
                admin.setLastName(rs.getString("lastName"));
                admin.setPassword(rs.getString("password"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return admin;
    }  
}
