package com.ssm.ijob.service.impl;


import com.ssm.ijob.entity.Blog;
import com.ssm.ijob.mapper.BlogMapper;
import com.ssm.ijob.service.BlogService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {


    @Autowired
    private BlogMapper blogMapper;


    @Override
    public int addBlog(Blog blog) {
        return blogMapper.addBlog(blog);
    }

    @Override
    public int deleteBlog(int blogId) {
        return blogMapper.deleteBlog(blogId);
    }

    @Override
    public int updateBlog(Blog blog) {
        return blogMapper.updateBlog(blog);
    }

    @Override
    public Blog queryBlog(int blogId) {
        return blogMapper.queryBlog(blogId);
    }

    @Override
    public List<Blog> queryAllBlog() {
        return blogMapper.queryAllBlog();
    }

    @Override
    public List<Blog> queryBlogByUser(@Param("blogUserId") int blogUserId) {
        return blogMapper.queryBlogByUser(blogUserId);
    }

    @Override
    public int checkBlogNum() {
        return blogMapper.queryBlogNum();
    }

    @Override
    public void updateBlogId(@Param("oldId") int oldId,@Param("newId") int newId) {
        blogMapper.updateBlogId(oldId, newId);
    }

}
