<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>修改课程</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<style>
		:root {
			--primary-color: #3498db;
			--border-color: #e3e8ed;
			--text-color: #2c3e50;
		}

		body {
			background: linear-gradient(135deg, #f5f7fa 0%, #e4edf5 100%);
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
			box-shadow: 0 5px 20px rgba(52, 152, 219, 0.15);
			overflow: hidden;
			border-top: 4px solid var(--primary-color);
		}

		.panel-heading {
			background: linear-gradient(135deg, #2c3e50 0%, var(--primary-color) 100%);
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

		/* ========== 表单布局修复 ========== */
		.form-horizontal .form-group {
			display: flex;
			align-items: center;
			margin-bottom: 25px;
			position: relative;
			width: 100%;
		}

		.form-horizontal .control-label {
			width: 30%;
			text-align: right;
			padding-right: 15px;
			margin-bottom: 0;
			color: var(--text-color);
			font-weight: 600;
			padding-top: 12px;
			font-size: 14px;
		}

		.form-horizontal .form-group > div {
			width: 70%;
			flex: 1;
		}

		/* ========== 下拉框核心修复 ========== */
		select.form-control {
			font-family: 'Microsoft YaHei', sans-serif !important;
			font-size: 14px !important;
			line-height: 1.5 !important;
			width: 100% !important;
			min-width: 200px !important;
			max-width: 100% !important;
			height: 46px !important;
			padding: 10px 15px !important;
			border: 2px solid var(--border-color) !important;
			border-radius: 8px !important;
			background-color: white !important;
			background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%233498db' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E") !important;
			background-repeat: no-repeat !important;
			background-position: right 15px center !important;
			background-size: 10px 12px !important;
			text-overflow: ellipsis !important;
			white-space: nowrap !important;
			overflow: hidden !important;
			-webkit-appearance: none !important;
			-moz-appearance: none !important;
			appearance: none !important;
			transition: all 0.3s ease !important;
		}

		select.form-control option {
			font-family: 'Microsoft YaHei', sans-serif !important;
			font-size: 14px !important;
			line-height: 1.5 !important;
			padding: 12px 15px !important;
			min-height: 44px !important;
			white-space: normal !important;
			word-wrap: break-word !important;
		}

		select.form-control:focus {
			border-color: var(--primary-color) !important;
			box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25) !important;
			outline: none !important;
		}

		/* ========== 其他输入框样式 ========== */
		.form-control {
			border: 2px solid var(--border-color);
			border-radius: 8px;
			padding: 12px 15px;
			transition: all 0.3s;
			width: 100% !important;
			height: 46px;
			font-size: 14px;
		}

		.form-control:focus {
			border-color: var(--primary-color);
			box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
		}

		.form-control[readonly] {
			background-color: #f8f9fa;
			border-color: #dee2e6;
			color: #6c757d;
		}

		/* ========== 按钮样式 ========== */
		.btn {
			border-radius: 8px;
			padding: 12px 35px;
			font-weight: 600;
			font-size: 16px;
			transition: all 0.3s;
			margin: 0 10px;
			min-width: 140px;
		}

		.btn-default {
			background: #ecf0f1;
			color: var(--text-color);
			border: 2px solid #bdc3c7;
		}

		.btn-default:hover {
			background: var(--primary-color);
			color: white;
			border-color: var(--primary-color);
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
		}

		.btn-default[type="submit"] {
			background: var(--primary-color);
			color: white;
			border-color: var(--primary-color);
		}

		.btn-default[type="submit"]:hover {
			background: #2980b9;
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(52, 152, 219, 0.4);
		}

		/* ========== 装饰线 ========== */
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

		/* ========== 响应式适配 ========== */
		@media (max-width: 768px) {
			.form-horizontal .form-group {
				flex-direction: column;
				align-items: flex-start;
			}

			.form-horizontal .control-label {
				width: 100%;
				text-align: left;
				margin-bottom: 8px;
				padding-right: 0;
			}

			.form-horizontal .form-group > div {
				width: 100%;
			}

			select.form-control {
				min-width: 100% !important;
				font-size: 16px !important;
			}
		}

		/* ========== 页脚样式 ========== */
		#footer {
			background: #2c3e50;
			color: white;
			padding: 20px 0;
			margin-top: 40px;
			border-top: 3px solid var(--primary-color);
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
							<i class="fas fa-edit"></i> 修改课程信息
						</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="/admin/editCourse" id="editfrom" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="courseId" class="control-label">
										<i class="fas fa-hashtag"></i> 课程号
									</label>
									<div>
										<input readonly="readonly"  type="number" class="form-control" id="courseId" value="${course.courseid}" name="courseid" placeholder="请输入课程号">
									</div>
								</div>
								<div class="form-group">
									<label for="courseName" class="control-label">
										<i class="fas fa-book"></i> 课程名称
									</label>
									<div>
										<input type="text" class="form-control" id="courseName" name="coursename" value="${course.coursename}" placeholder="请输入课程名称">
									</div>
								</div>
								<div class="form-group">
									<label for="teacherId" class="control-label">
										<i class="fas fa-chalkboard-teacher"></i> 授课老师
									</label>
									<div>
										<select class="form-control" name="teacherid" id="teacherId">
											<c:forEach items="${teacherList}" var="item">
												<option value="${item.userid}">${item.username}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="courseTime" class="control-label">
										<i class="fas fa-clock"></i> 上课时间
									</label>
									<div>
										<input type="text" class="form-control" name="coursetime" value="${course.coursetime}" placeholder="请输入上课时间">
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="classroom" class="control-label">
										<i class="fas fa-map-marker-alt"></i> 上课地点
									</label>
									<div>
										<input type="text" class="form-control" name="classroom" value="${course.classroom}" placeholder="上课地点">
									</div>
								</div>
								<div class="form-group">
									<label for="courseWeek" class="control-label">
										<i class="fas fa-calendar-week"></i> 周数
									</label>
									<div>
										<input type="number" class="form-control" name="courseweek" value="${course.courseweek}" placeholder="请输入周数">
									</div>
								</div>
								<div class="form-group">
									<label for="courseType" class="control-label">
										<i class="fas fa-tag"></i> 课程类型
									</label>
									<div>
										<select class="form-control" name="coursetype" id="courseType">
											<option value="必修课">必修课</option>
											<option value="选修课">选修课</option>
											<option value="公共课">公共课</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="collegeId" class="control-label">
										<i class="fas fa-university"></i> 所属院系
									</label>
									<div>
										<select class="form-control" name="collegeid" id="collegeId">
											<c:forEach items="${collegeList}" var="item">
												<option value="${item.collegeid}">${item.collegename}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="score" class="control-label">
										<i class="fas fa-star"></i> 学分
									</label>
									<div>
										<input type="number" class="form-control" name="score" value="${course.score}" placeholder="请输入学分">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group" style="text-align: center; margin-top: 40px;">
							<button class="btn btn-default" type="submit">
								<i class="fas fa-check-circle"></i> 提交
							</button>
							<button class="btn btn-default" type="reset">
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
		$("#nav li:nth-child(1)").addClass("active");

		// 修复下拉框
		fixAllDropdowns();

		// 调整下拉框宽度
		adjustSelectWidths();

		// 回显选中项
		var collegeSelect = $("#collegeId option");
		for (var i=0; i<collegeSelect.length; i++) {
			if (collegeSelect[i].value == '${course.collegeid}') {
				collegeSelect[i].selected = true;
			}
		}

		var coursetypeSelect = $("#courseType option");
		for (var i=0; i<coursetypeSelect.length; i++) {
			if (coursetypeSelect[i].value == '${course.coursetype}') {
				coursetypeSelect[i].selected = true;
			}
		}

		var teacheridSelect = $("#teacherId option");
		for (var i=0; i<teacheridSelect.length; i++) {
			if (teacheridSelect[i].value == '${course.teacherid}') {
				teacheridSelect[i].selected = true;
			}
		}
	});

	// 修复所有下拉框
	function fixAllDropdowns() {
		$('select.form-control').each(function() {
			var $select = $(this);

			// 设置字体和样式
			$select.css({
				'font-family': "'Microsoft YaHei', 'PingFang SC', sans-serif",
				'font-size': '14px',
				'line-height': '1.5'
			});

			// 修复选项样式
			$select.find('option').css({
				'font-family': "'Microsoft YaHei', sans-serif",
				'font-size': '14px',
				'padding': '12px 15px',
				'line-height': '1.5'
			});

			// 根据内容调整宽度
			adjustSelectWidth($select);
		});
	}

	// 调整下拉框宽度
	function adjustSelectWidths() {
		$('select.form-control').each(function() {
			adjustSelectWidth($(this));
		});
	}

	function adjustSelectWidth($select) {
		var maxWidth = 0;
		var $temp = $('<span>').css({
			'font-family': "'Microsoft YaHei', sans-serif",
			'font-size': '14px',
			'visibility': 'hidden',
			'position': 'absolute',
			'white-space': 'nowrap'
		}).appendTo('body');

		$select.find('option').each(function() {
			var text = $(this).text();
			$temp.text(text);
			var width = $temp.width();
			if (width > maxWidth) {
				maxWidth = width;
			}
		});

		$temp.remove();

		// 设置合适的宽度（加上内边距和边框）
		var finalWidth = Math.min(Math.max(maxWidth + 50, 200), 350);
		$select.css('min-width', finalWidth + 'px');
	}

	// 表单验证
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
</script>
</html>