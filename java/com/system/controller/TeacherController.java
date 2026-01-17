package com.system.controller;

import com.system.exception.CustomException;
import com.system.po.*;
import com.system.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Jacey on 2017/7/6.
 */

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @Resource(name = "teacherServiceImpl")
    private TeacherService teacherService;

    @Resource(name = "courseServiceImpl")
    private CourseService courseService;

    @Resource(name = "selectedCourseServiceImpl")
    private SelectedCourseService selectedCourseService;

    @Resource(name = "collegeServiceImpl")
    private CollegeService collegeService;

    // 显示我的课程
    @RequestMapping(value = "/showCourse")
    public String stuCourseShow(Model model) throws Exception {

        Subject subject = SecurityUtils.getSubject();
        String username = (String) subject.getPrincipal();

        List<CourseCustom> list = courseService.findByTeacherID(Integer.parseInt(username));
        model.addAttribute("courseList", list);

        return "teacher/showCourse";
    }

    // 显示成绩
    @RequestMapping(value = "/gradeCourse")
    public String gradeCourse(Integer id, Model model) throws Exception {
        if (id == null) {
            return "redirect:/teacher/showCourse"; // 修复：id为空时重定向到课程列表
        }
        List<SelectedCourseCustom> list = selectedCourseService.findByCourseID(id);
        model.addAttribute("selectedCourseList", list);
        return "teacher/showGrade";
    }

    // 打分 - 展示打分页面
    @RequestMapping(value = "/mark", method = {RequestMethod.GET})
    public String markUI(SelectedCourseCustom scc, Model model) throws Exception {

        SelectedCourseCustom selectedCourseCustom = selectedCourseService.findOne(scc);

        model.addAttribute("selectedCourse", selectedCourseCustom);

        return "teacher/mark";
    }

    // 打分 - 提交分数
    @RequestMapping(value = "/mark", method = {RequestMethod.POST})
    public String mark(SelectedCourseCustom scc) throws Exception {

        selectedCourseService.updataOne(scc);

        return "redirect:/teacher/gradeCourse?id="+scc.getCourseid();
    }

    // 修改密码 - 展示页面
    @RequestMapping(value = "/passwordRest")
    public String passwordRest() throws Exception {
        return "teacher/passwordRest";
    }

    // 搜索课程
    @RequestMapping(value = "selectCourse", method = {RequestMethod.POST})
    private String selectCourse(String findByName, Model model) throws Exception {

        List<CourseCustom> list = courseService.findByName(findByName);

        model.addAttribute("courseList", list);
        return "teacher/showCourse";
    }


    //添加课程
    @RequestMapping(value = "/addCourse", method = {RequestMethod.GET})
    public String addCourseUI(Model model) throws Exception {
        // 获取当前登录教师信息，传递到页面（用于默认填充授课老师、所属院系）
        Subject subject = SecurityUtils.getSubject();
        String teacherId = (String) subject.getPrincipal();
        List<TeacherCustom> list = teacherService.findAll();
        List<College> collegeList = collegeService.finAll();

        model.addAttribute("collegeList", collegeList);
        model.addAttribute("teacherList", list);
        TeacherCustom currentTeacher = teacherService.findById(Integer.parseInt(teacherId));
        model.addAttribute("currentTeacher", currentTeacher);

        return "teacher/addCourse";
    }

    // 添加课程信息处理
    @RequestMapping(value = "/addCourse", method = {RequestMethod.POST})
    public String addCourse(@RequestParam("courseld") Integer courseId,
                            @RequestParam("coursename") String courseName,
                            @RequestParam("teacherid") Integer teacherId,
                            @RequestParam("coursetime") String courseTime,
                            @RequestParam("classroom") String classroom,
                            @RequestParam("courseweek") Integer courseWeek,
                            @RequestParam("coursetype") String courseType,
                            @RequestParam("collegeid") Integer collegeId,
                            @RequestParam("score") Integer score,
                            Model model) throws Exception {

        try {
            System.out.println("=== 接收到课程数据 ===");
            System.out.println("课程ID: " + courseId);
            System.out.println("课程名称: " + courseName);
            System.out.println("教师ID: " + teacherId);
            System.out.println("上课时间: " + courseTime);
            System.out.println("上课地点: " + classroom);
            System.out.println("周数: " + courseWeek);
            System.out.println("课程类型: " + courseType);
            System.out.println("院系ID: " + collegeId);
            System.out.println("学分: " + score);

            // 手动创建CourseCustom对象
            CourseCustom courseCustom = new CourseCustom();
            courseCustom.setCourseid(courseId);
            courseCustom.setCoursename(courseName);
            courseCustom.setTeacherid(teacherId);
            courseCustom.setCoursetime(courseTime);
            courseCustom.setClassroom(classroom);
            courseCustom.setCourseweek(courseWeek);
            courseCustom.setCoursetype(courseType);
            courseCustom.setCollegeid(collegeId);
            courseCustom.setScore(score);

            Boolean result = courseService.save(courseCustom);

            if (!result) {
                model.addAttribute("errorMsg", "课程添加失败，可能是课程号已存在");
                // 重新加载院系列表和教师列表
                Subject subject = SecurityUtils.getSubject();
                String teacherIdStr = (String) subject.getPrincipal();
                List<TeacherCustom> list = teacherService.findAll();
                List<College> collegeList = collegeService.finAll();
                TeacherCustom currentTeacher = teacherService.findById(Integer.parseInt(teacherIdStr));

                model.addAttribute("collegeList", collegeList);
                model.addAttribute("teacherList", list);
                model.addAttribute("currentTeacher", currentTeacher);

                return "teacher/addCourse";
            }

            // 重定向到课程列表
            return "redirect:/teacher/showCourse";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMsg", "添加失败：" + e.getMessage());

            // 重新加载院系列表和教师列表
            Subject subject = SecurityUtils.getSubject();
            String teacherIdStr = (String) subject.getPrincipal();
            List<TeacherCustom> list = teacherService.findAll();
            List<College> collegeList = collegeService.finAll();
            TeacherCustom currentTeacher = teacherService.findById(Integer.parseInt(teacherIdStr));

            model.addAttribute("collegeList", collegeList);
            model.addAttribute("teacherList", list);
            model.addAttribute("currentTeacher", currentTeacher);

            return "teacher/addCourse";
        }
    }


}