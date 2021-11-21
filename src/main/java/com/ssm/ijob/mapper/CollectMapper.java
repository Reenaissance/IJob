package com.ssm.ijob.mapper;

import com.ssm.ijob.entity.UAC;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/11/12 0:32
 */
public interface CollectMapper {
    int insertUAC (UAC uac);
    int deleteUAC(UAC uac);
    int insertSelective(UAC uac);
    UAC getUAC(@Param("userId") String userId, @Param("courseId") String courseId);
    List<UAC> selectByUserId(String userId);
    List<UAC> selectByCourseId(String courseId);
}
