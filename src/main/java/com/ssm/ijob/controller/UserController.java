package com.ssm.ijob.controller;

import com.ssm.ijob.entity.User;
import com.ssm.ijob.service.UserService;
import com.ssm.ijob.util.JsonMsg;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/17 17:21
 */
@Controller
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value= "/selectUserById/{userId}")
    public String selectUserById(@PathVariable("userId") String userId, Model model){
        User user = userService.selectUserById(userId);
        model.addAttribute("user",user);
        return "user";
    }
    @RequestMapping(value = "/selectLoginPrivilege/{userId}/{userPrivileges}")
    public String selectLoginPrivilege(@PathVariable("userId")String userId,@PathVariable("userPrivileges") String userPrivileges,Model model){
        User user = userService.selectLoginPrivilege(userId,userPrivileges);
        model.addAttribute("user",user);
        return "user";
    }
    @RequestMapping(value = "/admin")
    public String admin(){
        return "admin/admin";
    }
    @RequestMapping(value = "/employee")
    public String employee(){
        return "employee/employee";
    }
    @RequestMapping(value = "/employer")
    public String employer(){
        return null;
    }
}
