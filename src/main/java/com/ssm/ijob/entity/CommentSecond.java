package com.ssm.ijob.entity;

import lombok.Data;

import java.util.Date;

@Data
public class CommentSecond {
    private Integer commentSecondId;
    private Integer commentSecondUserId;
    private String commentSecondContext;
    private Date commentSecondDate;
    private Integer commentMainId;
}
