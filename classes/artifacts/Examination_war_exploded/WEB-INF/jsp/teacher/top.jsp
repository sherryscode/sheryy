<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-- 顶栏 -->
<style>
    #top {
        background: linear-gradient(135deg, #ff7e5f 0%, #feb47b 100%);
        color: white;
        padding: 15px 0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        border-bottom: 4px solid #ff6b35;
        position: relative;
        z-index: 1000;
    }

    #top::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(255, 255, 255, 0.05);
        pointer-events: none;
    }

    .navbar-brand {
        color: white !important;
        font-weight: 700;
        font-size: 24px;
        padding: 15px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        letter-spacing: 1px;
    }

    .navbar-brand i {
        margin-right: 12px;
        font-size: 28px;
        color: #fff3cd;
    }

    .navbar {
        background: transparent !important;
        border: none !important;
        margin-bottom: 0;
    }

    .dropdown-toggle {
        background: rgba(255, 255, 255, 0.2) !important;
        border: 2px solid rgba(255, 255, 255, 0.4) !important;
        color: white !important;
        border-radius: 30px !important;
        padding: 10px 25px !important;
        transition: all 0.3s ease !important;
        font-weight: 600;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
    }

    .dropdown-toggle:hover {
        background: rgba(255, 255, 255, 0.3) !important;
        border-color: rgba(255, 255, 255, 0.7) !important;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.25);
    }

    .dropdown-toggle:focus {
        outline: none;
        box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.3);
    }

    .dropdown-toggle i {
        margin-right: 10px;
        font-size: 18px;
        vertical-align: middle;
    }

    .glyphicon-user {
        font-size: 18px;
        margin-right: 8px;
        color: #fff3cd;
    }

    .caret {
        margin-left: 10px;
        border-top-color: white;
        border-bottom-color: white;
    }

    .dropdown-menu {
        border: none;
        border-radius: 10px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        margin-top: 15px;
        min-width: 220px;
        padding: 10px 0;
        background: white;
        overflow: hidden;
    }

    .dropdown-menu::before {
        content: '';
        position: absolute;
        top: -10px;
        right: 30px;
        width: 20px;
        height: 20px;
        background: white;
        transform: rotate(45deg);
    }

    .dropdown-menu li a {
        color: #2c3e50;
        padding: 12px 25px;
        transition: all 0.3s ease;
        font-weight: 500;
        border-left: 4px solid transparent;
    }

    .dropdown-menu li a:hover {
        background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
        color: white;
        padding-left: 35px;
        border-left: 4px solid #ff6b35;
    }

    .dropdown-menu li a i {
        width: 20px;
        margin-right: 12px;
        text-align: center;
    }

    .dropdown-menu .divider {
        margin: 8px 0;
        background-color: #e0e0e0;
        height: 1px;
        opacity: 0.5;
    }

    shiro:principal {
        font-weight: 600;
        color: #fff3cd;
        margin-left: 5px;
    }

    /* 添加一些动画效果 */
    .dropdown-toggle {
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0% {
            box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.1);
        }
        70% {
            box-shadow: 0 0 0 10px rgba(255, 255, 255, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(255, 255, 255, 0);
        }
    }

    /* 确保响应式设计 */
    @media (max-width: 768px) {
        .navbar-brand {
            font-size: 18px;
            padding: 10px;
        }

        .navbar-brand i {
            font-size: 20px;
        }

        .dropdown-toggle {
            padding: 8px 15px !important;
            font-size: 14px;
        }
    }
</style>

<div class="container" id="top">
    <div class="row">
        <div class="col-md-12">
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        <i class="fas fa-chalkboard-teacher"></i> 教师管理系统
                    </a>
                </div>
                <form action="##" class="navbar-form navbar-right" rol="search">
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
                            <i class="fas fa-user-circle"></i>
                            <span class="glyphicon glyphicon-user"></span><shiro:principal/>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">
                                    <i class="fas fa-user-edit"></i>
                                    修改个人信息
                                </a>
                            </li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="/logout">
                                    <i class="fas fa-sign-out-alt"></i>
                                    注销登录
                                </a>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">