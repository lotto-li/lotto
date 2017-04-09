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

import com.lotto.domain.Notice;
import com.lotto.services.NoticeService;

import net.sf.json.JSONArray;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午10:18:26 
* @Description 
*/
@Controller
public class NoticeController {
    
    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value="/notice", method=RequestMethod.GET)
    public String notice(HttpServletRequest request, HttpServletResponse response){
        List<Notice> notices = noticeService.findAll();
        JSONArray jsonArray = JSONArray.fromObject(notices);
        request.setAttribute("notices", jsonArray);
        return "notice";
    }

    @ResponseBody
    @RequestMapping(value="/notice", method=RequestMethod.POST)
    public Map<String, Object> saveNotice(Notice notice){
        Map<String, Object> result = new HashMap<>();
        notice = noticeService.save(notice);
        String message = "";
        if(notice.getId() == null){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/notice", method=RequestMethod.PUT)
    public Map<String, Object> updateNotice(Notice notice){
        Map<String, Object> result = new HashMap<>();
        notice = noticeService.save(notice);
        String message = "";
        if(notice.getId() == null){
            message = "修改失败!";
        }else{
            message = "修改成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/deleteNotice", method=RequestMethod.POST)
    public Map<String, Object> deleteNotice(Notice notice){
        Map<String, Object> result = new HashMap<>();
        noticeService.delete(notice);
        String message = "删除成功!";
        result.put("msg", message);
        return result;
    }
}
