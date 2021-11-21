package com.ssm.ijob.entity;

import lombok.Data;

@Data
public class Admin {
    private Integer adminId;
    private String adminName;
    private String adminPassword;
    private String adminPhone;
    private String adminEmail;
}
