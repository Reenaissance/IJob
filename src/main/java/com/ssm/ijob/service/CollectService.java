package com.ssm.ijob.service;

import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.entity.PageBean;
import com.ssm.ijob.entity.UAC;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Renassiance
 * @date 2021/11/13 16:52
 */
public interface CollectService {
    int insertUAC (UAC uac);
    int deleteUAC(UAC uac);
    int insertSelective(UAC uac);
    UAC getUAC(@Param("userId") String userId, @Param("courseId") String courseId);
    List<UAC> selectByUserId(@Param("userId") String userId);
    List<UAC> selectByCourseId(String courseId);

}
