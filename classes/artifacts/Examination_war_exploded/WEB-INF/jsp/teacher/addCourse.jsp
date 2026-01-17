<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>添加课程</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- Font Awesome图标 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #FF9800;
            --secondary-color: #F57C00;
            --text-color: #5D4037;
            --border-color: #FFCC80;
        }

        body {
            background: linear-gradient(135deg, #FFF3E0 0%, #FFECB3 100%);
            font-family: 'Microsoft YaHei', sans-serif;
            color: var(--text-color);
        }

        h1 {
            color: white;
        }

        #content {
            background: transparent;
            padding-top: 20px;
        }

        .panel-default {
            border: none;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(255, 152, 0, 0.15);
            overflow: hidden;
            border-top: 4px solid var(--primary-color);
        }

        .panel-heading {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border: none;
            padding: 25px 20px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }

        .panel-heading h1 {
            margin: 0;
            font-weight: 600;
            font-size: 24px;
        }

        .panel-body {
            padding: 30px;
            background: white;
        }

        .form-group label {
            color: var(--text-color);
            font-weight: 600;
            padding-top: 12px;
            font-size: 14px;
        }

        /* 表单布局 */
        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .col-md-6 {
            width: 50%;
            padding: 0 15px;
            box-sizing: border-box;
        }

        /* 下拉框样式 */
        select.form-control {
            width: 100% !important;
            max-width: 100%;
            min-width: 200px;
            height: 48px;
            padding: 10px 15px;
            font-size: 15px !important;
            line-height: 1.5 !important;
            font-family: 'Microsoft YaHei', sans-serif !important;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            background-color: white;
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%23FF9800' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 8px 10px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            transition: all 0.3s;
        }

        select.form-control option {
            padding: 10px 15px !important;
            font-size: 14px !important;
            line-height: 1.5 !important;
            white-space: normal !important;
            word-wrap: break-word !important;
            min-height: 40px !important;
        }

        select.form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(255, 152, 0, 0.25);
            outline: none;
        }

        /* 输入框样式 */
        .form-control {
            width: 100% !important;
            border: 2px solid var(--border-color);
            border-radius: 8px;
            padding: 12px 15px;
            transition: all 0.3s;
            box-shadow: none;
            font-size: 15px;
            line-height: 1.5;
            height: 48px;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(255, 152, 0, 0.25);
        }

        .form-control[readonly] {
            background-color: #FFF8E1;
            border-color: #FFD180;
            color: #8D6E63;
        }

        /* 表单组样式 */
        .form-horizontal .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            position: relative;
            width: 100%;
        }

        .form-horizontal .control-label {
            text-align: right;
            padding-right: 15px;
            width: 30%;
            margin-bottom: 0;
        }

        .form-horizontal .form-group > div {
            width: 70%;
            flex: 1;
        }

        /* 装饰线 */
        .form-group:before {
            content: "";
            position: absolute;
            left: -10px;
            top: 15px;
            width: 4px;
            height: 20px;
            background: var(--primary-color);
            border-radius: 2px;
        }

        /* 按钮样式 */
        .btn {
            border-radius: 8px;
            padding: 12px 35px;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s;
            margin: 0 10px;
            min-width: 140px;
            border: 2px solid transparent;
        }

        .btn-default {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .btn-default:hover {
            background: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 152, 0, 0.3);
        }

        .btn-reset {
            background: #ecf0f1;
            color: var(--text-color);
            border-color: #bdc3c7;
        }

        .btn-reset:hover {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(255, 152, 0, 0.3);
        }

        /* 页脚样式 */
        #footer {
            background: #5D4037;
            color: white;
            padding: 20px 0;
            margin-top: 40px;
            border-top: 3px solid var(--primary-color);
        }

        /* 响应式设计 */
        @media (max-width: 992px) {
            .col-md-6 {
                width: 100%;
            }

            .form-horizontal .control-label {
                width: 100%;
                text-align: left;
                margin-bottom: 8px;
            }

            .form-horizontal .form-group > div {
                width: 100%;
            }

            .form-horizontal .form-group {
                flex-direction: column;
                align-items: flex-start;
            }
        }

        /* 验证样式 */
        .form-control.is-valid {
            border-color: #27ae60;
        }

        .form-control.is-invalid {
            border-color: #e74c3c;
        }

        .validation-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        /* 图标样式 */
        .control-label i {
            margin-right: 8px;
            color: var(--primary-color);
            width: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
<!-- 顶栏 -->
<jsp:include page="top.jsp"></jsp:include>

<!-- 中间主体 -->
<div class="container" id="content">
    <div class="row">
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <h1 style="text-align: center;">
                            <i class="fas fa-book-medical"></i> 添加课程信息
                        </h1>
                    </div>
                </div>
                <div class="panel-body">
                    <!-- 显示后端错误提示 -->
                    <c:if test="${not empty errorMsg}">
                        <div class="alert alert-danger" style="margin-bottom: 20px;">
                            <i class="fas fa-exclamation-circle"></i> ${errorMsg}
                        </div>
                    </c:if>

                    <form class="form-horizontal" role="form" action="/teacher/addCourse" id="editfrom" method="post" onsubmit="return validateForm()">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- 课程号 -->
                                <div class="form-group">
                                    <label for="courseId" class="control-label">
                                        <i class="fas fa-hashtag"></i> 课程号
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 courseld，与实体类字段名一致 -->
                                        <input type="text" class="form-control" id="courseId" name="courseld"
                                               placeholder="请输入课程号（数字）" required>
                                        <div class="validation-message" id="courseIdError"></div>
                                    </div>
                                </div>

                                <!-- 课程名称 -->
                                <div class="form-group">
                                    <label for="courseName" class="control-label">
                                        <i class="fas fa-book"></i> 课程名称
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 coursename -->
                                        <input type="text" class="form-control" id="courseName" name="coursename"
                                               placeholder="请输入课程名称" required>
                                        <div class="validation-message" id="courseNameError"></div>
                                    </div>
                                </div>

                                <!-- 授课老师 -->
                                <div class="form-group">
                                    <label for="teacherId" class="control-label">
                                        <i class="fas fa-chalkboard-teacher"></i> 授课老师
                                    </label>
                                    <div>
                                        <input type="text" class="form-control" id="teacherId"
                                               value="${currentTeacher.username}" readonly>
                                        <!-- 关键：name必须为 teacherid -->
                                        <input type="hidden" name="teacherid" value="${currentTeacher.userid}">
                                        <div class="validation-message" id="teacherIdError"></div>
                                    </div>
                                </div>

                                <!-- 上课时间 -->
                                <div class="form-group">
                                    <label for="courseTime" class="control-label">
                                        <i class="fas fa-clock"></i> 上课时间
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 coursetime -->
                                        <input type="text" class="form-control" id="courseTime" name="coursetime"
                                               placeholder="例：周一 1-2节" required>
                                        <div class="validation-message" id="courseTimeError"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- 上课地点 -->
                                <div class="form-group">
                                    <label for="classroom" class="control-label">
                                        <i class="fas fa-map-marker-alt"></i> 上课地点
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 classroom -->
                                        <input type="text" class="form-control" id="classroom" name="classroom"
                                               placeholder="例：A栋101教室" required>
                                        <div class="validation-message" id="classroomError"></div>
                                    </div>
                                </div>

                                <!-- 周数 -->
                                <div class="form-group">
                                    <label for="courseWeek" class="control-label">
                                        <i class="fas fa-calendar-week"></i> 周数
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 courseweek -->
                                        <input type="number" class="form-control" id="courseWeek" name="courseweek"
                                               placeholder="请输入周数" required min="1" max="20">
                                        <div class="validation-message" id="courseWeekError"></div>
                                    </div>
                                </div>

                                <!-- 课程类型 -->
                                <div class="form-group">
                                    <label for="courseType" class="control-label">
                                        <i class="fas fa-tag"></i> 课程类型
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 coursetype -->
                                        <select class="form-control" id="courseType" name="coursetype" required>
                                            <option value="" selected disabled>请选择课程类型</option>
                                            <option value="必修课">必修课</option>
                                            <option value="选修课">选修课</option>
                                            <option value="公共课">公共课</option>
                                        </select>
                                        <div class="validation-message" id="courseTypeError"></div>
                                    </div>
                                </div>

                                <!-- 所属院系 -->
                                <div class="form-group">
                                    <label for="collegeId" class="control-label">
                                        <i class="fas fa-university"></i> 所属院系
                                    </label>
                                    <div>
                                        <!-- 关键：name必须为 collegeid -->
                                        <select class="form-control" id="collegeId" name="collegeid" required>
                                            <option value="">请选择所属院系</option>
                                            <c:forEach items="${collegeList}" var="item">
                                                <option value="${item.collegeid}"
                                                        <c:if test="${currentTeacher.collegeid == item.collegeid}">selected</c:if>>
                                                        ${item.collegename}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="validation-message" id="collegeIdError"></div>
                                    </div>
                                </div>

                                <!-- 学分 -->
                                <div class="form-group">
                                    <label for="score" class="control-label">
                                        <i class="fas fa-star"></i> 学分
                                    </label>
                                    <div>
                                        <!-- score字段名与实体类一致 -->
                                        <input type="number" class="form-control" id="score" name="score"
                                               placeholder="请输入学分" required min="1" step="1" value="1">
                                        <div class="validation-message" id="scoreError"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 按钮组 -->
                        <div class="form-group" style="text-align: center; margin-top: 40px; padding-top: 30px; border-top: 1px solid #eee;">
                            <button class="btn btn-default" type="submit">
                                <i class="fas fa-check-circle"></i> 提交
                            </button>
                            <button class="btn btn-reset" type="button" onclick="clearForm()">
                                <i class="fas fa-redo"></i> 重置
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 页脚 -->
<div class="container" id="footer">
    <div class="row">
        <div class="col-md-12" style="text-align: center; padding: 20px;">
            <p style="margin: 0; color: #bdc3c7;">
                <i class="fas fa-graduation-cap"></i> 教务管理系统 &copy; 2026
                <span style="margin: 0 10px;">|</span>
                Powered by <span style="color: #3498db;">Education Management System</span>
            </p>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
    // 设置导航菜单激活状态
    $(document).ready(function() {
        $("#nav li:nth-child(1)").addClass("active");

        // 为输入框添加实时验证
        $('.form-control').on('blur', function() {
            validateField(this);
        });

        // 下拉框验证
        $('select.form-control').on('change', function() {
            validateField(this);
        });

        // 检查是否已有错误信息
        var errorMsg = "${errorMsg}";
        if (errorMsg && errorMsg.trim() !== "") {
            // 创建一个错误提示框
            var errorHtml = `
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="margin-bottom: 20px;">
                    <i class="fas fa-exclamation-circle"></i> ${errorMsg}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            `;
            $('.panel-body').prepend(errorHtml);
        }

        // 表单提交前打印参数（调试用）
        $('#editfrom').submit(function() {
            console.log("=== 表单提交前参数检查 ===");
            var formData = $(this).serializeArray();
            formData.forEach(function(item) {
                console.log(item.name + " = " + item.value);
            });
            return true;
        });
    });

    // 表单验证函数
    function validateForm() {
        var isValid = true;
        var errorMessages = [];

        // 重置验证状态
        $('.form-control').removeClass('is-invalid is-valid');
        $('.validation-message').hide();

        // 验证课程号 (courseld)
        var courseId = $('#courseId').val().trim();
        if (!courseId) {
            $('#courseId').addClass('is-invalid');
            $('#courseIdError').text('课程号不能为空').show();
            isValid = false;
            errorMessages.push('课程号不能为空');
        } else if (!/^\d+$/.test(courseId)) {
            $('#courseId').addClass('is-invalid');
            $('#courseIdError').text('课程号只能输入数字').show();
            isValid = false;
            errorMessages.push('课程号只能输入数字');
        } else {
            $('#courseId').addClass('is-valid');
        }

        // 验证课程名称 (coursename)
        var courseName = $('#courseName').val().trim();
        if (!courseName) {
            $('#courseName').addClass('is-invalid');
            $('#courseNameError').text('课程名称不能为空').show();
            isValid = false;
            errorMessages.push('课程名称不能为空');
        } else {
            $('#courseName').addClass('is-valid');
        }

        // 验证上课时间 (coursetime)
        var courseTime = $('#courseTime').val().trim();
        if (!courseTime) {
            $('#courseTime').addClass('is-invalid');
            $('#courseTimeError').text('上课时间不能为空').show();
            isValid = false;
            errorMessages.push('上课时间不能为空');
        } else {
            $('#courseTime').addClass('is-valid');
        }

        // 验证上课地点 (classroom)
        var classroom = $('#classroom').val().trim();
        if (!classroom) {
            $('#classroom').addClass('is-invalid');
            $('#classroomError').text('上课地点不能为空').show();
            isValid = false;
            errorMessages.push('上课地点不能为空');
        } else {
            $('#classroom').addClass('is-valid');
        }

        // 验证周数 (courseweek)
        var courseWeek = $('#courseWeek').val().trim();
        if (!courseWeek) {
            $('#courseWeek').addClass('is-invalid');
            $('#courseWeekError').text('周数不能为空').show();
            isValid = false;
            errorMessages.push('周数不能为空');
        } else if (parseInt(courseWeek) < 1) {
            $('#courseWeek').addClass('is-invalid');
            $('#courseWeekError').text('周数必须大于0').show();
            isValid = false;
            errorMessages.push('周数必须大于0');
        } else {
            $('#courseWeek').addClass('is-valid');
        }

        // 验证课程类型 (coursetype)
        var courseType = $('#courseType').val();
        if (!courseType) {
            $('#courseType').addClass('is-invalid');
            $('#courseTypeError').text('请选择课程类型').show();
            isValid = false;
            errorMessages.push('请选择课程类型');
        } else {
            $('#courseType').addClass('is-valid');
        }

        // 验证所属院系 (collegeid)
        var collegeId = $('#collegeId').val();
        if (!collegeId) {
            $('#collegeId').addClass('is-invalid');
            $('#collegeIdError').text('请选择所属院系').show();
            isValid = false;
            errorMessages.push('请选择所属院系');
        } else {
            $('#collegeId').addClass('is-valid');
        }

        // 验证学分 (score)
        var score = $('#score').val().trim();
        if (!score) {
            $('#score').addClass('is-invalid');
            $('#scoreError').text('学分不能为空').show();
            isValid = false;
            errorMessages.push('学分不能为空');
        } else if (parseInt(score) < 1) {
            $('#score').addClass('is-invalid');
            $('#scoreError').text('学分不能小于1').show();
            isValid = false;
            errorMessages.push('学分不能小于1');
        } else {
            $('#score').addClass('is-valid');
        }

        // 如果验证失败，显示错误信息并阻止提交
        if (!isValid) {
            // 显示所有错误信息
            showErrorMessage('请检查以下错误：<br>' + errorMessages.join('<br>'));

            // 滚动到第一个错误字段
            $('html, body').animate({
                scrollTop: $('.is-invalid').first().offset().top - 100
            }, 500);

            // 焦点移到第一个错误字段
            $('.is-invalid').first().focus();

            return false;
        }

        return true;
    }

    // 显示错误消息
    function showErrorMessage(message) {
        // 移除已有的错误提示
        $('.alert-dismissible').remove();

        // 创建一个更友好的错误提示
        var errorHtml = `
            <div class="alert alert-danger alert-dismissible fade show" role="alert"
                style="position: fixed; top: 20px; right: 20px; z-index: 9999; min-width: 300px; max-width: 400px;">
                <strong><i class="fas fa-exclamation-circle"></i> 表单验证失败</strong>
                <button type="button" class="btn-close" onclick="$(this).parent().remove()"
                    style="position: absolute; top: 5px; right: 5px;"></button>
                <div style="margin-top: 10px; font-size: 14px;">${message}</div>
            </div>
        `;
        $('body').append(errorHtml);

        // 10秒后自动消失
        setTimeout(function() {
            $('.alert-dismissible').remove();
        }, 10000);
    }

    // 清空表单
    function clearForm() {
        if (confirm('确定要重置所有表单内容吗？')) {
            $('#editfrom')[0].reset();
            $('.form-control').removeClass('is-valid is-invalid');
            $('.validation-message').hide();

            // 设置院系默认值为当前教师所属院系
            $('#collegeId').val('${currentTeacher.collegeid}');

            // 设置课程类型为默认值
            $('#courseType').val('');

            // 设置学分默认值为1
            $('#score').val('1');
        }
    }

    // 实时验证函数
    function validateField(input) {
        var $input = $(input);
        var value = $input.val().trim();
        var fieldName = $input.attr('name');
        var isValid = true;

        $input.removeClass('is-invalid is-valid');
        $input.next('.validation-message').hide();

        if ($input.prop('required') && !value) {
            $input.addClass('is-invalid');
            $input.next('.validation-message').text('此字段不能为空').show();
            isValid = false;
        } else if (fieldName === 'courseld' && value && !/^\d+$/.test(value)) {
            // 注意：这里是 courseld 不是 courseID
            $input.addClass('is-invalid');
            $input.next('.validation-message').text('课程号只能输入数字').show();
            isValid = false;
        } else if (fieldName === 'score' && value) {
            var score = parseInt(value);
            if (score < 1) {
                $input.addClass('is-invalid');
                $input.next('.validation-message').text('学分不能小于1').show();
                isValid = false;
            }
        } else if (fieldName === 'courseweek' && value) {
            var week = parseInt(value);
            if (week < 1 || week > 20) {
                $input.addClass('is-invalid');
                $input.next('.validation-message').text('周数必须在1-20之间').show();
                isValid = false;
            }
        }

        if (isValid && value) {
            $input.addClass('is-valid');
        }

        return isValid;
    }

    // 调试函数：查看所有表单字段值
    function debugFormData() {
        console.log("=== 调试表单数据 ===");
        var data = {
            courseld: $('#courseId').val(),
            coursename: $('#courseName').val(),
            teacherid: $('input[name="teacherid"]').val(),
            coursetime: $('#courseTime').val(),
            classroom: $('#classroom').val(),
            courseweek: $('#courseWeek').val(),
            coursetype: $('#courseType').val(),
            collegeid: $('#collegeId').val(),
            score: $('#score').val()
        };
        console.log(JSON.stringify(data, null, 2));
        alert("请查看浏览器控制台查看表单数据");
    }
</script>
</html>