package com.ssm.ijob.mapper;

import com.ssm.ijob.entity.Mission;

import java.util.HashMap;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/17 15:33
 */
public interface MissionMapper {
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

    List<Mission> findByPage(HashMap<String,Object> map);
    int selectMissionCount();
}
