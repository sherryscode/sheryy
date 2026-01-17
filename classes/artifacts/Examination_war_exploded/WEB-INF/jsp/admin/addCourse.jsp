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
			--primary-color: #3498db;
			--secondary-color: #2980b9;
			--text-color: #2c3e50;
			--border-color: #e3e8ed;
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

		/* ========== 修复下拉框问题的关键CSS ========== */
		/* 1. 移除所有可能影响下拉框的固定宽度 */
		.form-horizontal .col-sm-4,
		.form-horizontal .col-sm-8 {
			width: auto;
			float: none;
		}

		/* 2. 使用更灵活的布局 */
		.row {
			display: flex;
			flex-wrap: wrap;
		}

		.col-md-6 {
			width: 50%;
			padding: 0 15px;
			box-sizing: border-box;
		}

		/* 3. 优化下拉框样式 */
		select.form-control {
			/* 移除固定宽度，让下拉框自适应容器 */
			width: 100% !important;
			max-width: 100%;
			min-width: 200px; /* 设置最小宽度确保内容可见 */
			height: 48px;
			padding: 10px 15px;
			font-size: 15px !important;
			line-height: 1.5 !important;
			font-family: 'Microsoft YaHei', sans-serif !important;
			border: 2px solid var(--border-color);
			border-radius: 8px;
			background-color: white;
			background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%23333' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E");
			background-repeat: no-repeat;
			background-position: right 15px center;
			background-size: 8px 10px;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			transition: all 0.3s;
		}

		/* 4. 确保下拉选项有足够的空间 */
		select.form-control option {
			padding: 10px 15px !important;
			font-size: 14px !important;
			line-height: 1.5 !important;
			white-space: normal !important; /* 允许文本换行 */
			word-wrap: break-word !important;
			min-height: 40px !important;
		}

		/* 5. 下拉框焦点状态 */
		select.form-control:focus {
			border-color: var(--primary-color);
			box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
			outline: none;
		}

		/* 6. 修复Firefox和IE的下拉框 */
		select.form-control::-ms-expand {
			display: none;
		}

		/* 7. 添加下拉箭头美化 */
		.select-wrapper {
			position: relative;
			width: 100%;
		}

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

		/* 8. 统一所有输入框样式 */
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
			box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
		}

		/* 9. 优化表单布局 */
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
			width: 30%; /* 标签占30% */
			margin-bottom: 0;
		}

		.form-horizontal .form-group > div {
			width: 70%; /* 输入框占70% */
			flex: 1;
		}

		/* 10. 添加装饰线 */
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

		/* 11. 按钮样式 */
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
			color: var(--text-color);
			border-color: #bdc3c7;
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
			background: var(--secondary-color);
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(52, 152, 219, 0.4);
		}

		/* 12. 页脚样式 */
		#footer {
			background: #2c3e50;
			color: white;
			padding: 20px 0;
			margin-top: 40px;
			border-top: 3px solid var(--primary-color);
		}

		/* 13. 响应式设计 */
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

		/* 14. 验证样式 */
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

		/* 15. 图标样式 */
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
					<form class="form-horizontal" role="form" action="/admin/addCourse" id="editfrom" method="post">
						<div class="row">
							<div class="col-md-6">
								<!-- 课程号 -->
								<div class="form-group">
									<label for="courseId" class="control-label">
										<i class="fas fa-hashtag"></i> 课程号
									</label>
									<div>
										<input type="number" class="form-control" id="courseId" name="courseid" placeholder="请输入课程号" required>
										<div class="validation-message" id="courseIdError"></div>
									</div>
								</div>

								<!-- 课程名称 -->
								<div class="form-group">
									<label for="courseName" class="control-label">
										<i class="fas fa-book"></i> 课程名称
									</label>
									<div>
										<input type="text" class="form-control" id="courseName" name="coursename" placeholder="请输入课程名称" required>
										<div class="validation-message" id="courseNameError"></div>
									</div>
								</div>

								<!-- 授课老师 -->
								<div class="form-group">
									<label for="teacherId" class="control-label">
										<i class="fas fa-chalkboard-teacher"></i> 授课老师
									</label>
									<div class="select-wrapper">
										<select class="form-control" id="teacherId" name="teacherid" required>
											<option value="">请选择授课老师</option>
											<c:forEach items="${teacherList}" var="item">
												<option value="${item.userid}">${item.username}</option>
											</c:forEach>
										</select>
										<div class="validation-message" id="teacherIdError"></div>
									</div>
								</div>

								<!-- 上课时间 -->
								<div class="form-group">
									<label for="courseTime" class="control-label">
										<i class="fas fa-clock"></i> 上课时间
									</label>
									<div>
										<input type="text" class="form-control" id="courseTime" name="coursetime" placeholder="例：周一 1-2节" required>
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
										<input type="text" class="form-control" id="classroom" name="classroom" placeholder="例：A栋101教室" required>
										<div class="validation-message" id="classroomError"></div>
									</div>
								</div>

								<!-- 周数 -->
								<div class="form-group">
									<label for="courseWeek" class="control-label">
										<i class="fas fa-calendar-week"></i> 周数
									</label>
									<div>
										<input type="number" class="form-control" id="courseWeek" name="courseweek" placeholder="请输入周数" required min="1">
										<div class="validation-message" id="courseWeekError"></div>
									</div>
								</div>

								<!-- 课程类型 -->
								<div class="form-group">
									<label for="courseType" class="control-label">
										<i class="fas fa-tag"></i> 课程类型
									</label>
									<div class="select-wrapper">
										<select class="form-control" id="courseType" name="coursetype" required>
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
									<div class="select-wrapper">
										<select class="form-control" id="collegeId" name="collegeid" required>
											<option value="">请选择所属院系</option>
											<c:forEach items="${collegeList}" var="item">
												<option value="${item.collegeid}">${item.collegename}</option>
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
										<input type="number" class="form-control" id="score" name="score" placeholder="请输入学分" required min="0.5" step="0.5">
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

