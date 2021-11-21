package com.ssm.ijob.mapper;
import org.apache.ibatis.annotations.Param;
import com.ssm.ijob.entity.Blog;
import java.util.List;


public interface BlogMapper {

    // 增加一个新的博客
    int addBlog(Blog blog);

    // 删除一个新的博客
    int deleteBlog(@Param("blogId") int blogId);

    // 修改一个新的博客
    int updateBlog(Blog blog);

    // 查询一个新的博客
    Blog queryBlog(@Param("blogId") int blogId);

    // 查询所有的博客
    List<Blog> queryAllBlog();

    // 查找用户博客
    List<Blog> queryBlogByUser(@Param("blogUserId") int blogUserId);

    //  查询博客数量
    int queryBlogNum();

    //  更新博客id
    void updateBlogId(@Param("oldId") int oldId, @Param("newId") int newId);

}
