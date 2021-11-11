package com.ssm.ijob.entity;

/**
 * @author Renassiance
 * @date 2021/10/17 10:56
 */
public class Course {
    private String courseId;
    private String courseName;
    private String courseLink;
    public Course() {
    }
    public Course(String courseId, String courseName, String courseLink) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseLink = courseLink;
    }


    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseLink() {
        return courseLink;
    }

    public void setCourseLink(String courseLink) {
        this.courseLink = courseLink;
    }

    @Override
    public String toString() {
        return "Course{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", courseLink='" + courseLink + '\'' +
                '}';
    }
}
