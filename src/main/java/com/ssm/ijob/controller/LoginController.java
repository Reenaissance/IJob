package com.ssm.ijob.controller;

import com.ssm.ijob.entity.User;
import com.ssm.ijob.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author Renassiance
 * @date 2021/10/22 21:55
 */
@Controller
public class LoginController {
    @Resource
    private UserService userService;
    //登录功能
    @PostMapping(value = "/login")
    @ModelAttribute
    public ModelAndView login(String userId,String userPassword, String userPrivileges,ModelAndView modelAndView, HttpSession session ){
        //用户名是否与密码匹配
        User user1 = userService.selectLoginIdPass(userId,userPassword);
        //用户是否有此用户权限
        User user2 = userService.selectLoginPrivilege(userId,userPrivileges);
        if(user1 == null){
            modelAndView.setViewName("login");
            modelAndView.addObject("loginMessage","账号不存在或密码错误，请重新输入。");
        }
        else if(user2 == null){
            modelAndView.setViewName("login");
            modelAndView.addObject("loginMessage","该账号无此权限，请重新输入。");
        }else{
            //管理员身份
            if(user1.getUserPrivileges().equals("管理员")){
                modelAndView.setView(new RedirectView("/IJob/admin"));
                session.setAttribute("userId",user1.getUserId());
                session.setAttribute("userPrivileges",user1.getUserPrivileges());
            }
            //委托人
            else if(user1.getUserPrivileges().equals("委托员")){
                modelAndView.setView(new RedirectView("/IJob/selectUserById/"+user1.getUserId()));
                session.setAttribute("userId",user1.getUserId());
                session.setAttribute("userName",user1.getUserName());
                session.setAttribute("userPrivileges",user1.getUserPrivileges());
            }else{
                modelAndView.setView(new RedirectView("/IJob/employee"));
                session.setAttribute("userId",user1.getUserId());
                session.setAttribute("userName",user1.getUserName());
                session.setAttribute("userPrivileges",user1.getUserPrivileges());
            }
        }
        return modelAndView;
    }
    //登出
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:login";
    }
}
