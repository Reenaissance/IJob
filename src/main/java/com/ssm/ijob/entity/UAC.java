package com.ssm.ijob.entity;

/**
 * @author Renassiance
 * @date 2021/10/17 21:04
 */
public class UAC {
    private String userId;
    private String courseId;

    public UAC() {
    }

    public UAC(String userId, String courseId) {
        this.userId = userId;
        this.courseId = courseId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    @Override
    public String toString() {
        return "UAC{" +
                "userId=" + userId +
                ", courseId=" + courseId +
                '}';
    }
}
