package com.ssm.ijob.entity;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/16 19:02
 */
public class User {
    private String userId;
    private String userName;
    private String userPassword;
    private String userEmail;
    private String userPrivileges;
    List<Mission> missions;
    List<Course> courses; //用户与课程为一对多的关系

    public User() {
    }

    public User(String userId, String userName, String userPassword, String userEmail, String userPrivileges) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userPrivileges = userPrivileges;
    }

    public List<Mission> getMissions() {
        return missions;
    }

    public void setMissions(List<Mission> missions) {
        this.missions = missions;
    }

    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPrivileges() {
        return userPrivileges;
    }

    public void setUserPrivileges(String userPrivileges) {
        this.userPrivileges = userPrivileges;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPrivileges=" + userPrivileges +
                ", missions=" + missions +
                ", courses=" + courses +
                '}';
    }
}
