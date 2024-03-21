/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import enums.Gender;

/**
 *
 * @author admin
 */
public class Users {
    private int id;
    private String username;
    private String email;
    private String password;
    private Gender gender;
    private Role role;
    private Avatar avatar;
    private boolean status;

    public Users() {
    }

    public Users(String username, String email, String password, Gender gender, Role role, Avatar avatar) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.avatar = avatar;
        this.status = true;
    }

    public Users(int id, String username, String email, String password, Gender gender, Role role, Avatar avatar, boolean status) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.role = role;
        this.avatar = avatar;
        this.status = status;
    }

    public Users(int id, String username, String email, String password, Gender gender, Role role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.role = role;
    }

   

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public Gender getGender() {
        return gender;
    }

    public Role getRole() {
        return role;
    }

    public Avatar getAvatar() {
        return avatar;
    }

    public boolean isStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setAvatar(Avatar avatar) {
        this.avatar = avatar;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
    
}
