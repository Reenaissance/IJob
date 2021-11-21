package com.ssm.ijob.entity;
import lombok.Data;

import java.util.Date;

@Data
public class Blog {
    private Integer blogId;
    private Integer blogUserId;
    private String blogTitle;
    private String blogContext;
    private Date blogDate;
}
