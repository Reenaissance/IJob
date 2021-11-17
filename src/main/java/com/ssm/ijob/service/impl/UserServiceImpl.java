package com.ssm.ijob.service.impl;

import com.ssm.ijob.entity.UAC;
import com.ssm.ijob.entity.User;
import com.ssm.ijob.mapper.UserMapper;
import com.ssm.ijob.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/17 17:15
 */

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User selectUserById(String userId){
        return this.userMapper.selectUserById(userId);
    }

    @Override
    public int insertUser(User user) {
        return this.userMapper.insertUser(user);
    }

    @Override
    public int deleteUserById(String id) {
        return this.userMapper.deleteUserById(id);
    }

    @Override
    public int updateUserById(User user) {
        return this.userMapper.updateUserById(user);
    }

    @Override
    public List<User> selectUserAll() {
        return this.userMapper.selectUserAll();
    }

    @Override
    public User selectUserWithMissionById(String id) {
        return this.userMapper.selectUserWithMissionById(id);
    }

    @Override
    public User selectMissionByMissionId(String missionId) {
        return this.userMapper.selectMissionByMissionId(missionId);
    }

    @Override
    public User selectUserWithCourseById(String id) {
        return this.userMapper.selectUserWithCourseById(id);
    }

    @Override
    public User selectLoginIdPass(String userId, String userPassword) {
        return this.userMapper.selectLoginIdPass(userId,userPassword);
    }

    @Override
    public User selectLoginPrivilege(String userId, String userPrivileges) {
        return this.userMapper.selectLoginPrivilege(userId,userPrivileges);
    }

    @Override
    public User selectUserByName(String userName) {
        return this.userMapper.selectUserByName(userName);
    }
}
