<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>学生打分</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

	<style>
		body {
			background: linear-gradient(135deg, #fff9f5 0%, #fff0e6 100%);
			font-family: 'Microsoft YaHei', 'Segoe UI', sans-serif;
			color: #2c3e50;
		}

		#content {
			margin-top: 20px;
			margin-bottom: 40px;
		}

		.panel-default {
			border: none;
			border-radius: 15px;
			box-shadow: 0 5px 20px rgba(255, 107, 53, 0.15);
			overflow: hidden;
			border-top: 4px solid #ff6b35;
			max-width: 600px;
			margin: 0 auto;
		}

		.panel-heading {
			background: linear-gradient(135deg, #ff6b35 0%, #ff8c42 100%);
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
			background: #ff6b35;
			border-radius: 2px;
		}

		.form-group label {
			color: #2c3e50;
			font-weight: 600;
			padding-top: 12px;
		}

		.form-control {
			border: 2px solid #ffd4bc;
			border-radius: 8px;
			padding: 12px 15px;
			transition: all 0.3s;
			font-size: 16px;
			height: 46px;
		}

		.form-control:focus {
			border-color: #ff6b35;
			box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25);
		}

		.form-control[readonly] {
			background-color: #fff9f0;
			color: #7f8c8d;
			cursor: not-allowed;
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
			background: #ff6b35;
			color: white;
			border-color: #ff6b35;
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(255, 107, 53, 0.3);
		}

		.btn-default[type="submit"] {
			background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
			color: white;
			border: none;
		}

		.btn-default[type="submit"]:hover {
			background: linear-gradient(90deg, #e55a2b 0%, #ff7a35 100%);
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(255, 107, 53, 0.4);
		}

		.btn-default[type="reset"] {
			background: #95a5a6;
			color: white;
			border: none;
		}

		.btn-default[type="reset"]:hover {
			background: #7f8c8d;
			transform: translateY(-2px);
			box-shadow: 0 4px 12px rgba(127, 140, 141, 0.3);
		}

		#footer {
			margin-top: 30px;
			padding: 20px 0;
			background: #fff9f0;
			border-top: 1px solid #ffe8d6;
			color: #ff6b35;
			text-align: center;
		}

		.col-md-10 {
			padding-left: 30px;
		}

		.col-sm-10 {
			padding-left: 15px;
		}

		.col-sm-2 {
			padding-right: 0;
		}

		.form-group.text-center {
			margin-top: 40px;
		}

		/* 分数等级提示 */
		.grade-hint {
			font-size: 12px;
			color: #7f8c8d;
			margin-top: 5px;
			padding-left: 5px;
		}

		.grade-hint i {
			margin-right: 5px;
			color: #ff6b35;
		}

		/* 输入验证状态 */
		.has-error .form-control {
			border-color: #e74c3c;
		}

		.has-success .form-control {
			border-color: #27ae60;
		}

		/* 响应式调整 */
		@media (max-width: 768px) {
			.col-md-10 {
				padding-left: 15px;
			}

			.btn {
				padding: 10px 20px;
				min-width: 120px;
				margin: 5px;
			}

			.form-group:before {
				display: none;
			}

			.panel-heading h1 {
				font-size: 20px;
			}
		}

		/* 学生信息卡片 */
		.student-card {
			background: #fff9f0;
			border-radius: 10px;
			padding: 15px;
			margin-bottom: 20px;
			border-left: 4px solid #ff6b35;
		}

		.student-card h5 {
			color: #ff6b35;
			margin-bottom: 10px;
			font-weight: 600;
		}

		.student-card p {
			margin: 5px 0;
			color: #2c3e50;
		}

		.student-card i {
			margin-right: 8px;
			color: #ff8c42;
			width: 20px;
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
							<i class="fas fa-chart-line"></i> 学生成绩评定
						</h1>
					</div>
				</div>
				<div class="panel-body">
					<!-- 学生信息卡片 -->
					<div class="student-card">
						<h5><i class="fas fa-user-graduate"></i> 学生信息</h5>
						<p><i class="fas fa-id-card"></i> <strong>学号：</strong> ${selectedCourse.studentid}</p>
						<p><i class="fas fa-user"></i> <strong>姓名：</strong> ${selectedCourse.studentCustom.username}</p>
						<p><i class="fas fa-book"></i> <strong>课程：</strong> ${selectedCourse.couseCustom.coursename}</p>
					</div>

					<form name="reset" class="form-horizontal" role="form" action="/teacher/mark" id="editfrom" method="post" onsubmit="return check()">
						<!-- 隐藏字段 -->
						<div class="form-group" style="display: none;">
							<div class="col-sm-10">
								<input type="hidden" class="form-control" name="courseid" value="${selectedCourse.courseid}">
								<input type="hidden" class="form-control" name="studentid" value="${selectedCourse.studentid}">
							</div>
						</div>

						<!-- 成绩输入 -->
						<div class="form-group">
							<label for="mark" class="col-sm-2 control-label">
								<i class="fas fa-star"></i> 成绩
							</label>
							<div class="col-sm-10">
								<input type="number" name="mark" class="form-control" id="mark" placeholder="请输入0-100之间的成绩" min="0" max="100" step="0.1" required>
								<div class="grade-hint">
									<i class="fas fa-info-circle"></i> 成绩范围：0-100分，可输入小数（如：85.5）
								</div>
								<div id="gradeLevel" style="font-size: 12px; margin-top: 5px; font-weight: 500;"></div>
							</div>
						</div>

						<!-- 评语输入 -->
						<div class="form-group">
							<label for="comment" class="col-sm-2 control-label">
								<i class="fas fa-comment"></i> 评语
							</label>
							<div class="col-sm-10">
								<textarea name="comment" class="form-control" id="comment" placeholder="请输入学生评语（选填）" rows="3"></textarea>
							</div>
						</div>

						<div class="form-group" style="text-align: center; margin-top: 40px;">
							<button class="btn btn-default" type="submit">
								<i class="fas fa-check-circle"></i> 提交成绩
							</button>
							<button class="btn btn-default" type="reset">
								<i class="fas fa-redo"></i> 重置
							</button>
							<button class="btn btn-default" type="button" onclick="history.back()">
								<i class="fas fa-arrow-left"></i> 返回
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
	$("#nav li:nth-child(1)").addClass("active");

	// 成绩等级判断
	function getGradeLevel(mark) {
		if (mark >= 90) return {text: '优秀', color: '#27ae60', icon: 'fas fa-trophy'};
		else if (mark >= 80) return {text: '良好', color: '#f39c12', icon: 'fas fa-medal'};
		else if (mark >= 70) return {text: '中等', color: '#3498db', icon: 'fas fa-award'};
		else if (mark >= 60) return {text: '及格', color: '#9b59b6', icon: 'fas fa-check'};
		else return {text: '不及格', color: '#e74c3c', icon: 'fas fa-exclamation-triangle'};
	}

	// 成绩输入监听
	$('#mark').on('input', function() {
		var mark = $(this).val();
		var gradeLevelDiv = $('#gradeLevel');

		if (mark === '' || isNaN(mark)) {
			gradeLevelDiv.html('');
			$(this).parent().removeClass('has-success has-error');
			return;
		}

		mark = parseFloat(mark);

		if (mark >= 0 && mark <= 100) {
			var level = getGradeLevel(mark);
			gradeLevelDiv.html('<i class="' + level.icon + '" style="color:' + level.color + '; margin-right:5px;"></i>' +
					'<span style="color:' + level.color + ';">' + level.text + ' (' + mark + '分)</span>');
			$(this).parent().removeClass('has-error').addClass('has-success');
		} else {
			gradeLevelDiv.html('<i class="fas fa-exclamation-triangle" style="color:#e74c3c; margin-right:5px;"></i>' +
					'<span style="color:#e74c3c;">成绩必须在0-100之间</span>');
			$(this).parent().removeClass('has-success').addClass('has-error');
		}
	});

	// 输入框焦点效果
	$('#mark, #comment').focus(function() {
		$(this).parent().addClass('has-success');
	}).blur(function() {
		$(this).parent().removeClass('has-success');
	});

	function check() {
		var mark = $('#mark').val();

		// 重置错误状态
		$('.form-group').removeClass('has-error');

		if (mark === '' || mark === null) {
			alert("请输入成绩");
			$('#mark').focus().parent().addClass('has-error');
			return false;
		}

		mark = parseFloat(mark);

		if (isNaN(mark)) {
			alert("请输入有效的数字成绩");
			$('#mark').focus().parent().addClass('has-error');
			return false;
		}

		if (mark < 0 || mark > 100) {
			alert("成绩必须在0-100之间");
			$('#mark').focus().parent().addClass('has-error');
			return false;
		}

		var studentName = '${selectedCourse.studentCustom.username}';
		var courseName = '${selectedCourse.couseCustom.coursename}';
		var level = getGradeLevel(mark);

		var confirmMsg = '确定给【' + studentName + '】的【' + courseName + '】课程评分 ' + mark + ' 分吗？\n\n';
		confirmMsg += '成绩等级：' + level.text + '\n\n';
		confirmMsg += '提交后成绩将无法修改，请确认！';

		if (confirm(confirmMsg)) {
			// 显示提交中提示
			$('button[type="submit"]').html('<i class="fas fa-spinner fa-spin"></i> 提交中...').prop('disabled', true);
			return true;
		} else {
			return false;
		}
	}

	// 重置按钮事件
	$('button[type="reset"]').click(function() {
		$('.form-group').removeClass('has-error has-success');
		$('#gradeLevel').html('');
		$('button[type="submit"]').html('<i class="fas fa-check-circle"></i> 提交成绩').prop('disabled', false);
	});

	// 页面加载完成后自动聚焦成绩输入框
	$(document).ready(function() {
		$('#mark').focus();

		// 如果有旧的成绩，显示出来
		var oldMark = '${selectedCourse.mark}';
		if (oldMark && oldMark !== 'null' && oldMark !== '') {
			$('#mark').val(oldMark).trigger('input');
		}
	});
</script>
</html>