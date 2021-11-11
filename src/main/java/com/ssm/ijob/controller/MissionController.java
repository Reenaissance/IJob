package com.ssm.ijob.controller;

import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.service.MissionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

/**
 * @author Renassiance
 * @date 2021/10/19 20:32
 */
@Controller
public class MissionController {
    @Resource
    private MissionService missionService;
    @RequestMapping("/mission")
    public String mission(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", missionService.findByPage(currentPage));//回显分页数据
        return "employee/mission";
    }
    @RequestMapping(value="/detail/{missionId}")
    public String detail(@PathVariable("missionId")String missionId,Model model){
        Mission mission = missionService.selectMissionDetail(missionId);
        mission.toString();
        model.addAttribute("mission",mission);
        return "employee/detail";
    }
}
