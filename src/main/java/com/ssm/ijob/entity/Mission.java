package com.ssm.ijob.entity;

import java.util.Date;

/**
 * @author Renassiance
 * @date 2021/10/16 19:02
 */
public class Mission {
    private String missionId;
    private String missionType;


    private String missionMessage;
    private String missionSalary;
    private String missionStatus;
    private Date missionDate;
    private String missionDetail;

    public Mission() {
    }

    public Mission(String missionId, String missionType, String missionMessage, String missionSalary, String missionStatus, Date missionDate,String missionDetail) {
        this.missionId = missionId;
        this.missionType = missionType;
        this.missionMessage = missionMessage;
        this.missionSalary = missionSalary;
        this.missionStatus = missionStatus;
        this.missionDate = missionDate;
        this.missionDetail = missionDetail;
    }

    public String getMissionDetail() {
        return missionDetail;
    }

    public void setMissionDetail(String missionDetail) {
        this.missionDetail = missionDetail;
    }
    public String getMissionSalary() {
        return missionSalary;
    }

    public void setMissionSalary(String missionSalary) {
        this.missionSalary = missionSalary;
    }

    public String getMissionStatus() {
        return missionStatus;
    }

    public void setMissionStatus(String missionStatus) {
        this.missionStatus = missionStatus;
    }

    public String getMissionId() {
        return missionId;
    }

    public void setMissionId(String missionId) {
        this.missionId = missionId;
    }

    public String getMissionType() {
        return missionType;
    }

    public void setMissionType(String missionType) {
        this.missionType = missionType;
    }

    public String getMissionMessage() {
        return missionMessage;
    }

    public void setMissionMessage(String missionMessage) {
        this.missionMessage = missionMessage;
    }

    public Date getMissionDate() {
        return missionDate;
    }

    public void setMissionDate(Date missionDate) {
        this.missionDate = missionDate;
    }


    @Override
    public String toString() {
        return "Mission{" +
                "missionId=" + missionId +
                ", missionType='" + missionType + '\'' +
                ", missionMessage='" + missionMessage + '\'' +
                ", missionSalary='" + missionSalary + '\'' +
                ", missionStatus='" + missionStatus + '\'' +
                ", missionDate=" + missionDate +
                ", missionDetail='" + missionDetail + '\'' +
                '}';
    }
}
