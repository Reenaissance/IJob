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
import java.util.ArrayList;
import java.util.Arrays;
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
        return "employer/employer";
    }

    @RequestMapping(value = "/allUser")
    public String allUser(Model model){
        List<User> users = userService.selectUserAll();
//        System.out.println(users);
        model.addAttribute("list",users);
        return "admin/allUser";
    }
    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "admin/addUser";
    }
    @RequestMapping("/addUser")
    public String addUser(User user){
        userService.insertUser(user);
        return "redirect:/allUser";
    }
    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(Model model,String id){
        User user = userService.selectUserById(id);
        model.addAttribute("user",user);
        return "admin/updateUser";
    }
    @RequestMapping("/updateUser")
    public String updateUser(User user){
        userService.updateUserById(user);
        return "redirect:/allUser";
    }
    @RequestMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable("id") String id){
        userService.deleteUserById(id);
        return "redirect:/allUser";
    }
    @RequestMapping("/queryUserByName")
    public String queryUserByName(String userName,Model model){
//        System.out.println(userName);
        User user = userService.selectUserByName(userName);
//        System.out.println(user);
        List<User> list = new ArrayList<>();
        if(user==null){
            list = userService.selectUserAll();
            model.addAttribute("error","未找到");
        }
        list.add(user);
        model.addAttribute("list",list);
        return "admin/allUser";
    }
    @RequestMapping("/checkNameExists")
    public void checkNameExists(String userName,Model model){
        User user = userService.selectUserByName(userName);
        if(user!=null){
            model.addAttribute("nameError","用户名已存在");
        }
    }
}