<!-- 成功弹窗 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%); color: white;">
				<h5 class="modal-title">
					<i class="fas fa-check-circle"></i> 操作成功
				</h5>
			</div>
			<div class="modal-body text-center">
				<div style="font-size: 48px; color: #27ae60; margin: 20px 0;">
					<i class="fas fa-check-circle"></i>
				</div>
				<h4 style="color: #27ae60; margin-bottom: 20px;">课程添加成功！</h4>
				<p id="successDetails" style="color: #666;"></p>
				<button type="button" class="btn btn-success" data-bs-dismiss="modal" style="margin-top: 20px;">
					<i class="fas fa-check"></i> 确定
				</button>
			</div>
		</div>
	</div>
</div>

</body>

<script type="text/javascript">
	// 设置导航菜单激活状态
	$(document).ready(function() {
		$("#nav li:nth-child(1)").addClass("active");

		// 初始化模态框
		var successModal = new bootstrap.Modal(document.getElementById('successModal'));
		window.successModal = successModal;

		// 表单验证
		setupFormValidation();

		// 修复下拉框字体显示
		fixSelectDropdowns();
	});

	// 修复下拉框字体显示问题
	function fixSelectDropdowns() {
		// 1. 移除可能影响字体的样式
		$('select.form-control').css({
			'font-family': "'Microsoft YaHei', sans-serif",
			'font-size': '15px',
			'line-height': '1.5'
		});

		// 2. 为下拉选项设置正确样式
		$('select.form-control option').css({
			'padding': '10px 15px',
			'font-size': '14px',
			'line-height': '1.5',
			'white-space': 'normal',
			'word-wrap': 'break-word',
			'min-height': '40px'
		});

		// 3. 确保下拉框有足够的宽度
		$('select.form-control').each(function() {
			var $select = $(this);
			var maxOptionWidth = 0;

			// 找到最长的选项文本宽度
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

			// 设置最小宽度确保所有内容可见
			var minWidth = Math.min(Math.max(maxOptionWidth + 60, 200), 400);
			$select.css('min-width', minWidth + 'px');
		});
	}

	// 设置表单验证
	function setupFormValidation() {
		$('#editfrom').submit(function(e) {
			e.preventDefault();

			var isValid = true;
			var errorMessages = [];

			// 重置验证状态
			$('.form-control').removeClass('is-invalid is-valid');
			$('.validation-message').hide();

			// 验证每个字段
			$('.form-control').each(function() {
				var $input = $(this);
				var value = $input.val().trim();
				var fieldName = $input.closest('.form-group').find('.control-label').text().trim();

				if ($input.prop('required') && !value) {
					$input.addClass('is-invalid');
					$input.next('.validation-message').text('请填写' + fieldName).show();
					isValid = false;
					errorMessages.push(fieldName + '不能为空');
				} else {
					$input.addClass('is-valid');

					// 特殊字段验证
					if ($input.attr('name') === 'courseid') {
						if (!/^\d+$/.test(value)) {
							$input.addClass('is-invalid');
							$input.next('.validation-message').text('课程号必须是数字').show();
							isValid = false;
							errorMessages.push('课程号格式错误');
						}
					}

					if ($input.attr('name') === 'score') {
						var score = parseFloat(value);
						if (score < 0.5) {
							$input.addClass('is-invalid');
							$input.next('.validation-message').text('学分不能小于0.5').show();
							isValid = false;
							errorMessages.push('学分不能小于0.5');
						}
					}
				}
			});

			if (isValid) {
				// 使用AJAX提交表单
				submitFormData();
			} else {
				// 显示错误提示
				showErrorMessage('请检查以下错误：<br>' + errorMessages.join('<br>'));
			}

			return false;
		});
	}

	// 提交表单数据
	function submitFormData() {
		var formData = $('#editfrom').serialize();

		// 显示加载状态
		$('button[type="submit"]').html('<i class="fas fa-spinner fa-spin"></i> 提交中...').prop('disabled', true);

		$.ajax({
			url: '/admin/addCourse',
			type: 'POST',
			data: formData,
			success: function(response) {
				if (response.success || response.indexOf('成功') !== -1) {
					// 显示成功弹窗
					showSuccessModal();
				} else {
					showErrorMessage('提交失败：' + (response.message || '请重试'));
					$('button[type="submit"]').html('<i class="fas fa-check-circle"></i> 提交').prop('disabled', false);
				}
			},
			error: function(xhr, status, error) {
				showErrorMessage('提交失败：' + error);
				$('button[type="submit"]').html('<i class="fas fa-check-circle"></i> 提交').prop('disabled', false);
			}
		});
	}

	// 显示成功弹窗
	function showSuccessModal() {
		// 获取表单数据用于显示
		var courseName = $('#courseName').val();
		var courseId = $('#courseId').val();
		var now = new Date();
		var timeStr = now.toLocaleString();

		$('#successDetails').html(`
			<p><strong>课程名称：</strong>${courseName}</p>
			<p><strong>课程编号：</strong>${courseId}</p>
			<p><strong>添加时间：</strong>${timeStr}</p>
		`);

		successModal.show();

		// 3秒后重置表单
		setTimeout(function() {
			clearForm();
			successModal.hide();
		}, 3000);
	}

	// 显示错误消息
	function showErrorMessage(message) {
		// 简单的错误提示
		alert(message);
	}

	// 清空表单
	function clearForm() {
		$('#editfrom')[0].reset();
		$('.form-control').removeClass('is-valid is-invalid');
		$('.validation-message').hide();
		$('button[type="submit"]').html('<i class="fas fa-check-circle"></i> 提交').prop('disabled', false);

		// 重新修复下拉框
		fixSelectDropdowns();
	}
</script> 
</html>