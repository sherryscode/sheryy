<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>学生管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!-- Font Awesome图标 -->
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
			padding: 20px;
		}
		.panel-heading h1 {
			margin: 0;
			font-weight: 600;
			font-size: 22px;
			text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
		}
		.table {
			margin-bottom: 0;
			background: white;
		}
		.table thead {
			background: linear-gradient(90deg, #3498db 0%, #2980b9 100%);
			color: white;
		}
		.table thead th {
			border: none;
			padding: 15px;
			font-weight: 600;
			font-size: 14px;
		}
		.table tbody tr {
			transition: all 0.2s ease;
			border-bottom: 1px solid #eef5f9;
		}
		.table tbody tr:hover {
			background-color: rgba(52, 152, 219, 0.05);
			transform: translateY(-2px);
			box-shadow: 0 3px 10px rgba(0,0,0,0.08);
		}
		.table tbody td {
			padding: 15px;
			vertical-align: middle;
			border-color: #eef5f9;
			font-size: 14px;
		}
		.btn {
			border-radius: 6px;
			padding: 6px 12px;
			font-size: 13px;
			transition: all 0.3s;
			margin: 0 2px;
			border: none;
		}
		.btn-info {
			background: #3498db;
			color: white;
		}
		.btn-info:hover {
			background: #2980b9;
			transform: translateY(-2px);
			box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
		}
		.btn-danger {
			background: #e74c3c;
			color: white;
		}
		.btn-danger:hover {
			background: #c0392b;
			transform: translateY(-2px);
			box-shadow: 0 2px 8px rgba(231, 76, 60, 0.3);
		}
		.btn-primary {
			background: #2ecc71;
			color: white;
		}
		.btn-primary:hover {
			background: #27ae60;
			transform: translateY(-2px);
			box-shadow: 0 2px 8px rgba(46, 204, 113, 0.3);
		}
		.pagination {
			margin: 20px 0 10px;
		}
		.pagination > li > a {
			color: #3498db;
			border: 1px solid #e3e8ed;
			margin: 0 3px;
			border-radius: 4px;
			padding: 8px 15px;
			transition: all 0.3s;
		}
		.pagination > li > a:hover {
			background-color: #3498db;
			color: white;
			border-color: #3498db;
		}
		.pagination > .active > a {
			background-color: #3498db;
			border-color: #3498db;
			color: white;
		}
		.pagination > .disabled > a {
			color: #bdc3c7;
			border-color: #e3e8ed;
		}
		.input-group {
			box-shadow: 0 2px 10px rgba(52, 152, 219, 0.1);
			border-radius: 8px;
			overflow: hidden;
			border: 1px solid #e3e8ed;
		}
		.input-group .form-control {
			border: none;
			padding: 10px 15px;
			height: 44px;
			font-size: 14px;
		}
		.input-group-addon {
			background: #3498db;
			color: white;
			border: none;
			padding: 10px 20px;
			cursor: pointer;
			transition: all 0.3s;
		}
		.input-group-addon:hover {
			background: #2980b9;
		}
		#footer {
			background: #2c3e50;
			color: white;
			padding: 20px 0;
			margin-top: 40px;
			border-top: 3px solid #3498db;
		}
		.badge {
			padding: 4px 8px;
			font-size: 11px;
			font-weight: 500;
			border-radius: 4px;
		}
		.student-id-badge {
			background: #3498db;
			color: white;
		}
		.gender-badge {
			display: inline-flex;
			align-items: center;
			gap: 5px;
		}
		.gender-badge.male {
			color: #3498db;
		}
		.gender-badge.female {
			color: #e84393;
		}
		.date-badge {
			background: #f8f9fa;
			color: #6c757d;
			border: 1px solid #dee2e6;
			padding: 4px 10px;
			border-radius: 4px;
			font-size: 12px;
		}
		.college-badge {
			background: #e8f6f3;
			color: #27ae60;
			padding: 4px 10px;
			border-radius: 4px;
			font-size: 12px;
			border: 1px solid #a3e4d7;
		}
		.btn-group {
			display: flex;
			gap: 5px;
		}
		.btn-group .btn {
			display: flex;
			align-items: center;
			gap: 5px;
		}
		.status-badge {
			display: inline-block;
			padding: 4px 10px;
			border-radius: 12px;
			font-size: 12px;
			font-weight: 500;
		}
		.status-badge.active {
			background: #d4edda;
			color: #155724;
			border: 1px solid #c3e6cb;
		}
		.status-badge.graduate {
			background: #f8f9fa;
			color: #6c757d;
			border: 1px solid #dee2e6;
		}
		/* 消息提示样式 */
		.alert-container {
			margin-bottom: 20px;
		}
		.alert {
			border-radius: 8px;
			border: none;
			box-shadow: 0 3px 10px rgba(0,0,0,0.1);
			padding: 15px 20px;
		}
		.alert-success {
			background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
			color: white;
		}
		.alert-danger {
			background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
			color: white;
		}
		.alert-warning {
			background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
			color: white;
		}
		.alert-info {
			background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
			color: white;
		}
		@media (max-width: 768px) {
			.table-responsive {
				border: none;
			}
			.btn-group {
				flex-direction: column;
				gap: 3px;
			}
			.btn-group .btn {
				width: 100%;
				justify-content: center;
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
			<!-- 消息提示区域 -->
			<c:if test="${not empty message}">
				<div class="alert-container">
					<div class="alert alert-success alert-dismissible fade in" role="alert" id="messageAlert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick="closeAlert()">
							<span aria-hidden="true">&times;</span>
						</button>
						<i class="fas fa-check-circle"></i> ${message}
					</div>
				</div>
			</c:if>

			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="row">
						<h1 class="col-md-5">
							<i class="fas fa-users"></i> 学生名单管理
						</h1>
						<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 10px 0;" action="/admin/selectStudent" id="form1" method="post">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="请输入学生姓名或学号" name="findByName">
								<span class="input-group-addon btn" id="sub">
                                        <i class="fas fa-search"></i> 搜索
                                    </span>
							</div>
						</form>
						<button class="btn btn-primary col-md-2" style="margin: 10px 0; height: 44px;" onClick="location.href='/admin/addStudent'">
							<i class="fas fa-user-plus"></i> 添加学生
						</button>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th>学号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>出生年份</th>
							<th>入学时间</th>
							<th>所属学院</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${studentList}" var="item">
							<tr>
								<td>
                                            <span class="badge student-id-badge">
                                                <i class="fas fa-id-card"></i> ${item.userid}
                                            </span>
								</td>
								<td>
									<strong>${item.username}</strong>
									<c:if test="${item.sex == '男'}">
										<span class="badge" style="background: #3498db; margin-left: 5px;">男</span>
									</c:if>
									<c:if test="${item.sex == '女'}">
										<span class="badge" style="background: #e84393; margin-left: 5px;">女</span>
									</c:if>
								</td>
								<td>
                                            <span class="gender-badge ${item.sex == '男' ? 'male' : 'female'}">
                                                <i class="fas fa-${item.sex == '男' ? 'mars' : 'venus'}"></i>
                                                ${item.sex}
                                            </span>
								</td>
								<td>
                                            <span class="date-badge">
                                                <i class="far fa-calendar-alt"></i>
                                                <fmt:formatDate value="${item.birthyear}" pattern="yyyy-MM-dd" />
                                            </span>
								</td>
								<td>
                                            <span class="date-badge">
                                                <i class="fas fa-graduation-cap"></i>
                                                <fmt:formatDate value="${item.grade}" pattern="yyyy-MM-dd" />
                                            </span>
								</td>
								<td>
                                            <span class="college-badge">
                                                <i class="fas fa-university"></i>
                                                ${item.collegeName}
                                            </span>
								</td>
								<td>
									<c:set var="currentYear" value="<%= java.time.Year.now().getValue() %>" />
									<c:set var="admissionYear">
										<fmt:formatDate value="${item.grade}" pattern="yyyy" />
									</c:set>
									<c:choose>
										<c:when test="${currentYear - admissionYear <= 4}">
                                                    <span class="status-badge active">
                                                        <i class="fas fa-user-graduate"></i> 在读
                                                    </span>
										</c:when>
										<c:otherwise>
                                                    <span class="status-badge graduate">
                                                        <i class="fas fa-user-tie"></i> 已毕业
                                                    </span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<div class="btn-group">
										<button class="btn btn-info btn-sm" onClick="location.href='/admin/editStudent?id=${item.userid}'">
											<i class="fas fa-edit"></i> 编辑
										</button>
										<!-- 修复：将函数参数改为JSP表达式拼接，确保动态值正确传递 -->
										<button class="btn btn-danger btn-sm" onclick="confirmDelete('${item.username}', '${item.userid}')">
											<i class="fas fa-trash"></i> 删除
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="panel-footer">
					<c:if test="${pagingVO != null}">
						<nav style="text-align: center">
							<ul class="pagination">
								<li>
									<a href="/admin/showStudent?page=${pagingVO.upPageNo}">
										<i class="fas fa-chevron-left"></i> 上一页
									</a>
								</li>
								<li class="active">
									<a href="#">${pagingVO.curentPageNo}</a>
								</li>
								<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
									<li>
										<a href="/admin/showStudent?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a>
									</li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
									<li>
										<a href="/admin/showStudent?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a>
									</li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
									<li>
										<a href="/admin/showStudent?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a>
									</li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
									<li>
										<a href="/admin/showStudent?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a>
									</li>
								</c:if>
								<li>
									<a href="/admin/showStudent?page=${pagingVO.totalCount}">
										最后一页 <i class="fas fa-chevron-right"></i>
									</a>
								</li>
							</ul>
						</nav>
					</c:if>
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
	$("#nav li:nth-child(2)").addClass("active");

	// 删除确认函数（修复：确保参数正确接收）
	function confirmDelete(username, userid) {
		if (confirm(`确定要删除学生【${username}】吗？此操作不可恢复！`)) {
			// 修复：拼接正确的请求地址
			location.href = "/admin/removeStudent?id=" + userid;
		}
	}

	// 搜索表单提交
	$("#sub").click(function () {
		$("#form1").submit();
	});

	// 搜索框回车提交
	$("input[name='findByName']").keypress(function(e) {
		if (e.which == 13) {
			$("#form1").submit();
		}
	});

	// 分页样式处理
	<c:if test="${pagingVO != null}">
	if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
		$(".pagination li:last-child").addClass("disabled");
	}

	if (${pagingVO.curentPageNo} == ${1}) {
		$(".pagination li:nth-child(1)").addClass("disabled");
	}
	</c:if>

	// 表格行悬停效果增强
	$(document).ready(function() {
		$('.table tbody tr').hover(
				function() {
					$(this).css('background-color', 'rgba(52, 152, 219, 0.08)');
				},
				function() {
					$(this).css('background-color', '');
				}
		);
	});

	// 消息提示自动隐藏
	$(document).ready(function() {
		// 检查是否有消息
		if ($("#messageAlert").length > 0) {
			// 3秒后自动隐藏成功消息
			setTimeout(function() {
				$("#messageAlert").fadeOut('slow', function() {
					$(this).remove();
				});
			}, 3000);
		}
	});

	// 手动关闭消息
	function closeAlert() {
		$("#messageAlert").fadeOut('slow', function() {
			$(this).remove();
		});
	}

	// 清除session中的消息（避免刷新后重复显示）
	$(document).ready(function() {
		// 页面加载后清除session中的消息
		$.ajax({
			url: '/admin/clearMessage',
			type: 'POST',
			success: function() {
				console.log('消息已清除');
			}
		});
	});
</script>
</html>