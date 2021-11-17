package com.ssm.ijob.controller;

import com.ssm.ijob.entity.Course;
import com.ssm.ijob.entity.Mission;
import com.ssm.ijob.entity.User;
import com.ssm.ijob.service.CourseService;
import com.ssm.ijob.service.MissionService;
import com.ssm.ijob.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Renassiance
 * @date 2021/10/19 20:32
 */
@Controller
public class MissionController {
    @Resource
    private MissionService missionService;
    @Resource
    private UserService userService;
    @RequestMapping("/mission")
    public String mission(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", missionService.findByPage(currentPage));//回显分页数据
        return "employee/mission";
    }
    @RequestMapping("/employer/mission")
    public String erMission(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage, Model model){
        model.addAttribute("pagemsg", missionService.findByPage(currentPage));//回显分页数据
        return "employer/mission";
    }
    @RequestMapping("/updateStatus")
    public String updateStatus(String missionId){
        missionService.updateMissionStatus(missionId);
        Mission mission = missionService.selectMissionById(missionId);
        System.out.println(mission.toString());
        return "redirect:/mission";
    }

    @RequestMapping(value="/detail/{missionId}")
    public String detail(@PathVariable("missionId")String missionId,Model model){
        Mission mission = missionService.selectMissionDetail(missionId);
        model.addAttribute("mission",mission);
        return "employee/detail";
    }
    @RequestMapping(value="/erDetail/{missionId}")
    public String erDetail(@PathVariable("missionId")String missionId,Model model){
        Mission mission = missionService.selectMissionDetail(missionId);
        model.addAttribute("mission",mission);
        return "employer/detail";
    }
    @RequestMapping(value = "/myMission/{userId}")
    public String myMission(Model model,@PathVariable("userId")String userId){
        User user = userService.selectUserWithMissionById(userId);
        System.out.println(user.toString());
        model.addAttribute("user",user);
        return "employer/myMission";
    }
    @RequestMapping("/toAddMission")
    public String toAddMission(){
        return "employer/addMission";
    }
    @RequestMapping("/addMission")
    public String addMission(Mission mission,Model model){
        missionService.insertMission(mission);
        model.addAttribute("missionId",mission.getMissionId());
        return "employer/myMission";
    }

    @RequestMapping("/toUpdateMission")
    public String toUpdateMission(Model model,String missionId){
        Mission mission = missionService.selectMissionById(missionId);
//        System.out.println(course);
        model.addAttribute("mission",mission);
        return "employer/updateMission";
    }
    @RequestMapping("/updateMission")
    public String updateMission(Mission mission){
        missionService.updateMissionById(mission);
        return "redirect:/employer/myMission";
    }
    @RequestMapping("/deleteMission/{id}")
    public String deleteMission(@PathVariable("id") String id){
        missionService.deleteMissionById(id);
        return "redirect:/employer/myMission";
    }
    @RequestMapping("/queryMissionById")
    public String queryUserByName(String missionId,Model model){
        Mission mission = missionService.selectMissionById(missionId);
        List<Mission> list = new ArrayList<>();
        if(mission==null){
            model.addAttribute("error","未找到");
        }
        list.add(mission);
        model.addAttribute("list",list);
        return "redirect:/employer/myMission";
    }
}
