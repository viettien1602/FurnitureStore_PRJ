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
    private T error;

    public ReturnObject(boolean success, T error) {
        this.success = success;
        this.error = error;
    }

    public ReturnObject(boolean success) {
        this.success = success;
    }

    public boolean isSuccess() {
        return success;
    }

    public T getError() {
        return error;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public void setError(T error) {
        this.error = error;
    }
}
