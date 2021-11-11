package com.ssm.ijob.mapper;

import com.ssm.ijob.entity.UAC;
import com.ssm.ijob.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/17 15:39
 */
public interface UserMapper {
    //增删改查
    int insertUser(User user);
    int deleteUserById(String userId);
    int updateUserById(User user);
    User selectUserById(String userId);
//    User selectUserByPrivilege(Integer privilege);
    List<User> selectUserAll();
    User selectLoginIdPass(@Param("userId") String userId,@Param("userPassword") String userPassword);
    User selectLoginPrivilege(@Param("userId") String userId, @Param("userPrivileges") String userPrivileges);
    int insertUAC (UAC uac);
    int deleteUAC(UAC uac);
    UAC getUAC(@Param("userId") String userId, @Param("courseId") String jobId);
//    查询带有Mission信息的User
    User selectUserWithMissionById(String userId);
//    查询带有Course信息的User
    User selectUserWithCourseById(String userId);
}
