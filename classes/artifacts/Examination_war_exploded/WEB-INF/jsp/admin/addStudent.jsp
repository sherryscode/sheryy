<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>添加学生</title>
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
							<i class="fas fa-user-plus"></i> 添加学生信息
						</h1>
					</div>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="/admin/addStudent" id="editfrom" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="userId" class="control-label">
										<i class="fas fa-id-card"></i> 学号
									</label>
									<div>
										<input type="number" class="form-control" id="userId" name="userid" placeholder="请输入学号"
											   <c:if test='${student!=null}'>value="${student.userid}"</c:if>>
									</div>
								</div>
								<div class="form-group">
									<label for="userName" class="control-label">
										<i class="fas fa-user"></i> 姓名
									</label>
									<div>
										<input type="text" class="form-control" id="userName" name="username" placeholder="请输入姓名"
											   <c:if test='${student!=null}'>value="${student.username}"</c:if>>
									</div>
								</div>
								<div class="form-group">
									<label for="sex" class="control-label">
										<i class="fas fa-venus-mars"></i> 性别
									</label>
									<div>
										<label class="checkbox-inline">
											<input type="radio" name="sex" value="男" checked> 男
										</label>
										<label class="checkbox-inline">
											<input type="radio" name="sex" value="女"> 女
										</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="birthYear" class="control-label">
										<i class="fas fa-birthday-cake"></i> 出生年份
									</label>
									<div>
										<input type="date" value="1996-09-02" name="birthyear" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label for="grade" class="control-label">
										<i class="fas fa-calendar-alt"></i> 入学时间
									</label>
									<div>
										<input type="date" value="2015-09-02" name="grade" class="form-control"/>
									</div>
								</div>
								<div class="form-group">
									<label for="collegeId" class="control-label">
										<i class="fas fa-university"></i> 所属院系
									</label>
									<div>
										<select class="form-control" name="collegeid" id="collegeId">
											<option value="">请选择院系</option>
											<c:forEach items="${collegeList}" var="item">
												<option value="${item.collegeid}">${item.collegename}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group" style="text-align: center; margin-top: 40px;">
							<button class="btn btn-default" type="submit">
								<i class="fas fa-check-circle"></i> 提交
							</button>
							<button class="btn btn-default" type="reset" onclick="resetForm()">
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

<!-- 成功提示弹窗 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%); color: white; border: none;">
				<h5 class="modal-title">
					<i class="fas fa-check-circle"></i> 操作成功
				</h5>
			</div>
			<div class="modal-body text-center">
				<div style="font-size: 60px; color: #27ae60; margin: 20px 0;">
					<i class="fas fa-check-circle"></i>
				</div>
				<h4 style="color: #27ae60; margin-bottom: 20px;">学生信息添加成功！</h4>
				<p id="successDetails" style="color: #666;"></p>
			</div>
			<div class="modal-footer" style="border: none;">
				<button type="button" class="btn btn-success" data-bs-dismiss="modal" onclick="resetForm()">
					<i class="fas fa-check"></i> 确定
				</button>
			</div>
		</div>
	</div>
</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#nav li:nth-child(2)").addClass("active");

		// 初始化模态框
		var successModal = new bootstrap.Modal(document.getElementById('successModal'));
		window.successModal = successModal;

		// 修复下拉框
		fixAllDropdowns();

		// 设置表单验证
		setupFormValidation();

		// 实时调整下拉框宽度
		adjustSelectWidths();
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
	function setupFormValidation() {
		$('#editfrom').submit(function(e) {
			e.preventDefault();

			var isValid = true;
			var errorMessages = [];

			// 重置验证状态
			$('.form-control').removeClass('is-invalid is-valid');

			// 验证必填项
			var requiredFields = [
				{ selector: 'input[name="userid"]', name: '学号' },
				{ selector: 'input[name="username"]', name: '姓名' },
				{ selector: 'select[name="collegeid"]', name: '所属院系' },
				{ selector: 'input[name="birthyear"]', name: '出生年份' },
				{ selector: 'input[name="grade"]', name: '入学时间' }
			];

			requiredFields.forEach(function(field) {
				var $input = $(field.selector);
				var value = $input.val().trim();

				if (!value) {
					$input.addClass('is-invalid');
					isValid = false;
					errorMessages.push(field.name + '不能为空');
				} else {
					$input.addClass('is-valid');
				}
			});

			// 验证学号格式
			var userId = $('input[name="userid"]').val().trim();
			if (userId && !/^\d+$/.test(userId)) {
				$('input[name="userid"]').addClass('is-invalid');
				isValid = false;
				errorMessages.push('学号必须是数字');
			}

			if (isValid) {
				// 使用AJAX提交
				submitFormData();
			} else {
				// 显示错误提示
				showErrorMessage('请检查以下错误：', errorMessages);
			}
		});
	}

	// 提交表单数据
	function submitFormData() {
		var formData = $('#editfrom').serialize();

		// 显示加载状态
		$('button[type="submit"]').html('<i class="fas fa-spinner fa-spin"></i> 提交中...').prop('disabled', true);

		$.ajax({
			url: '/admin/addStudent',
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
		var studentId = $('input[name="userid"]').val();
		var studentName = $('input[name="username"]').val();
		var collegeName = $('select[name="collegeid"] option:selected').text();
		var now = new Date();
		var timeStr = now.toLocaleString('zh-CN');

		$('#successDetails').html(`
			<p><strong>学号：</strong>${studentId}</p>
			<p><strong>姓名：</strong>${studentName}</p>
			<p><strong>所属院系：</strong>${collegeName}</p>
			<p><strong>操作时间：</strong>${timeStr}</p>
			<p><small style="color: #95a5a6;">默认密码：123</small></p>
		`);

		successModal.show();
	}

	// 显示错误消息
	function showErrorMessage(title, messages) {
		var messageText = messages.join('\n');
		alert(title + '\n\n' + messageText);
	}

	// 重置表单
	function resetForm() {
		$('#editfrom')[0].reset();
		$('.form-control').removeClass('is-valid is-invalid');
		$('button[type="submit"]').html('<i class="fas fa-check-circle"></i> 提交').prop('disabled', false);

		// 重新修复下拉框
		fixAllDropdowns();

		// 关闭模态框
		if (successModal) {
			successModal.hide();
		}
	}
</script>
</html>