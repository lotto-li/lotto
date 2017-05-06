package com.lotto.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotto.domain.Team;
import com.lotto.domain.TeamTeamers;
import com.lotto.services.TeamService;
import com.lotto.utils.MyConnection;

import net.sf.json.JSONArray;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午10:18:26 
* @Description 
*/
@Controller
public class TeamController {
    
    @Autowired
    private TeamService teamService;

    @RequestMapping(value="/team", method=RequestMethod.GET)
    public String team(HttpServletRequest request, HttpServletResponse response){
    	
        //List<Team> teams = teamService.findAll();
    	List<Team> teams = MyConnection.doQuery();
        JSONArray jsonArray = JSONArray.fromObject(teams);
        request.setAttribute("teams", jsonArray);
        return "team";
    }

    @ResponseBody
    @RequestMapping(value="/team", method=RequestMethod.POST)
    public Map<String, Object> saveTeam(Team team){
        Map<String, Object> result = new HashMap<>();
        team = teamService.save(team);
        String message = "";
        if(team.getId() == null){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/team", method=RequestMethod.PUT)
    public Map<String, Object> updateteam(Team team){
        Map<String, Object> result = new HashMap<>();
        team = teamService.save(team);
        String message = "";
        if(team.getId() == null){
            message = "修改失败!";
        }else{
            message = "修改成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/deleteTeam", method=RequestMethod.POST)
    public Map<String, Object> deleteTeam(Team team){
        Map<String, Object> result = new HashMap<>();
        teamService.delete(team);
        String message = "删除成功!";
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/addTeam", method=RequestMethod.POST)
    public Map<String, Object> addTeam(TeamTeamers team){
        Map<String, Object> result = new HashMap<>();
        String team_id = team.getTeamId();
        String teamers_id = team.getTeamersId();
        String sql = "insert into t_team_teamers(team_id,teamers_id) values("+team_id+","+teamers_id+")";
        boolean res = MyConnection.doSave(sql);
        String message = "";
        if(!res){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/exitTeam", method=RequestMethod.POST)
    public Map<String, Object> exitTeam(TeamTeamers team){
        Map<String, Object> result = new HashMap<>();
        String team_id = team.getTeamId();
        String teamers_id = team.getTeamersId();
        String sql = "delete from t_team_teamers where team_id = "+team_id+" and teamers_id = "+teamers_id;
        boolean res = MyConnection.doSave(sql);
        String message = "";
        if(!res){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
}
