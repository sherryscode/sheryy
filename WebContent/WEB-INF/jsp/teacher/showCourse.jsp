<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>课程信息显示</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

	<style>
		body {
			background-color: #fff9f5;
			font-family: 'Microsoft YaHei', 'Segoe UI', sans-serif;
		}

		#content {
			margin-top: 20px;
			margin-bottom: 40px;
		}

		.panel {
			border: none;
			border-radius: 15px;
			box-shadow: 0 5px 20px rgba(255, 107, 53, 0.1);
			overflow: hidden;
		}

		.panel-heading {
			background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
			color: white;
			border-radius: 15px 15px 0 0;
			padding: 20px;
			border: none;
		}

		.panel-footer {
			background: #fff9f0;
			border-top: 1px solid #ffe8d6;
			padding: 15px;
		}

		.table {
			margin-bottom: 0;
		}

		.table-bordered {
			border: 1px solid #ffd4bc;
		}

		.table-bordered > thead > tr > th,
		.table-bordered > tbody > tr > td {
			border: 1px solid #ffd4bc;
			padding: 15px;
			font-size: 14px;
		}

		.table > thead > tr > th {
			background: #fff9f0;
			color: #ff6b35;
			font-weight: 600;
			border-bottom: 2px solid #ff6b35;
			text-align: center;
		}

		.table > tbody > tr {
			transition: all 0.3s ease;
		}

		.table > tbody > tr:hover {
			background: #fff3e6;
			transform: translateY(-2px);
			box-shadow: 0 3px 10px rgba(255, 107, 53, 0.1);
		}

		.table > tbody > tr > td {
			text-align: center;
			vertical-align: middle;
		}

		.btn-info {
			background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
			border: none;
			color: white;
			border-radius: 25px;
			padding: 6px 20px;
			transition: all 0.3s ease;
			font-weight: 500;
		}

		.btn-info:hover {
			background: linear-gradient(90deg, #e55a2b 0%, #ff7a35 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
			color: white;
		}

		.btn-xs {
			padding: 5px 15px;
			font-size: 12px;
		}

		.input-group {
			margin-top: 5px;
		}

		.input-group .form-control {
			border: 2px solid #ffd4bc;
			border-radius: 8px 0 0 8px;
		}

		.input-group .form-control:focus {
			border-color: #ff6b35;
			box-shadow: none;
		}

		.input-group-addon {
			background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
			border: 2px solid #ff6b35;
			color: white;
			border-radius: 0 8px 8px 0;
			cursor: pointer;
			transition: all 0.3s ease;
		}

		.input-group-addon:hover {
			background: linear-gradient(90deg, #e55a2b 0%, #ff7a35 100%);
		}

		.pagination {
			margin: 10px 0;
		}

		.pagination > li > a {
			color: #ff6b35;
			border: 1px solid #ffd4bc;
			margin: 0 3px;
			border-radius: 5px;
			transition: all 0.3s ease;
			padding: 8px 12px;
		}

		.pagination > li > a:hover {
			background: #ff6b35;
			color: white;
			border-color: #ff6b35;
		}

		.pagination > .active > a,
		.pagination > .active > a:hover,
		.pagination > .active > a:focus {
			background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
			border-color: #ff6b35;
			color: white;
		}

		.pagination > .disabled > a,
		.pagination > .disabled > a:hover,
		.pagination > .disabled > a:focus {
			color: #95a5a6;
			border-color: #ffd4bc;
			background: #f8f9fa;
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

		/* 课程类型标签 */
		.course-type {
			display: inline-block;
			padding: 3px 8px;
			border-radius: 12px;
			font-size: 12px;
			font-weight: 500;
		}

		.course-type-required {
			background: #ffe8d6;
			color: #ff6b35;
			border: 1px solid #ff6b35;
		}

		.course-type-elective {
			background: #fff3cd;
			color: #e67e22;
			border: 1px solid #e67e22;
		}

		.course-type-practical {
			background: #e8f4fc;
			color: #3498db;
			border: 1px solid #3498db;
		}

		/* 学分徽章 */
		.credit-badge {
			background: #ff6b35;
			color: white;
			border-radius: 15px;
			padding: 3px 10px;
			font-size: 12px;
			font-weight: 600;
			display: inline-block;
		}

		/* 响应式调整 */
		@media (max-width: 768px) {
			.table > thead > tr > th,
			.table > tbody > tr > td {
				padding: 10px 5px;
				font-size: 12px;
			}

			.panel-heading h1 {
				font-size: 20px;
			}

			.col-md-10 {
				padding-left: 15px;
			}

			.input-group {
				margin-top: 10px;
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
						<h1 class="col-md-5">我教授的课程</h1>
						<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="/teacher/selectCourse" id="form1" method="post">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="请输入课程名" name="findByName">
								<span class="input-group-addon btn" id="sub">
										<i class="fas fa-search"></i> 搜索
									</span>
							</div>
						</form>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
					<tr>
						<th width="10%">课程号</th>
						<th width="15%">课程名称</th>
						<th width="12%">授课老师编号</th>
						<th width="13%">上课时间</th>
						<th width="12%">上课地点</th>
						<th width="8%">周数</th>
						<th width="10%">课程类型</th>
						<th width="8%">学分</th>
						<th width="12%">操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach  items="${courseList}" var="item">
						<tr>
							<td>${item.courseid}</td>
							<td>${item.coursename}</td>
							<td>${item.teacherid}</td>
							<td>${item.coursetime}</td>
							<td>${item.classroom}</td>
							<td>${item.courseweek}</td>
							<td>
										<span class="course-type
											<c:choose>
												<c:when test="${item.coursetype eq '必修'}">course-type-required</c:when>
												<c:when test="${item.coursetype eq '选修'}">course-type-elective</c:when>
												<c:otherwise>course-type-practical</c:otherwise>
											</c:choose>
										">
												${item.coursetype}
										</span>
							</td>
							<td>
								<span class="credit-badge">${item.score} 学分</span>
							</td>
							<td>
								<button class="btn btn-default btn-xs btn-info" onClick="location.href='/teacher/gradeCourse?id=${item.courseid}'">
									<i class="fas fa-chart-bar"></i> 成绩管理
								</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="panel-footer">
					<c:if test="${pagingVO != null}">
						<nav style="text-align: center">
							<ul class="pagination">
								<li><a href="/teacher/showCourse?page=${pagingVO.upPageNo}">&laquo; 上一页</a></li>
								<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
								<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
									<li><a href="/teacher/showCourse?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
									<li><a href="/teacher/showCourse?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
									<li><a href="/teacher/showCourse?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
									<li><a href="/teacher/showCourse?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
								</c:if>
								<li><a href="/teacher/showCourse?page=${pagingVO.totalCount}">最后一页 &raquo;</a></li>
							</ul>
						</nav>
					</c:if>

					<!-- 统计信息 -->
					<div class="row" style="margin-top: 20px;">
						<div class="col-md-12">
							<div class="well" style="background: #fff9f0; border: 1px solid #ffe8d6; border-radius: 8px; padding: 15px;">
								<div class="row">
									<div class="col-md-4">
										<h5 style="color: #ff6b35; margin-top: 5px;">
											<i class="fas fa-book"></i> 教授课程数:
											<span class="badge" style="background: #ff6b35;">${courseList.size()}</span>
										</h5>
									</div>
									<div class="col-md-8 text-right">
										<!-- 核心修复：跳转至后端接口 -->
										<button class="btn btn-success" style="background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%); border: none;" onClick="location.href='/teacher/addCourse'">
											<i class="fas fa-plus-circle"></i> 添加新课程
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container" id="footer">
	<div class="row">
		<div class="col-md-12">
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
	<%--设置菜单中--%>
	$("#nav li:nth-child(1)").addClass("active")
	<c:if test="${pagingVO != null}">
	if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
		$(".pagination li:last-child").addClass("disabled")
	};

	if (${pagingVO.curentPageNo} == ${1}) {
		$(".pagination li:nth-child(1)").addClass("disabled")
	};
	</c:if>

	function confirmd() {
		var msg = "您真的确定要删除吗？！";
		if (confirm(msg)==true){
			return true;
		}else{
			return false;
		}
	}

	$("#sub").click(function () {
		$("#form1").submit();
	});
</script>
</html>