<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #nav {
        background: white;
        border-radius: 10px;
        padding: 15px 0;
        box-shadow: 0 3px 15px rgba(52, 152, 219, 0.1);
        border: 1px solid #e3e8ed;
    }
    #nav li {
        margin: 5px 15px;
        border-radius: 8px;
        transition: all 0.3s;
    }
    #nav li a {
        color: #2c3e50;
        font-weight: 500;
        padding: 15px;
        border-left: 4px solid transparent;
        font-size: 14px;
    }
    #nav li a:hover {
        background: linear-gradient(90deg, rgba(52, 152, 219, 0.1) 0%, rgba(52, 152, 219, 0.05) 100%);
        color: #3498db;
        border-left: 4px solid #3498db;
        transform: translateX(5px);
    }
    #nav li.active a {
        background: linear-gradient(90deg, #3498db 0%, #2980b9 100%);
        color: white;
        border-left: 4px solid #2c3e50;
        box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
    }
    #nav li a i {
        width: 20px;
        text-align: center;
        margin-right: 10px;
    }
    #nav li a .badge {
        background: #e74c3c;
        color: white;
        font-size: 11px;
        padding: 3px 8px;
        border-radius: 10px;
    }
</style>

<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="/admin/showCourse">
            <i class="fas fa-book"></i> 课程管理
            <span class="badge pull-right"></span>
        </a></li>
        <li><a href="/admin/showStudent">
            <i class="fas fa-users"></i> 学生管理
            <span class="badge pull-right"></span>
        </a></li>
        <li><a href="/admin/showTeacher">
            <i class="fas fa-chalkboard-teacher"></i> 教师管理
            <span class="badge pull-right"></span>
        </a></li>
        <li><a href="/admin/userPasswordRest">
            <i class="fas fa-key"></i> 账号密码重置
        </a></li>
        <li><a href="/admin/passwordRest">
            <i class="fas fa-lock"></i> 修改密码
        </a></li>
        <li><a href="/logout" style="color: #e74c3c;">
            <i class="fas fa-sign-out-alt"></i> 退出系统
        </a></li>
    </ul>
</div>