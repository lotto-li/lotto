package com.lotto.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotto.domain.SysUser;
import com.lotto.services.SysUserService;
import com.lotto.utils.MyConnection;

import net.sf.json.JSONArray;

/** 
* @author lotto
* @version 创建时间:2017年4月8日 下午11:29:22 
* @Description 
*/
public class UserController {
	@Autowired
    private SysUserService userService;

    @RequestMapping(value="/sysUser", method=RequestMethod.GET)
    public String issue(HttpServletRequest request, HttpServletResponse response){
        List<SysUser> user = userService.findAll();
        JSONArray jsonArray = JSONArray.fromObject(user);
        request.setAttribute("sysUser", jsonArray);
        return "sysUser";
    }

    @ResponseBody
    @RequestMapping(value="/sysUser", method=RequestMethod.POST)
    public Map<String, Object> saveSysUser(SysUser user){
        Map<String, Object> result = new HashMap<>();
        user = userService.save(user);
        String message = "";
        if(user.getId() == null){
            message = "保存失败!";
        }else{
            message = "保存成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/sysUser", method=RequestMethod.PUT)
    public Map<String, Object> updateSysUser(SysUser user){
        Map<String, Object> result = new HashMap<>();
        user = userService.save(user);
        String message = "";
        if(user.getId() == null){
            message = "修改失败!";
        }else{
            message = "修改成功!";
        }
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/deleteSysUser", method=RequestMethod.POST)
    public Map<String, Object> deleteSysUser(SysUser user){
        Map<String, Object> result = new HashMap<>();
        userService.delete(user);
        String message = "删除成功!";
        result.put("msg", message);
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value="/registerValidate", method=RequestMethod.POST)
    public Map<String, Object> registerValidate(SysUser user){
        Map<String, Object> result = new HashMap<>();
        String username = user.getUsername();
        String password = user.getPassword();
        String sql = "insert into sys_user(username,password) values("+username+","+password+")";
        boolean res = MyConnection.doSave(sql);
        String message = "删除成功!";
        result.put("msg", message);
        return result;
    }
}
