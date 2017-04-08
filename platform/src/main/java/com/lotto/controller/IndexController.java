package com.lotto.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotto.constant.Constant;
import com.lotto.domain.SysUser;
import com.lotto.services.SysUserService;
import com.lotto.utils.ValidateCode;

/** 
* @author Hydra
* @version 创建时间:2017年4月8日 下午11:29:22 
* @Description 
*/
@Controller
public class IndexController {
    
    @Autowired
    SysUserService sysUserService;
    
    /**
     * 登录页面
     */
    @RequestMapping(value="/login")
    public String login(){
        return "login";
    }
    
    /**
     * 登录校验
     */
    @ResponseBody
    @RequestMapping(value="/loginValidate")
    public Map<String, Object> loginValidate(HttpServletRequest request, HttpServletResponse response) throws IOException{
        Map<String, Object> result = new HashMap<String, Object>();
        HttpSession session = request.getSession();
        // 获取用户填写的登录用户名
        String username = request.getParameter("username");
        // 获取用户填写的登录密码
        String password = request.getParameter("userpwd");
        // 获取用户填写的验证码
        String code = request.getParameter("code");
        // 获取生成存到session的验证码
        String sessionCode = (String) session.getAttribute("code");
        String message = "";
        if (sessionCode.equalsIgnoreCase(code)) {
            //验证用户账户及密码
            SysUser user = sysUserService.findByUsername(username);
            if(user != null){
                if(user.getPassword().equals(password)){
                    session.setAttribute(Constant.CURRENT_USER, user);
                    message = "登录成功!";
                }else{
                    message = "密码输入错误!";
                }
            }else{
                message = "用户不存在!";
            }
        } else {
            message = "验证码填写错误!";
        }
        result.put("msg", message);
        return result;
    }
    
    //验证码
    @RequestMapping(value="/validateCode")
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException{
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();
        // 生成图片的width、height、个数、干扰数
        ValidateCode vCode = new ValidateCode(120, 35, 1, 50);
        session.setAttribute("code", vCode.getCode());// 将验证码存到session中
        vCode.write(response.getOutputStream());
    }
    
    //首页
    @RequestMapping(value="/home")
    public String home(){
        return "homePage";
    }

}
