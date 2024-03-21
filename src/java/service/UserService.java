/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.UserDAO;
import enums.Gender;
import java.sql.SQLException;
import model.ReturnObject;
import model.Role;
import model.Users;

/**
 *
 * @author admin
 */
public class UserService {
    
    private final UserDAO dao;

    public UserService() {
        this.dao = new UserDAO();
    }
    
    
    public Users checkLogin(String username, String password) throws SQLException{
        return dao.login(username, password);
    }
    
    public ReturnObject<?> register(String username, String email, String password, String genderString) throws SQLException {
        Gender gender = null;
        try {
            gender = Gender.valueOf(genderString);
        }
        catch (Exception e) {
            e.printStackTrace();
            new ReturnObject<>(false, "Gender not valid");
        }
        
        Users user = new Users(username, email, password, gender, new Role("US"), null);
        boolean checkRegister = dao.register(user);
        if (checkRegister) return new ReturnObject<Users>(true, user);
        else return new ReturnObject<String>(false, "Error in registering user");
    }
}
