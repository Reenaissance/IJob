package com.ssm.ijob.controller;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.entity.UAC;
import com.ssm.ijob.mapper.CollectMapper;
import com.ssm.ijob.service.CollectService;
import com.ssm.ijob.service.CourseService;
import com.ssm.ijob.util.JsonMsg;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/11/12 16:26
 */
@Controller
public class CollectController {
    @Resource
    CourseService courseService;
    @Resource
    CollectService collectService;

    @RequestMapping("/collection")
    public String toCollection() {
        return "/employee/collection";
    }

    @RequestMapping(value = "/collect/{courseId}")
    public String collect(HttpSession session, @PathVariable("courseId") String courseId) {
        String userId = (String) session.getAttribute("userId");
//        System.out.println(userId);
//        System.out.println(courseId);
        if (userId == null) {
            return "login";
        } else {
            List<UAC> uacs = collectService.selectByUserId(userId);
            for (UAC uac : uacs) {
                //若已有收藏
                if (courseId.equals(uac.getCourseId())) {
                    collectService.deleteUAC(uac);
                }
            }
            UAC uac1 = new UAC(userId, courseId);
            collectService.insertUAC(uac1);
            return "redirect:showCollect";
        }
    }

    @RequestMapping("/showCollect")
    public String showCollection(HttpSession session, ServletRequest request) {
        String userId = (String) session.getAttribute("userId");
//        if(userId == null){
//            return "login";
//        }
        List<Course> courseList = new ArrayList<>();
        List<UAC> uacList = collectService.selectByUserId(userId);
        for (UAC uac1 : uacList) {
            String courseId1 = uac1.getCourseId();
            Course course = courseService.selectCourseById(courseId1);
            courseList.add(course);
        }
        request.setAttribute("collectList", courseList);
        return "employee/collection";
    }
}
