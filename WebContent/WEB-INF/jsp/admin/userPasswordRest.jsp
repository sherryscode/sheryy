<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>重置其他用户密码</title>
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
			max-width: 600px;
			margin: 0 auto;
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
		}
		.form-control:focus {
			border-color: #3498db;
			box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
		}
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
		#footer {
			background: #2c3e50;
			color: white;
			padding: 20px 0;
			margin-top: 40px;
			border-top: 3px solid #3498db;
		}
		.password-strength {
			height: 5px;
			margin-top: 5px;
			border-radius: 2px;
			transition: all 0.3s;
		}
		.password-strength.weak {
			background: #e74c3c;
			width: 33%;
		}
		.password-strength.medium {
			background: #f39c12;
			width: 66%;
		}
		.password-strength.strong {
			background: #27ae60;
			width: 100%;
		}
		/* 成功提示弹窗样式 */
		.success-alert {
			position: fixed;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background: white;
			border-radius: 12px;
			box-shadow: 0 8px 30px rgba(0,0,0,0.2);
			padding: 30px;
			text-align: center;
			z-index: 9999;
			display: none;
			min-width: 350px;
			border-top: 4px solid #27ae60;
		}
		.success-alert i {
			font-size: 60px;
			color: #27ae60;
			margin-bottom: 20px;
		}
		.success-alert h3 {
			color: #2c3e50;
			margin-bottom: 15px;
			font-weight: 600;
		}
		.success-alert p {
			color: #7f8c8d;
			margin-bottom: 25px;
		}
		.success-alert .btn {
			background: #27ae60;
			color: white;
			border: none;
			padding: 10px 30px;
		}
		.success-alert .btn:hover {
			background: #219653;
			box-shadow: 0 4px 12px rgba(39, 174, 96, 0.3);
		}
		/* 遮罩层 */
		.mask {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,0.5);
			z-index: 9998;
			display: none;
		}
	</style>
</head>
<body>
<!-- 成功提示弹窗 -->
<div class="mask" id="mask"></div>
<div class="success-alert" id="successAlert">
	<i class="fas fa-check-circle"></i>
	<h3>密码重置成功！</h3>
	<p>该用户的密码已更新，请通知用户使用新密码登录</p>
	<button class="btn" onclick="closeSuccessAlert()">确 定</button>
</div>

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
							<i class="fas fa-user-lock"></i> 重置其他用户密码
						</h1>
					</div>
				</div>
				<div class="panel-body">
					<form name="reset" class="form-horizontal" role="form" action="/admin/userPasswordRest" id="editfrom" method="post" onsubmit="return check()">
						<div class="form-group">
							<label for="inputUsername" class="col-sm-3 control-label">
								<i class="fas fa-user"></i> 账号(非管理员)
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="username" id="inputUsername" placeholder="请输入用户名">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-sm-3 control-label">
								<i class="fas fa-key"></i> 新密码
							</label>
							<div class="col-sm-9">
								<input type="password" name="password" class="form-control" id="inputPassword" placeholder="请输入新密码（8位以上，含字母+数字）">
								<div id="passwordStrength" class="password-strength"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPasswordConfirm" class="col-sm-3 control-label">
								<i class="fas fa-key"></i> 确认密码
							</label>
							<div class="col-sm-9">
								<input type="password" name="password2" class="form-control" id="inputPasswordConfirm" placeholder="请再次输入新密码">
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
<script>
	// 激活菜单第四项（保持原有逻辑）
	$("#nav li:nth-child(4)").addClass("active");

	// 页面加载时检查后端返回的成功标识
	$(document).ready(function() {
		// 方式1：通过URL参数获取成功状态（推荐）
		const urlParams = new URLSearchParams(window.location.search);
		if (urlParams.get('success') === 'true') {
			showSuccessAlert();
		}

		// 方式2：如果后端通过页面属性传递（可选）
		// const resetSuccess = '${resetSuccess}'; // 后端通过EL表达式传递
		// if (resetSuccess === 'true') {
		//     showSuccessAlert();
		// }
	});

	// 显示成功提示弹窗
	function showSuccessAlert() {
		$("#mask").fadeIn(300);
		$("#successAlert").fadeIn(300);
	}

	// 关闭成功提示弹窗
	function closeSuccessAlert() {
		$("#mask").fadeOut(300);
		$("#successAlert").fadeOut(300);
		// 可选：关闭弹窗后清空表单
		document.getElementById("editfrom").reset();
		// 可选：刷新页面或返回列表页
		// window.location.href = "/admin/userList";
	}

	// 恢复原有密码强度校验逻辑
	function checkPasswordStrength(password) {
		let strength = 0;
		// 长度校验（8位以上）
		if (password.length >= 8) strength++;
		// 包含字母
		if (/[a-zA-Z]/.test(password)) strength++;
		// 包含数字
		if (/[0-9]/.test(password)) strength++;
		// 包含特殊字符（可选，不强制）
		if (/[^a-zA-Z0-9]/.test(password)) strength++;

		const strengthBar = $('#passwordStrength');
		strengthBar.removeClass("weak medium strong");

		if (strength < 2) {
			strengthBar.addClass("weak"); // 弱：长度不足8 或 只有字母/只有数字
		} else if (strength === 2 || strength === 3) {
			strengthBar.addClass("medium"); // 中：8位以上+字母+数字 或 额外包含特殊字符
		} else {
			strengthBar.addClass("strong"); // 强：8位以上+字母+数字+特殊字符
		}
	}

	// 监听新密码输入，实时更新强度条
	$('#inputPassword').on('input', function() {
		checkPasswordStrength($(this).val());
	});

	// 表单提交校验（适配新样式的交互逻辑）
	function check() {
		// 重置所有输入框边框样式
		$('.form-control').css('border-color', '#e3e8ed');

		// 用户名校验
		if(reset.username.value==""||reset.username.value==null) {
			alert("请输入账户名称");
			$('#inputUsername').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 新密码校验
		if(reset.password.value==""||reset.password.value==null) {
			alert("请输入新密码");
			$('#inputPassword').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 密码强度校验（恢复原有规则：至少8位+字母+数字）
		const password = reset.password.value;
		const strength = checkPasswordStrength(password);
		if (strength < 2) {
			alert("密码强度不足！请设置8位以上，包含字母和数字的密码");
			$('#inputPassword').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 确认密码校验
		if(reset.password2.value==""||reset.password2.value==null) {
			alert("请再次输入密码");
			$('#inputPasswordConfirm').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 两次密码一致性校验
		if(reset.password.value != reset.password2.value) {
			alert("两次输入的密码不一致");
			$('#inputPassword, #inputPasswordConfirm').css('border-color', '#e74c3c');
			return false;
		}

		return true;
	}
</script>
</html>