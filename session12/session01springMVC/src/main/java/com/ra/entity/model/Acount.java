package com.ra.entity.model;

public class Acount {
    private String email;
    private int password;

    public Acount() {
    }

    public Acount(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }
}
