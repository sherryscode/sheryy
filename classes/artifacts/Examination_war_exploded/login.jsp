<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>教务管理系统 | 登录</title>
	<!-- Bootstrap 5 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome 图标 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<!-- 自定义样式 -->
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		:root {
			--primary-color: #4a6bff;
			--secondary-color: #6c63ff;
			--accent-color: #ff6b6b;
			--light-bg: #f8f9fa;
			--dark-text: #333;
			--light-text: #666;
			--white: #ffffff;
			--shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
			--transition: all 0.3s ease;
		}

		body {
			font-family: 'Segoe UI', 'Microsoft YaHei', sans-serif;
			background: url(images/a.jpg) repeat;
			min-height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 20px;
			position: relative;
		}

		body::before {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background: rgba(255, 255, 255, 0.1);
			backdrop-filter: blur(2px);
			z-index: -1;
		}

		.login-container {
			width: 100%;
			max-width: 460px;
			margin: 0 auto;
		}

		.login-card {
			background: var(--white);
			border-radius: 20px;
			padding: 50px 45px 40px 45px;
			box-shadow: var(--shadow);
			position: relative;
			overflow: hidden;
			border: 1px solid rgba(255, 255, 255, 0.2);
			background: rgba(255, 255, 255, 0.95);
			backdrop-filter: blur(10px);
		}

		.login-card::before {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			height: 5px;
			background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
		}

		.logo-container {
			text-align: center;
			margin-bottom: 40px;
		}

		.logo {
			width: 85px;
			height: 85px;
			background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
			border-radius: 50%;
			display: flex;
			align-items: center;
			justify-content: center;
			margin: 0 auto 20px;
			box-shadow: 0 5px 15px rgba(74, 107, 255, 0.3);
		}

		.logo i {
			font-size: 38px;
			color: white;
		}

		.system-title h1 {
			color: var(--dark-text);
			font-size: 32px;
			font-weight: 700;
			margin-bottom: 8px;
			background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
			-webkit-background-clip: text;
			background-clip: text;
			color: transparent;
		}

		.system-subtitle {
			color: var(--light-text);
			font-size: 16px;
			letter-spacing: 1.5px;
			text-transform: uppercase;
			margin-bottom: 5px;
		}

		.input-section {
			margin-bottom: 30px;
		}

		.input-row {
			margin-bottom: 25px;
		}

		.input-label {
			display: flex;
			align-items: center;
			margin-bottom: 16px;
			color: var(--dark-text);
			font-weight: 600;
			font-size: 17px;
			padding-left: 2px;
		}

		.input-label i {
			margin-right: 12px;
			color: var(--primary-color);
			font-size: 20px;
			width: 26px;
			text-align: center;
		}

		.form-control {
			width: 100%;
			height: 52px;
			padding: 16px 20px;
			border: 2px solid #e0e0e0;
			border-radius: 12px;
			font-size: 17px;
			transition: var(--transition);
			background-color: rgba(255, 255, 255, 0.95);
			line-height: 1.5;
			box-sizing: border-box;
		}

		.form-control:focus {
			border-color: var(--primary-color);
			box-shadow: 0 0 0 4px rgba(74, 107, 255, 0.15);
			outline: none;
			background-color: var(--white);
			transform: translateY(-1px);
		}

		.form-control::placeholder {
			color: #aaa;
			font-size: 16px;
		}

		.password-wrapper {
			position: relative;
			display: flex;
			align-items: center;
		}

		.password-wrapper .form-control {
			padding-right: 55px;
		}

		.role-selection {
			margin: 35px 0 30px 0;
		}

		.role-title {
			display: flex;
			align-items: center;
			font-weight: 600;
			margin-bottom: 18px;
			color: var(--dark-text);
			font-size: 17px;
		}

		.role-title i {
			margin-right: 12px;
			color: var(--primary-color);
			font-size: 20px;
		}

		.role-options {
			display: flex;
			gap: 15px;
			flex-wrap: wrap;
		}

		.role-option {
			flex: 1;
			min-width: 110px;
		}

		.role-option input[type="radio"] {
			display: none;
		}

		.role-option label {
			display: flex;
			flex-direction: column;
			align-items: center;
			padding: 20px 12px;
			border: 2px solid #e0e0e0;
			border-radius: 12px;
			cursor: pointer;
			transition: var(--transition);
			text-align: center;
			font-weight: 600;
			color: var(--light-text);
			background-color: rgba(255, 255, 255, 0.9);
			gap: 10px;
			height: 100px;
			justify-content: center;
		}

		.role-option label i {
			font-size: 28px;
			color: var(--light-text);
			transition: var(--transition);
		}

		.role-option input[type="radio"]:checked + label {
			border-color: var(--primary-color);
			background-color: rgba(74, 107, 255, 0.08);
			color: var(--primary-color);
			transform: translateY(-3px);
			box-shadow: 0 8px 20px rgba(74, 107, 255, 0.15);
		}

		.role-option input[type="radio"]:checked + label i {
			color: var(--primary-color);
		}

		.login-btn {
			width: 100%;
			height: 56px;
			padding: 0;
			background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
			color: white;
			border: none;
			border-radius: 12px;
			font-size: 18px;
			font-weight: 600;
			cursor: pointer;
			transition: var(--transition);
			margin-top: 20px;
			display: flex;
			align-items: center;
			justify-content: center;
			letter-spacing: 1px;
		}

		.login-btn:hover {
			transform: translateY(-3px);
			box-shadow: 0 8px 20px rgba(74, 107, 255, 0.3);
		}

		.login-btn:active {
			transform: translateY(-1px);
		}

		.login-btn i {
			margin-right: 12px;
			font-size: 20px;
		}

		.password-toggle {
			position: absolute;
			right: 18px;
			top: 50%;
			transform: translateY(-50%);
			background: none;
			border: none;
			color: var(--light-text);
			cursor: pointer;
			padding: 10px;
			font-size: 20px;
			transition: var(--transition);
			z-index: 2;
		}

		.password-toggle:hover {
			color: var(--primary-color);
			transform: translateY(-50%) scale(1.1);
		}

		.copyright {
			text-align: center;
			margin-top: 30px;
			color: var(--light-text);
			font-size: 14px;
			line-height: 1.6;
			padding: 18px;
			background: rgba(248, 249, 250, 0.6);
			border-radius: 10px;
			border: 1px solid rgba(0, 0, 0, 0.08);
			font-weight: 500;
		}

		.message-alert {
			padding: 15px;
			border-radius: 10px;
			margin-bottom: 20px;
			text-align: center;
			font-weight: 600;
			display: none;
		}

		.alert-success {
			background-color: rgba(40, 167, 69, 0.1);
			color: #28a745;
			border: 1px solid #28a745;
		}

		.alert-danger {
			background-color: rgba(220, 53, 69, 0.1);
			color: #dc3545;
			border: 1px solid #dc3545;
		}

		@media (max-width: 576px) {
			.login-card {
				padding: 40px 25px 30px 25px;
			}

			.login-container {
				max-width: 400px;
			}

			.role-option {
				min-width: 100px;
			}

			.system-title h1 {
				font-size: 28px;
			}

			.system-subtitle {
				font-size: 14px;
			}

			.form-control {
				height: 50px;
				padding: 14px 18px;
			}

			.login-btn {
				height: 54px;
			}

			.copyright {
				font-size: 13px;
				padding: 15px;
			}
		}

		@keyframes fadeIn {
			from {
				opacity: 0;
				transform: translateY(20px);
			}
			to {
				opacity: 1;
				transform: translateY(0);
			}
		}

		.login-card {
			animation: fadeIn 0.6s ease-out;
		}

		@supports (backdrop-filter: blur(10px)) {
			.login-card {
				background: rgba(255, 255, 255, 0.88);
				backdrop-filter: blur(12px);
			}

			body::before {
				backdrop-filter: blur(3px);
			}
		}

		@media (max-width: 768px) {
			body {
				background-attachment: fixed;
				background-size: cover;
			}
		}

		.form-control:focus {
			border-width: 2.5px;
		}

		.input-label {
			margin-bottom: 18px;
		}

		.input-row:first-child .form-control,
		.input-row:last-child .form-control {
			height: 52px !important;
		}
	</style>
