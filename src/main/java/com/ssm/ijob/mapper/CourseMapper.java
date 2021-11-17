package com.ssm.ijob.mapper;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.entity.Mission;

import java.util.HashMap;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/17 16:40
 */
public interface CourseMapper {
    //增删改查
    int insertCourse(Course course);
    int deleteCourseById(String courseId);
    int updateCourseById(Course course);
    Course selectCourseByName(String courseName);
    Course selectCourseById(String courseId);
    List<Course> findByPage(HashMap<String,Object> map);
    int selectCourseCount();
    List<Course> findAllByCourseName(String courseName);
    List<Course> findAll();
}
