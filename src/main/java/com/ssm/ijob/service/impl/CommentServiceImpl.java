package com.ssm.ijob.service.impl;
import com.ssm.ijob.entity.Comment;
import com.ssm.ijob.entity.CommentSecond;
import com.ssm.ijob.mapper.CommentMapper;
import com.ssm.ijob.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int addMainComment(Comment comment) {
        return commentMapper.addMainComment(comment);
    }

    @Override
    public int addSecondComment(CommentSecond commentSecond) {
        return commentMapper.addSecondComment(commentSecond);
    }

    @Override
    public int deleteMainComment(int commentId) {
        return commentMapper.deleteMainComment(commentId);
    }

    @Override
    public int deleteSecondComment(int commentSecondId) {
        return commentMapper.deleteSecondComment(commentSecondId);
    }

    @Override
    public int updateComment(int commentId) {
        return commentMapper.updateComment(commentId);
    }

    @Override
    public List<Comment> queryComment(int commentUserId) {
        return commentMapper.queryComment(commentUserId);
    }

    @Override
    public List<Comment> queryAllComment() {
        return commentMapper.queryAllComment();
    }

    @Override
    public List<CommentSecond> querySecondComment(int commentMainId) {
        return commentMapper.querySecondComment(commentMainId);
    }

    @Override
    public int selectComment() {
        return commentMapper.selectComment();
    }

    @Override
    public int selectSecondComment() {
        return commentMapper.selectSecondComment();
    }
}
