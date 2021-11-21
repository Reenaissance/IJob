package com.ssm.ijob.mapper;


import com.ssm.ijob.entity.Comment;
import com.ssm.ijob.entity.CommentSecond;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {

    // 添加一个分享
    int addMainComment(Comment comment);

    // 添加一个评论
    int addSecondComment(CommentSecond commentSecond);

    // 删除一个分享
    int deleteMainComment(@Param("commentId") int commentId);

    // 删除一个评论
    int deleteSecondComment(@Param("commentSecondId") int commentSecondId);

    // 点赞+1
    int updateComment(@Param("commentId") int commentId);

    // 查找用户个人的分享
    List<Comment> queryComment(@Param("commentUserId") int commentUserId);

    // 查找所有用户的分享
    List<Comment> queryAllComment();

    // 根据分享查找评论
    List<CommentSecond> querySecondComment(@Param("commentMainId") int commentMainId);

    // 查找commentId最大值
    int selectComment();

    // 查找commentSecondId最大值
    int selectSecondComment();
}
