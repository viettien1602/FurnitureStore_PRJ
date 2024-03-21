/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import enums.Gender;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.Users;
import util.DBUtils;

/**
 *
 * @author admin
 */
public class UserDAO {

    private static final String LOGIN = "select id, email, gender, roleId, avatarId, status from Users where username = ? and password = ? and status = 1";
    private static final String REGISTER = "insert into Users(username, email, password, gender, roleId, avatarId) values (?, ?, ?, ?, ?, ?)";
    private static final String SEARCH = "SELECT id, username, email, roleId, password, gender FROM Users WHERE username like ?";

    public Users login(String username, String password) throws SQLException {
        Users user = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    Gender gender = Gender.valueOf(rs.getString("gender"));
                    Role role = new Role(rs.getString("roleId"));
                    // avatar
                    boolean status = rs.getBoolean("status");
                    user = new Users(id, username, email, "***", gender, role, null, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public boolean register(Users user) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(REGISTER);
                ptm.setString(1, user.getUsername());
                ptm.setString(2, user.getEmail());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getGender().toString());
                ptm.setString(5, user.getRole().getId());
                ptm.setString(6, null);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public List<Users> getListUser(String search) throws SQLException {
        List<Users> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("username");
                    String email = rs.getString("email");
                    String password = "***";
                    Gender gender = Gender.valueOf(rs.getString("gender"));
                    String role = rs.getString("rodeId");
                    list.add(new Users(id, name, email, password, gender, new Role(role)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}
