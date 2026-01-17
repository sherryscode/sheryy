<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>修改教师</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<style>
		body {
			background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
			font-family: 'Microsoft YaHei', sans-serif;
			color: #2c3e50;
		}
		h1 {
			color: white; /* 将标题设置为白色 */
		}
		#content {
			background: transparent;
			padding-top: 20px;
		}
		.panel-default {
			border: none;
			border-radius: 12px;
			box-shadow: 0 5px 20px rgba(52, 152, 219, 0.15);
			overflow: hidden;
			border-top: 4px solid #3498db;
		}
		.panel-heading {
			background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
			color: white;
			border: none;
			padding: 25px 20px;
		}
		.panel-heading h1 {
			margin: 0;
			font-weight: 600;
			font-size: 24px;
			text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
		}
		.panel-body {
			padding: 30px;
			background: white;
		}
		.form-group label {
			color: #2c3e50;
			font-weight: 600;
			padding-top: 12px;
		}
		.form-control {
			border: 2px solid #e3e8ed;
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
			border-color: #3498db;
			box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
			outline: none;
		}
		.form-control[readonly] {
			background-color: #f8f9fa;
			border-color: #dee2e6;
			color: #6c757d;
		}
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
			background: #ecf0f1;
			color: #2c3e50;
			border: 2px solid #bdc3c7;
		}
		.btn-default:hover {
			background: #3498db;
			color: white;
			border-color: #3498db;
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
		}
		.btn-default[type="submit"] {
			background: #3498db;
			color: white;
			border-color: #3498db;
		}
		.btn-default[type="submit"]:hover {
			background: #2980b9;
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(52, 152, 219, 0.4);
		}
		.form-group {
			margin-bottom: 25px;
			position: relative;
			width: 100%;
		}
		.form-group:before {
			content: "";
			position: absolute;
			left: -10px;
			top: 15px;
			width: 4px;
			height: 20px;
			background: #3498db;
			border-radius: 2px;
		}
		input[type="date"] {
			height: 48px;
		}
		/* ========== 修复下拉框的核心样式 ========== */
		/* 1. 下拉框容器样式 */
		.select-wrapper {
			position: relative;
			width: 100%;
		}
		/* 2. 自定义下拉箭头 */
		.select-wrapper:after {
			content: '\f078';
			font-family: 'Font Awesome 5 Free';
			font-weight: 900;
			position: absolute;
			right: 15px;
			top: 50%;
			transform: translateY(-50%);
			color: #7f8c8d;
			pointer-events: none;
		}
		/* 3. 下拉框基础样式 */
		select.form-control {
			width: 100% !important;
			max-width: 100%;
			min-width: 200px;
			height: 48px;
			padding: 10px 15px;
			font-size: 15px !important;
			line-height: 1.5 !important;
			font-family: 'Microsoft YaHei', sans-serif !important;
			border: 2px solid #e3e8ed;
			border-radius: 8px;
			background-color: white;
			background-image: none !important; /* 移除默认箭头 */
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			transition: all 0.3s;
		}
		/* 4. 下拉选项样式 */
		select.form-control option {
			padding: 10px 15px !important;
			font-size: 14px !important;
			line-height: 1.5 !important;
			white-space: normal !important;
			word-wrap: break-word !important;
			min-height: 40px !important;
			font-family: 'Microsoft YaHei', sans-serif !important;
		}
		/* 5. 下拉框焦点状态 */
		select.form-control:focus {
			border-color: #3498db;
			box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
		}
		/* 6. 移除IE默认箭头 */
		select.form-control::-ms-expand {
			display: none;
		}
		/* 7. 表单布局优化 */
		.form-horizontal .col-sm-4,
		.form-horizontal .col-sm-8 {
			width: auto;
			float: none;
		}
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
		/* 其他样式 */
		.checkbox-inline {
			margin-right: 20px;
			padding-left: 0;
		}
		.checkbox-inline input[type="radio"] {
			margin-right: 8px;
			accent-color: #3498db;
		}
		#footer {
			background: #2c3e50;
			color: white;
			padding: 20px 0;
			margin-top: 40px;
			border-top: 3px solid #3498db;
		}
		/* 响应式适配 */
		@media (max-width: 992px) {
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
							<i class="fas fa-chalkboard-teacher"></i> 修改教师信息
						</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="/admin/editTeacher" id="editfrom" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-4 control-label">
										<i class="fas fa-id-badge"></i> 工号
									</label>
									<div class="col-sm-8">
										<input readonly="readonly" type="number" class="form-control" id="inputEmail3" name="userid" placeholder="请输入工号" value="${teacher.userid}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label">
										<i class="fas fa-user-tie"></i> 姓名
									</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="inputPassword3" name="username" placeholder="请输入姓名" value="${teacher.username}">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label">
										<i class="fas fa-venus-mars"></i> 性别
									</label>
									<div class="col-sm-8">
										<label class="checkbox-inline">
											<input type="radio" name="sex" value="男" <c:if test="${teacher.sex == '男'}">checked</c:if>> 男
										</label>
										<label class="checkbox-inline">
											<input type="radio" name="sex" value="女" <c:if test="${teacher.sex == '女'}">checked</c:if>> 女
										</label>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label">
										<i class="fas fa-birthday-cake"></i> 出生年份
									</label>
									<div class="col-sm-8">
										<input type="date" value="<fmt:formatDate value="${teacher.birthyear}" dateStyle="medium" pattern="yyyy-MM-dd" />" name="birthyear" class="form-control"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label" name="degree">
										<i class="fas fa-graduation-cap"></i> 学历
									</label>
									<div class="col-sm-8">
										<!-- 添加下拉框容器 -->
										<div class="select-wrapper">
											<select class="form-control" name="degree" id="degree">
												<option value="本科">本科</option>
												<option value="硕士">硕士</option>
												<option value="博士">博士</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label" name="title" >
										<i class="fas fa-award"></i> 职称
									</label>
									<div class="col-sm-8">
										<!-- 添加下拉框容器 -->
										<div class="select-wrapper">
											<select class="form-control" name="title" id="title">
												<option value="普通教师">普通教师</option>
												<option value="助教">助教</option>
												<option value="讲师">讲师</option>
												<option value="副教授">副教授</option>
												<option value="教授">教授</option>
											</select>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label" name="grade">
										<i class="fas fa-calendar-alt"></i> 入职时间
									</label>
									<div class="col-sm-8">
										<input type="date" value="<fmt:formatDate value="${teacher.grade}" dateStyle="medium" pattern="yyyy-MM-dd" />" name="grade" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-4 control-label" name="grade">
										<i class="fas fa-university"></i> 所属院系
									</label>
									<div class="col-sm-8">
										<!-- 添加下拉框容器 -->
										<div class="select-wrapper">
											<select class="form-control" name="collegeid" id="college">
												<c:forEach items="${collegeList}" var="item">
													<option value="${item.collegeid}">${item.collegename}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group" style="text-align: center; margin-top: 40px;">
							<button class="btn btn-default" type="submit">
								<i class="fas fa-check-circle"></i> 提交
							</button>
							<button class="btn btn-default" type="reset" onclick="clearForm()">
								<i class="fas fa-redo"></i> 重置
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
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
	$(document).ready(function() {
		$("#nav li:nth-child(3)").addClass("active");

		// 设置默认选中值
		setDefaultSelectValues();

		// 修复下拉框显示问题
		fixSelectDropdowns();

		// 表单验证
		setupFormValidation();
	});

	// 设置下拉框默认选中值
	function setDefaultSelectValues() {
		// 所属院系
		var collegeSelect = $("#college option");
		for (var i=0; i<collegeSelect.length; i++) {
			if (collegeSelect[i].value == '${teacher.collegeid}') {
				collegeSelect[i].selected = true;
			}
		}

		// 学历
		var degreeSelect = $("#degree option");
		for (var i=0; i<degreeSelect.length; i++) {
			if (degreeSelect[i].value == '${teacher.degree}') {
				degreeSelect[i].selected = true;
			}
		}

		// 职称
		var titleSelect = $("#title option");
		for (var i=0; i<titleSelect.length; i++) {
			if (titleSelect[i].value == '${teacher.title}') {
				titleSelect[i].selected = true;
			}
		}
	}

	// 修复下拉框显示问题的核心函数
	function fixSelectDropdowns() {
		// 1. 统一下拉框字体样式
		$('select.form-control').css({
			'font-family': "'Microsoft YaHei', sans-serif",
			'font-size': '15px',
			'line-height': '1.5'
		});

		// 2. 优化下拉选项样式
		$('select.form-control option').css({
			'padding': '10px 15px',
			'font-size': '14px',
			'line-height': '1.5',
			'white-space': 'normal',
			'word-wrap': 'break-word',
			'min-height': '40px',
			'font-family': "'Microsoft YaHei', sans-serif"
		});

		// 3. 自动计算下拉框最小宽度
		$('select.form-control').each(function() {
			var $select = $(this);
			var maxOptionWidth = 0;

			$select.find('option').each(function() {
				var text = $(this).text();
				var $temp = $('<span>').text(text).css({
					'font-family': "'Microsoft YaHei', sans-serif",
					'font-size': '14px',
					'visibility': 'hidden',
					'position': 'absolute',
					'white-space': 'nowrap'
				}).appendTo('body');

				var width = $temp.width();
				if (width > maxOptionWidth) {
					maxOptionWidth = width;
				}
				$temp.remove();
			});

			var minWidth = Math.min(Math.max(maxOptionWidth + 60, 200), 400);
			$select.css('min-width', minWidth + 'px');
		});
	}

	// 表单验证
	function setupFormValidation() {
		$('#editfrom').submit(function(e) {
			var isValid = true;
			$('.form-control').each(function() {
				if ($(this).val().trim() === '' && !$(this).attr('readonly')) {
					$(this).css('border-color', '#e74c3c');
					isValid = false;
				} else {
					$(this).css('border-color', '#2ecc71');
				}
			});

			if (!isValid) {
				e.preventDefault();
				alert('请填写所有必填项！');
			}
		});
	}

	// 清空表单
	function clearForm() {
		$('#editfrom')[0].reset();
		$('.form-control').css('border-color', '#e3e8ed');
		// 重新修复下拉框
		fixSelectDropdowns();
	}
</script>
</html>