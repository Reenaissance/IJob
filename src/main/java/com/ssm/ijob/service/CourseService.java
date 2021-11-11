package com.ssm.ijob.service;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.entity.PageBean;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/21 19:38
 */
public interface CourseService {
    int insertCourse(Course course);
    int deleteCourseById(String courseId);
    int updateCourseById(Course course);
    Course selectCourseByName(String courseName);
    Course selectCourseById(String courseId);
    PageBean<Course> findByPage(int currentPage);
    List<Course> findAllByCourseName(String courseName);
}
