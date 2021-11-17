package com.ssm.ijob.controller;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/21 19:43
 */
@Controller
public class CourseController {
    @Resource
    private CourseService courseService;

    @RequestMapping(value = "/allCourse")
    public String allCourse(@RequestParam(value="currentPage",defaultValue="1",required = false)int currentPage, Model model){
        model.addAttribute("pagemsg",courseService.findByPage(currentPage));
        return "employee/allCourse";
    }

    @RequestMapping(value = "/selectCourseByName/{courseName}")
    public String selectCourseByName(@PathVariable("courseName") String courseName, Model model){
        Course course = courseService.selectCourseByName(courseName);
        model.addAttribute(course);
        return "/course";
    }
    @RequestMapping(value = "/selectCourseById/{courseId}")
    public String selectCourseById(@PathVariable("courseId") String courseId, Model model){
        Course course = courseService.selectCourseById(courseId);
        model.addAttribute("course",course);
        return "/course";
    }
    @RequestMapping(value = "/teach")
    public String toTeach(){
        return "employee/teach";
    }

}
