/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class ReturnObject<T> {
    private boolean success;
    private T returnValue;

    public ReturnObject() {
    }

    public ReturnObject(boolean success, T returnValue) {
        this.success = success;
        this.returnValue = returnValue;
    }

    public ReturnObject(boolean success) {
        this.success = success;
    }

    public boolean isSuccess() {
        return success;
    }

    public T getReturnValue() {
        return returnValue;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public void setReturnValue(T returnValue) {
        this.returnValue = returnValue;
    }
}
