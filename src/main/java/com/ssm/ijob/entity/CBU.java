package com.ssm.ijob.entity;

import lombok.Data;

import java.util.Date;

@Data
public class CBU {
    private String commentSecondContext;
    private String username;
    private Date time;
    private int secUserId;
    private int secId;
}
