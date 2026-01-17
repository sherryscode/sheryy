<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>修改密码</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!-- 引入字体图标 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<style>
		/* 全局橙色主题样式 */
		body {
			background: linear-gradient(135deg, #fff8f0 0%, #ffe8cc 100%);
			font-family: 'Microsoft YaHei', sans-serif;
			color: #333;
			margin: 0;
			padding: 0;
		}

		/* 主体容器 */
		#content {
			background: transparent;
			padding-top: 30px;
		}

		/* 面板样式 */
		.panel-default {
			border: none;
			border-radius: 12px;
			box-shadow: 0 5px 20px rgba(255, 153, 0, 0.15);
			overflow: hidden;
			border-top: 4px solid #ff9900;
			max-width: 600px;
			margin: 0 auto;
		}

		/* 面板头部 */
		.panel-heading {
			background: linear-gradient(135deg, #e67e22 0%, #ff9900 100%);
			color: white;
			border: none;
			padding: 25px 20px;
		}

		.panel-heading h1 {
			margin: 0;
			font-weight: 600;
			font-size: 24px;
			text-align: center;
			text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
		}

		/* 面板内容 */
		.panel-body {
			padding: 30px;
			background: white;
		}

		/* 表单样式 */
		.form-group {
			margin-bottom: 25px;
			position: relative;
		}

		/* 表单标签前缀竖线 */
		.form-group:before {
			content: "";
			position: absolute;
			left: -10px;
			top: 15px;
			width: 4px;
			height: 20px;
			background: #ff9900;
			border-radius: 2px;
		}

		.form-group label {
			color: #e67e22;
			font-weight: 600;
			padding-top: 8px;
			font-size: 14px;
		}

		/* 输入框样式 */
		.form-control {
			border: 2px solid #ffd599;
			border-radius: 8px;
			padding: 12px 15px;
			transition: all 0.3s ease;
			font-size: 14px;
		}

		.form-control:focus {
			border-color: #ff9900;
			box-shadow: 0 0 0 0.2rem rgba(255, 153, 0, 0.25);
			outline: none;
		}

		/* 按钮样式 */
		.btn {
			border-radius: 8px;
			padding: 12px 35px;
			font-weight: 600;
			font-size: 16px;
			transition: all 0.3s ease;
			margin: 0 10px;
			min-width: 140px;
			border: none;
		}

		.btn-default {
			background: #f8f9fa;
			color: #333;
			border: 2px solid #ffcc80 !important;
		}

		.btn-default:hover {
			background: #ff9900;
			color: white;
			border-color: #ff9900 !important;
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(255, 153, 0, 0.3);
		}

		.btn-default[type="submit"] {
			background: #ff9900;
			color: white;
			border-color: #ff9900 !important;
		}

		.btn-default[type="submit"]:hover {
			background: #e67e22;
			box-shadow: 0 4px 12px rgba(230, 126, 34, 0.4);
		}

		/* 密码强度条 */
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

		/* 页脚样式 */
		#footer {
			background: #333;
			color: #ffcc80;
			padding: 20px 0;
			margin-top: 40px;
			border-top: 3px solid #ff9900;
		}

		#footer .col-md-12 {
			text-align: center;
			padding: 10px;
			font-size: 12px;
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
						<h1><i class="fas fa-key"></i> 修改密码</h1>
					</div>
				</div>
				<div class="panel-body">
					<form name="reset" class="form-horizontal" role="form" action="/passwordRest" id="editfrom" method="post" onsubmit="return check()">
						<!-- 旧密码 -->
						<div class="form-group">
							<label for="oldPassword" class="col-sm-2 control-label">
								<i class="fas fa-lock"></i> 旧密码
							</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="请输入旧密码">
							</div>
						</div>

						<!-- 新密码 -->
						<div class="form-group">
							<label for="newPassword" class="col-sm-2 control-label">
								<i class="fas fa-key"></i> 新密码
							</label>
							<div class="col-sm-10">
								<input type="password" name="password1" class="form-control" id="newPassword" placeholder="请输入新密码（8位以上，含字母+数字）">
								<!-- 密码强度条 -->
								<div id="passwordStrength" class="password-strength"></div>
							</div>
						</div>

						<!-- 确认密码 -->
						<div class="form-group">
							<label for="confirmPassword" class="col-sm-2 control-label">
								<i class="fas fa-key"></i> 确认密码
							</label>
							<div class="col-sm-10">
								<input type="password" name="password2" class="form-control" id="confirmPassword" placeholder="请再次输入新密码">
							</div>
						</div>

						<!-- 按钮组 -->
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

<!-- 页脚 -->
<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12">
			<p style="margin: 0;">© 2026 系统管理平台 | 安全保障 · 隐私保护</p>
		</div>
	</div>
</div>
</body>
<script>
	// 激活菜单第二项
	$("#nav li:nth-child(2)").addClass("active");

	// 密码强度校验函数（统一简化版规则）
	function checkPasswordStrength(password) {
		let strength = 0;
		// 长度校验（8位以上）
		if (password.length >= 8) strength++;
		// 包含字母（不区分大小写）
		if (/[a-zA-Z]/.test(password)) strength++;
		// 包含数字
		if (/[0-9]/.test(password)) strength++;
		// 包含特殊字符（可选加分项）
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
		return strength; // 返回强度值用于提交校验
	}

	// 监听新密码输入，实时更新强度条
	$('#newPassword').on('input', function() {
		checkPasswordStrength($(this).val());
	});

	// 表单提交校验
	function check() {
		// 重置所有输入框边框样式
		$('.form-control').css('border-color', '#ffd599');

		// 旧密码校验
		if(reset.oldPassword.value==""||reset.oldPassword.value==null) {
			alert("请输入旧账户密码");
			$('#oldPassword').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 新密码非空校验
		if(reset.password1.value==""||reset.password1.value==null) {
			alert("请输入重置密码");
			$('#newPassword').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 密码强度校验（8位以上+字母+数字）
		const password = reset.password1.value;
		const strength = checkPasswordStrength(password);
		if (strength < 2) {
			alert("密码强度不足！请设置8位以上，包含字母和数字的密码");
			$('#newPassword').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 确认密码非空校验
		if(reset.password2.value==""||reset.password2.value==null) {
			alert("请再次输入密码");
			$('#confirmPassword').focus().css('border-color', '#e74c3c');
			return false;
		}

		// 两次密码一致性校验
		if(reset.password1.value != reset.password2.value) {
			alert("两次密码不正确");
			$('#newPassword, #confirmPassword').css('border-color', '#e74c3c');
			return false;
		}

		return true;
	}
</script>
</html>