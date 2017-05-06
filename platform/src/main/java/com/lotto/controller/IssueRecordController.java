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

import com.lotto.domain.IssueRecord;
import com.lotto.services.IssueRecordService;

import net.sf.json.JSONArray;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午10:18:26 
* @Description 
*/
@Controller
public class IssueRecordController {
	@Autowired
    private IssueRecordService issueRecordService;

    @RequestMapping(value="/issueRecord", method=RequestMethod.GET)
    public String issueRecord(HttpServletRequest request, HttpServletResponse response){
        List<IssueRecord> issueRecords = issueRecordService.findAll();
        JSONArray jsonArray = JSONArray.fromObject(issueRecords);
        request.setAttribute("issueRecords", jsonArray);
        return "issueRecord";
    }

    @ResponseBody
    @RequestMapping(value="/issueRecord", method=RequestMethod.POST)
    public Map<String, Object> saveIssueRecord(IssueRecord issueRecord){
        Map<String, Object> result = new HashMap<>();
        issueRecord = issueRecordService.save(issueRecord);
        String message = "";
        if(issueRecord.getId() == null){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/issueRecord", method=RequestMethod.PUT)
    public Map<String, Object> updateIssueRecord(IssueRecord issueRecord){
        Map<String, Object> result = new HashMap<>();
        issueRecord = issueRecordService.save(issueRecord);
        String message = "";
        if(issueRecord.getId() == null){
            message = "修改失败!";
        }else{
            message = "修改成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/deleteIssueRecord", method=RequestMethod.POST)
    public Map<String, Object> deleteIssueRecord(IssueRecord issueRecord){
        Map<String, Object> result = new HashMap<>();
        issueRecordService.delete(issueRecord);
        String message = "删除成功!";
        result.put("msg", message);
        return result;
    }
    
}