</head>
<body>
<div class="login-container">
	<div class="login-card">
		<div class="logo-container">
			<div class="logo">
				<i class="fas fa-university"></i>
			</div>
			<div class="system-title">
				<h1>教务管理系统</h1>
				<p class="system-subtitle">Educational Management System</p>
			</div>
		</div>

		<!-- 消息提示容器 -->
		<div id="messageAlert" class="message-alert"></div>

		<!-- 登录表单 -->
		<form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
			<div class="input-section">
				<div class="input-row">
					<div class="input-label">
						<i class="fas fa-user"></i>
						<span>用户账号</span>
					</div>
					<input type="text"
						   id="username"
						   name="username"
						   class="form-control"
						   placeholder="请输入用户名或学号/工号"
						   required
						   value="admin">
				</div>

				<div class="input-row">
					<div class="input-label">
						<i class="fas fa-lock"></i>
						<span>登录密码</span>
					</div>
					<div class="password-wrapper">
						<input type="password"
							   id="password"
							   name="password"
							   class="form-control"
							   placeholder="请输入密码"
							   required>
						<button type="button" class="password-toggle" id="togglePassword">
							<i class="fas fa-eye"></i>
						</button>
					</div>
				</div>
			</div>

			<div class="role-selection">
				<div class="role-title">
					<i class="fas fa-id-card"></i>
					<span>选择登录身份</span>
				</div>
				<div class="role-options">
					<div class="role-option">
						<input type="radio" id="role-admin" name="role" value="0" checked>
						<label for="role-admin">
							<i class="fas fa-user-cog"></i>
							管理员
						</label>
					</div>
					<div class="role-option">
						<input type="radio" id="role-teacher" name="role" value="1">
						<label for="role-teacher">
							<i class="fas fa-chalkboard-teacher"></i>
							教师
						</label>
					</div>
					<div class="role-option">
						<input type="radio" id="role-student" name="role" value="2">
						<label for="role-student">
							<i class="fas fa-user-graduate"></i>
							学生
						</label>
					</div>
				</div>
			</div>

			<button type="submit" class="login-btn">
				<i class="fas fa-sign-in-alt"></i>
				登录系统
			</button>
		</form>

		<div class="copyright">
			<p>23软工二班 | 作者: sherry | 版本: 3.2.1</p>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		// 核心元素
		const loginForm = document.getElementById('loginForm');
		const messageAlert = document.getElementById('messageAlert');

		// 登录按钮加载动画
		loginForm.addEventListener('submit', function() {
			const btn = this.querySelector('.login-btn');
			btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 登录中...';
			btn.disabled = true;
		});

		// 密码显示/隐藏切换
		const togglePassword = document.getElementById('togglePassword');
		const passwordInput = document.getElementById('password');
		if (togglePassword && passwordInput) {
			togglePassword.addEventListener('click', function() {
				const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
				passwordInput.setAttribute('type', type);
				this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
			});
		}

		// 默认聚焦登录框
		document.getElementById('username').focus();
	});

	// 消息提示函数
	function showMessage(message, isSuccess = true) {
		const alertEl = document.getElementById('messageAlert');
		alertEl.textContent = message;
		alertEl.className = 'message-alert';
		alertEl.classList.add(isSuccess ? 'alert-success' : 'alert-danger');
		alertEl.style.display = 'block';
		setTimeout(() => {
			alertEl.style.display = 'none';
		}, 3000);
	}
</script>
</body>
</html>