package com.ssm.ijob.controller;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.entity.User;
import com.ssm.ijob.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/11/15 10:48
 */
@Controller
public class AdminCourseController {
    @Resource
    private CourseService courseService;
    @RequestMapping(value = "/admin/allCourse")
    public String adminCourse(Model model){
        List<Course> courses = courseService.findAll();
        model.addAttribute("courses",courses);
        return "admin/allCourse";
    }
    @RequestMapping("/toAddCourse")
    public String toAddCourse(){
        return "admin/addCourse";
    }
    @RequestMapping("/addCourse")
    public String addCourse(Course course,Model model){
        courseService.insertCourse(course);
        model.addAttribute("courseName",course.getCourseName());
//        return "redirect:/admin/allCourse";
        return "admin/uploadPic";
    }
    @RequestMapping("/uploadPic")
    public String uploadPic(){
        return "redirect:/admin/allCourse";
    }
    @RequestMapping("/toUpdateCourse")
    public String toUpdateCourse(Model model,String courseId){
        Course course = courseService.selectCourseById(courseId);
//        System.out.println(course);
        model.addAttribute("course",course);
        return "admin/updateCourse";
    }
    @RequestMapping("/updateCourse")
    public String updateCourse(Course course){
//        System.out.println(course);
        courseService.updateCourseById(course);
        return "redirect:/admin/allCourse";
    }
    @RequestMapping("/deleteCourse/{id}")
    public String deleteUser(@PathVariable("id") String id){
        courseService.deleteCourseById(id);
        return "redirect:/admin/allCourse";
    }
    @RequestMapping("/queryCourseByName")
    public String queryUserByName(String courseName,Model model){
        List<Course> courses = courseService.findAllByCourseName(courseName);
        if(courses.isEmpty()){
            courses = courseService.findAll();
            model.addAttribute("courseError","未找到");
        }
        model.addAttribute("courses",courses);
        return "admin/allCourse";
    }
}
