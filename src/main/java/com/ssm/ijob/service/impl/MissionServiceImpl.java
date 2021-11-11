package com.ssm.ijob.service.impl;

import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.entity.PageBean;
import com.ssm.ijob.entity.User;
import com.ssm.ijob.mapper.MissionMapper;
import com.ssm.ijob.service.MissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/19 20:22
 */
@Service
public class MissionServiceImpl implements MissionService {
    @Resource
    private MissionMapper missionMapper;
    @Override
    public Mission selectMissionById(String userId){
        return this.missionMapper.selectMissionById(userId);
    }

    @Override
    public int insertMission(Mission mission) {
        return this.missionMapper.insertMission(mission);
    }

    @Override
    public int deleteMissionById(String id) {
        return this.missionMapper.deleteMissionById(id);
    }

    @Override
    public int updateMissionById(Mission mission) {
        return this.missionMapper.updateMissionById(mission);
    }

    @Override
    public List<Mission> selectMissionAll() {
        return this.missionMapper.selectMissionAll();
    }

    @Override
    public List<Mission> selectMissionByStatus(String missionStatus) {
        return this.missionMapper.selectMissionByStatus(missionStatus);
    }

    @Override
    public List<Mission> selectMissionByType(String missionType) {
        return this.missionMapper.selectMissionByType(missionType);
    }

    @Override
    public Mission selectMissionDetail(String missionId) {
        return this.missionMapper.selectMissionDetail(missionId);
    }

    @Override
    public PageBean<Mission> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Mission> pageBean = new PageBean<Mission>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);
        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);
        //封装总记录数
        int totalCount = missionMapper.selectMissionCount();
        pageBean.setTotalCount(totalCount);
        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Mission> lists = missionMapper.findByPage(map);
        pageBean.setLists(lists);
        return pageBean;
    }

}
