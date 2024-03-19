/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import enums.AvatarType;

/**
 *
 * @author admin
 */
public class Avatar {
    private int id;
    private AvatarType type;
    private byte[] image;

    public Avatar() {
    }

    public Avatar(int id) {
        this.id = id;
    }

    public Avatar(int id, AvatarType type, byte[] image) {
        this.id = id;
        this.type = type;
        this.image = image;
    }
    
}
