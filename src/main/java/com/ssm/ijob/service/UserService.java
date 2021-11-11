package com.ssm.ijob.service;

import com.ssm.ijob.entity.UAC;
import com.ssm.ijob.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/17 17:14
 */
public interface UserService {
    User selectUserById(String userId);
    int insertUser(User user);
    int deleteUserById(String id);
    int updateUserById(User user);
    List<User> selectUserAll();
    User selectUserWithMissionById(String id);
    User selectUserWithCourseById(String id);
    User selectLoginIdPass(@Param("userId") String userId, @Param("userPassword") String userPassword);
    User selectLoginPrivilege(@Param("userId") String userId, @Param("userPrivileges") String userPrivileges);
    int insertUAC (UAC uac);
    int deleteUAC(UAC uac);
    UAC getUAC(@Param("userId") String userId, @Param("courseId") String courseId);
}
