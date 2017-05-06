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

import com.lotto.domain.Issue;
import com.lotto.services.IssueService;

import net.sf.json.JSONArray;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午10:18:26 
* @Description 
*/
@Controller
public class IssueController {
    
    @Autowired
    private IssueService issueService;

    @RequestMapping(value="/issue", method=RequestMethod.GET)
    public String issue(HttpServletRequest request, HttpServletResponse response){
        List<Issue> issues = issueService.findAll();
        JSONArray jsonArray = JSONArray.fromObject(issues);
        request.setAttribute("issues", jsonArray);
        return "issue";
    }

    @ResponseBody
    @RequestMapping(value="/issue", method=RequestMethod.POST)
    public Map<String, Object> saveIssue(Issue issue){
        Map<String, Object> result = new HashMap<>();
        issue = issueService.save(issue);
        String message = "";
        if(issue.getId() == null){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/issue", method=RequestMethod.PUT)
    public Map<String, Object> updateIssue(Issue issue){
        Map<String, Object> result = new HashMap<>();
        issue = issueService.save(issue);
        String message = "";
        if(issue.getId() == null){
            message = "修改失败!";
        }else{
            message = "修改成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/deleteIssue", method=RequestMethod.POST)
    public Map<String, Object> deleteIssue(Issue issue){
        Map<String, Object> result = new HashMap<>();
        issueService.delete(issue);
        String message = "删除成功!";
        result.put("msg", message);
        return result;
    }
}
