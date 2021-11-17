package com.ssm.ijob.service;

import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.entity.PageBean;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/19 17:12
 */
public interface MissionService {
    //增删改查
    int insertMission(Mission mission);
    int deleteMissionById(String missionId);
    int updateMissionById(Mission mission);
    int updateMissionStatus(String missionId);
    Mission selectMissionById(String missionId);
    Mission selectMissionDetail(String missionId);
    List<Mission> selectMissionAll();
    List<Mission> selectMissionByStatus(String missionStatus);
    List<Mission> selectMissionByType(String missionType);
    PageBean<Mission> findByPage(int currentPage);
}
