package com.ssm.ijob.controller;

import com.ssm.ijob.entity.User;
import com.ssm.ijob.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


/**
 * @author Renassiance
 * @date 2021/10/24 12:15
 */
@Controller
public class RegisterController {
    @Resource
    private UserService userService;
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String ToRegister(){
        return "register";
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public ModelAndView register(String userId, String userPassword,
                                 String userPassword1, String userName,String userEmail,
                                 String userPrivileges, ModelAndView modelAndView,
                                 HttpSession session){
        User user = userService.selectUserById(userId); //是否已注册
        //正则表达式验证密码：字母开头，长度9~20之间，只能包含字母、数字和下划线
        boolean matcherPassword = userPassword.matches("^[a-zA-Z]\\w{8,19}$");
        String userId1 = userId.toString();
        //验证id是否为11位的纯数字
        boolean matcherId = userId1.matches("[0-9]{11}");
        /*
        注册电子邮箱验证
        邮箱地址必须包含@字符
        邮箱@的左边必须以字母, 下划线, 数字开头, 且必须有一个
        邮箱@的左边除了开头字母其他的可以是字母, 下划线, 数字， 点号 . 小杠 -
        邮箱@的右边必须有 . 点号
        在 @ 和 . 之间必须以字母, 下划线, 数字开头, 且除了开头字母其他的可以是字母, 下划线, 数字， 点号 . 小杠 -
        在 . 点号后面至少有一个 字母, 下划线, 数字开头
        */
        boolean matcherEmail = userEmail.matches("(\\w+)([\\w+.-])*@(\\w+)([\\w+.-])*\\.\\w+");
        if(userPrivileges.equals("") || userId1.equals("") || userName.equals("") || userPassword.equals("") || userPassword1.equals("")){
            modelAndView.setViewName("register");
            modelAndView.addObject("registerMessage","注册失败：表单不允许有空！");
        }
        else if(!matcherId){
            modelAndView.setViewName("register");
            modelAndView.addObject("registerMessage","注册失败：账号不合法！");
        }
        else if(!matcherPassword){
            modelAndView.setViewName("register");
            modelAndView.addObject("registerMessage","注册失败：密码不合法！");
        }
        else if(!matcherEmail){
            modelAndView.setViewName("register");
            modelAndView.addObject("registerMessage","注册失败：邮箱不合法！");
        }
        else if(!userPassword.equals(userPassword1)){
            modelAndView.setViewName("register");
            modelAndView.addObject("registerMessage","注册失败：两次密码输入不一致！");
        }
        else if(user!=null){
            modelAndView.setViewName("register");
            modelAndView.addObject("registerMessage","注册失败：该账号已存在！");
        }else{
            User userRegister = new User(userId,userName,userPassword,userEmail,userPrivileges);
            userService.insertUser(userRegister);
            if(userPrivileges.equals("委托员")){
                modelAndView.setView(new RedirectView("/IJob/selectUserById/"+userRegister.getUserId()));
                session.setAttribute("userId",userId);
                session.setAttribute("userName",userName);
                session.setAttribute("userPrivileges",userPrivileges);
            }else{
                modelAndView.setView(new RedirectView("/IJob/selectUserById/"+userRegister.getUserId()));
                session.setAttribute("userId",userId);
                session.setAttribute("userName",userName);
                session.setAttribute("userPrivileges",userPrivileges);
            }
        }
        return modelAndView;
    }

}
