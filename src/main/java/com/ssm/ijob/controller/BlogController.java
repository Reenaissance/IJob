package com.ssm.ijob.controller;

import com.ssm.ijob.entity.Blog;
import com.ssm.ijob.entity.UAB;
import com.ssm.ijob.service.BlogService;
import com.ssm.ijob.service.UserService;
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
public class BlogController {

    @Resource
    private BlogService blogService;

    @Resource
    private UserService userService;

    // 查询所有博客信息
    @RequestMapping("/getBlogList")
    public String List(Model model) {
        List<Blog> list = blogService.queryAllBlog();
        List<UAB> listByName = new ArrayList<>();
        int index = 1;
        // 获取作者姓名列表
        for(Blog blog : list) {
            String name = userService.selectUserById(String.valueOf(blog.getBlogUserId())).getUserName();
            UAB temp = new UAB();
            temp.setBlogId(blog.getBlogId());
            temp.setUsername(name);
            temp.setBlogTitle(blog.getBlogTitle());
            temp.setBlogDate(blog.getBlogDate());
            listByName.add(temp);
            //  检查编号是否消失，进行更新
            if(blog.getBlogId() != index) {
                System.out.println(blog.getBlogId());
                blogService.updateBlogId(blog.getBlogId(), index);
                System.out.println(blog.getBlogId());
            }
            index++;
        }
        model.addAttribute("List", listByName);
        return "blogList";
    }

    // 查看博客内容
    @RequestMapping("/checkBlog/{blogId}")
    public ModelAndView check(@PathVariable("blogId")int blogId, ModelAndView modelAndView, HttpServletRequest request) {
        Blog blog = blogService.queryBlog(blogId);
        String name = userService.selectUserById(String.valueOf(blog.getBlogUserId())).getUserName();
        HttpSession session = request.getSession();
        session.setAttribute("title", blog.getBlogTitle());
        session.setAttribute("writer", name);
        session.setAttribute("context", blog.getBlogContext());
        session.setAttribute("time", blog.getBlogDate());
        modelAndView.setView(new RedirectView("/IJob/blogCheck"));
//        return "blog-check";
        return modelAndView;
    }

    // 跳转博客查看页面
    @RequestMapping("/blogCheck")
    public String trun() {
        return "blog-check";
    }

    //  跳转inputPage
    @RequestMapping("/addBlog1")
    public String add(Model model) {
        return "blog-input";
    }

    //  添加新的博客
    @RequestMapping("/addBlog2")
    public String add2(Model model, HttpServletRequest request) {
        Blog blog = new Blog();
        String title = request.getParameter("title");
        String word = request.getParameter("content");
        blog.setBlogId(blogService.checkBlogNum() + 1);
        blog.setBlogTitle(title);
        blog.setBlogContext(word);
        blog.setBlogDate(new Date(System.currentTimeMillis()));
        HttpSession session = request.getSession();
        String userId1 = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(userId1);
        blog.setBlogUserId(userId);
        blogService.addBlog(blog);
        return List(model);
    }

    //  查看个人的博客
    @RequestMapping("/checkMyBlog")
    public String checkMyBlog(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId1 = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(userId1);
        System.out.println(userId);
        List<Blog> list = blogService.queryBlogByUser(userId);
        for ( int  i =  0 ;i < list.size();i++){
            System.out.println(list.get(i).toString());
        }
        model.addAttribute("List1", list);
        return "myblog";
    }

    // 删除博客
    @RequestMapping("/deleteBlog/{blogId}")
    public ModelAndView deleteBlog(@PathVariable("blogId")int blogId,ModelAndView modelAndView) {
        blogService.deleteBlog(blogId);
        modelAndView.setView(new RedirectView("/IJob/getBlogList"));
        return modelAndView;
    }

    //  跳转到修改页面
    @RequestMapping("/editBlog/{blogId}")
    public ModelAndView turnEdit(@PathVariable("blogId")int blogId,ModelAndView modelAndView,HttpServletRequest request) {
        Blog blog = blogService.queryBlog(blogId);
        String name = userService.selectUserById(String.valueOf(blog.getBlogUserId())).getUserName();
        HttpSession session = request.getSession();
        session.setAttribute("title", blog.getBlogTitle());
        session.setAttribute("writer", name);
        session.setAttribute("context", blog.getBlogContext());
        session.setAttribute("time", blog.getBlogDate());
        session.setAttribute("blogId",blogId);
        modelAndView.setView(new RedirectView("/IJob/toEdit"));
        return modelAndView;
    }

    //  间隔跳转
    @RequestMapping("/toEdit")
    public String toEdit() {
        return "blog-edit";
    }

    //  修改博客
    @RequestMapping("/updateBlog/{blogId}")
    public ModelAndView editBlog(@PathVariable("blogId")int blogId,ModelAndView modelAndView,HttpServletRequest request) {
        Blog blog = new Blog();
        String title = request.getParameter("title");
        String word = request.getParameter("content");
        blog.setBlogId(blogId);
        blog.setBlogTitle(title);
        blog.setBlogContext(word);
        blog.setBlogDate(new Date(System.currentTimeMillis()));
        HttpSession session = request.getSession();
        String userId1 = (String) session.getAttribute("userId");
        int userId = Integer.parseInt(userId1);
        blog.setBlogUserId(userId);
        blogService.updateBlog(blog);
        modelAndView.setView(new RedirectView("/IJob/checkMyBlog"));
        return modelAndView;
    }
}
