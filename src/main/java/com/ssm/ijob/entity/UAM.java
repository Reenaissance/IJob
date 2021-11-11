package com.ssm.ijob.entity;

/**
 * @author Renassiance
 * @date 2021/10/17 20:30
 */

/*
多对多？
 */
public class UAM {
    private String userId;
    private String missionId;

    public UAM(){

    }
    public UAM(String userId, String missionId) {
        this.userId = userId;
        this.missionId = missionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMissionId() {
        return missionId;
    }

    public void setMissionId(String missionId) {
        this.missionId = missionId;
    }

    @Override
    public String toString() {
        return "UAM{" +
                "userId=" + userId +
                ", missionId=" + missionId +
                '}';
    }
}
