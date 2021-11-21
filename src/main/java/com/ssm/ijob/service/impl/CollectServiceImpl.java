package com.ssm.ijob.service.impl;

import com.ssm.ijob.entity.UAC;
import com.ssm.ijob.mapper.CollectMapper;
import com.ssm.ijob.service.CollectService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/11/13 16:53
 */
@Service
public class CollectServiceImpl implements CollectService {
    @Resource
    CollectMapper collectMapper;
    @Override
    public int insertUAC(UAC uac) {
        return collectMapper.insertUAC(uac);
    }

    @Override
    public int deleteUAC(UAC uac) {
        return collectMapper.deleteUAC(uac);
    }

    @Override
    public int insertSelective(UAC uac) {
        return collectMapper.insertSelective(uac);
    }

    @Override
    public UAC getUAC(String userId, String courseId) {
        return collectMapper.getUAC(userId,courseId);
    }

    @Override
    public List<UAC> selectByUserId(String userId) {
        return collectMapper.selectByUserId(userId);
    }

    @Override
    public List<UAC> selectByCourseId(String courseId) {
        return collectMapper.selectByCourseId(courseId);
    }
}
