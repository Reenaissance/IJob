package com.ssm.ijob.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Comment {
    private Integer commentId;
    private Integer commentUserId;
    private String commentContext;
    private Date commentDate;
    private Integer commentGood;
}
