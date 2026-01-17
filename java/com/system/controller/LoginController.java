package com.system.controller;

import com.system.exception.CustomException;
import com.system.po.Student;
import com.system.po.Userlogin;
import com.system.service.StudentService;
import com.system.service.UserloginService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/")
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Resource(name = "studentServiceImpl")
    private StudentService studentService;

    @Resource(name = "userloginServiceImpl")
    private UserloginService userloginService;

    // 登录跳转
    @RequestMapping(value = "/login", method = org.springframework.web.bind.annotation.RequestMethod.GET)
    public String loginUI() throws Exception {
        logger.info("访问登录页面");
        return "../../login";
    }

    // 登录表单处理
    @RequestMapping(value = "/login", method = org.springframework.web.bind.annotation.RequestMethod.POST)
    public String login(Userlogin userlogin) throws Exception {
        logger.info("处理登录请求：账号={}, 角色={}", userlogin.getUsername(), userlogin.getRole());
        UsernamePasswordToken token = new UsernamePasswordToken(userlogin.getUsername(), userlogin.getPassword());
        Subject subject = SecurityUtils.getSubject();
        subject.login(token);

        if (subject.hasRole("admin") && userlogin.getRole() == 0) {
            return "redirect:/admin/showStudent";
        } else if (subject.hasRole("teacher") && userlogin.getRole() == 1) {
            return "redirect:/teacher/showCourse";
        } else if (subject.hasRole("student") && userlogin.getRole() == 2) {
            return "redirect:/student/showCourse";
        } else {
            throw new CustomException("请选择正确的身份登陆");
        }
    }


}