package com.ssm.ijob.service.impl;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.entity.PageBean;
import com.ssm.ijob.mapper.CourseMapper;
import com.ssm.ijob.service.CourseService;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/21 19:38
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    private CourseMapper courseMapper;
    @Override
    public int insertCourse(Course course) {
        return this.courseMapper.insertCourse(course);
    }

    @Override
    public int deleteCourseById(String courseId) {
        return this.courseMapper.deleteCourseById(courseId);
    }

    @Override
    public int updateCourseById(Course course) {
        return this.courseMapper.updateCourseById(course);
    }

    @Override
    public Course selectCourseByName(String courseName) {
        return this.courseMapper.selectCourseByName(courseName);
    }

    @Override
    public Course selectCourseById(String courseId) {
        return this.courseMapper.selectCourseById(courseId);
    }

    @Override
    public List<Course> findAllByCourseName(String courseName) {
        return this.courseMapper.findAllByCourseName(courseName);
    }

    @Override
    public List<Course> findAll() {
        return this.courseMapper.findAll();
    }

    @Override
    public PageBean<Course> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<>();
        PageBean<Course> pageBean = new PageBean<>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = courseMapper.selectCourseCount();
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Course> lists = courseMapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }

}
