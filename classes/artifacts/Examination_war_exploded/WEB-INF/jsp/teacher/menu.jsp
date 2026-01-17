<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #nav {
        background: linear-gradient(180deg, #ff6b35 0%, #ff8c42 100%);
        border-radius: 10px;
        padding: 20px 0;
        box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
        margin-top: 20px;
    }

    .nav-stacked {
        margin-top: 0;
    }

    #nav li {
        margin: 0;
    }

    #nav li a {
        color: white !important;
        font-weight: 500;
        font-size: 16px;
        padding: 15px 25px;
        margin: 5px 10px;
        border-radius: 8px;
        transition: all 0.3s ease;
        border-left: 4px solid transparent;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    #nav li a:hover {
        background: rgba(255, 255, 255, 0.2);
        transform: translateX(10px);
        border-left: 4px solid #fff3cd;
        text-decoration: none;
    }

    #nav li.active a {
        background: rgba(255, 255, 255, 0.3);
        border-left: 4px solid #fff3cd;
        font-weight: 600;
        color: #fff3cd !important;
    }

    #nav li a .badge {
        background: rgba(255, 255, 255, 0.3);
        color: white;
        font-size: 12px;
    }

    .nav-pills > li.active > a,
    .nav-pills > li.active > a:hover,
    .nav-pills > li.active > a:focus {
        background-color: rgba(255, 255, 255, 0.3);
    }
</style>

<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="/teacher/showCourse">我的课程<span class="badge pull-right"></span></a></li>
        <li><a href="/teacher/passwordRest">修改密码</a></li>
        <li><a href="/logout">退出系统</a></li>
    </ul>
</div>