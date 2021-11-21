package com.ssm.ijob.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class CAU {
    private int commentId;
    private String username;
    private int commentGood;
    private String commentContext;
    private Date commentDate;
    private List<CBU> iCBU;
}
