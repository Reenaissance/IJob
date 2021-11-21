package com.ssm.ijob.controller;


import com.ssm.ijob.entity.CAU;
import com.ssm.ijob.entity.CBU;
import com.ssm.ijob.entity.Comment;
import com.ssm.ijob.entity.CommentSecond;
import com.ssm.ijob.service.CommentService;
import com.ssm.ijob.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {

    @Resource
    private CommentService commentService;

    @Resource
    private UserService userService;

    @RequestMapping("/getCommentList")
    public String turn(Model model) {
        List<Comment> list = commentService.queryAllComment();
        List<CAU> newList = new ArrayList<>();
        for(Comment comment : list) {
            CAU cau = new CAU();
            cau.setCommentId(comment.getCommentId());
            cau.setUsername(userService.selectUserById(String.valueOf(comment.getCommentUserId())).getUserName());
            cau.setCommentGood(comment.getCommentGood());
            cau.setCommentDate(comment.getCommentDate());
            cau.setCommentContext(comment.getCommentContext());
            List<CommentSecond> comentSecondList = commentService.querySecondComment(comment.getCommentId());
            List<CBU> newList2 = new ArrayList<>();
            for(CommentSecond commentSecond : comentSecondList) {
                CBU cbu = new CBU();
                cbu.setCommentSecondContext(commentSecond.getCommentSecondContext());
                cbu.setUsername(userService.selectUserById(String.valueOf(commentSecond.getCommentSecondUserId())).getUserName());
                cbu.setTime(commentSecond.getCommentSecondDate());
                cbu.setSecUserId(commentSecond.getCommentSecondUserId());
                cbu.setSecId(commentSecond.getCommentSecondId());
                newList2.add(cbu);
            }
            cau.setICBU(newList2);
            newList.add(cau);
        }
        model.addAttribute("commentList", newList);
        return "comment";
    }

    //  点赞
    @RequestMapping("/dianzan/{commentId}")
    public ModelAndView dianzan(@PathVariable("commentId")int commentId, ModelAndView modelAndView) {
        commentService.updateComment(commentId);
        modelAndView.setView(new RedirectView("/IJob/getCommentList"));
        return modelAndView;
    }

    //  我要评论
    @RequestMapping("/setComment/{commentId}")
    public ModelAndView setSecondComment(@PathVariable("commentId")int commentId, ModelAndView modelAndView, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("secondId", commentId);
        session.setAttribute("temp", true);
        modelAndView.setView(new RedirectView("/IJob/getCommentList"));
        return modelAndView;
    }

    //  添加新的Sec评论
    @RequestMapping("/addSecComment/{commentId}")
    public ModelAndView addSec(@PathVariable("commentId")int commentId, ModelAndView modelAndView, HttpServletRequest request) {
        String secComment = request.getParameter("SecondContent");
        HttpSession session = request.getSession();
        CommentSecond commentSecond = new CommentSecond();
        commentSecond.setCommentMainId(commentId);
        commentSecond.setCommentSecondContext(secComment);
        commentSecond.setCommentSecondUserId(Integer.parseInt((String) session.getAttribute("userId")));
        commentSecond.setCommentSecondDate(new Date(System.currentTimeMillis()));
        commentSecond.setCommentSecondId(commentService.selectSecondComment() + 1);
        commentService.addSecondComment(commentSecond);
        session.setAttribute("temp", "False");
        modelAndView.setView(new RedirectView("/IJob/getCommentList"));
        return modelAndView;
    }

    //  删除评论
    @RequestMapping("/deleteSec/{commentSecondId}")
    public ModelAndView delSec(@PathVariable("commentSecondId")int commentSecondId, ModelAndView modelAndView) {
        commentService.deleteSecondComment(commentSecondId);
        modelAndView.setView(new RedirectView("/IJob/getCommentList"));
        return modelAndView;
    }

    //  增加新的分享（主评论）
    @RequestMapping("/addMain")
    public ModelAndView turnMain(ModelAndView modelAndView, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("temp2", true);
        modelAndView.setView(new RedirectView("/IJob/getCommentList"));
        return modelAndView;
    }

    //  保存新增分享
    @RequestMapping("/addMainComment")
    public ModelAndView addMain(ModelAndView modelAndView, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String context = request.getParameter("firContent");
        Comment comment = new Comment();
        comment.setCommentId(commentService.selectComment() + 1);
        comment.setCommentDate(new Date(System.currentTimeMillis()));
        comment.setCommentContext(context);
        comment.setCommentGood(0);
        comment.setCommentUserId(Integer.parseInt((String) session.getAttribute("userId")));
        commentService.addMainComment(comment);
        modelAndView.setView(new RedirectView("/IJob/getCommentList"));
        session.setAttribute("temp2", false);
        return modelAndView;
    }

}
