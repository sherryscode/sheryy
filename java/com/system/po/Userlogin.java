package com.system.po;

public class Userlogin {
    private Integer userid;

    private String username;

    private String password;

    private Integer role;

    public Integer getUserid() {
        System.out.println("userid is " + userid);
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        System.out.println("username is " + username);
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}