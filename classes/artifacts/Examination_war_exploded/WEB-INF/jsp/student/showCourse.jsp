<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>课程信息显示</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<!-- 引入FontAwesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

	<style>
		body {
			background-color: #f5f9f7;
			font-family: 'Microsoft YaHei', 'Segoe UI', sans-serif;
		}

		#content {
			margin-top: 20px;
			margin-bottom: 40px;
		}

		.panel {
			border: none;
			border-radius: 15px;
			box-shadow: 0 5px 20px rgba(39, 174, 96, 0.1);
			overflow: hidden;
		}

		.panel-heading {
			background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%);
			color: white;
			border-radius: 15px 15px 0 0;
			padding: 20px;
			border: none;
		}

		.panel-heading h1 {
			margin: 0;
			font-weight: 600;
			font-size: 24px;
		}

		.panel-footer {
			background: #f8fcf9;
			border-top: 1px solid #e8f5e9;
			padding: 15px;
		}

		.table {
			margin-bottom: 0;
		}

		.table-bordered {
			border: 1px solid #e0f2e9;
		}

		.table-bordered > thead > tr > th,
		.table-bordered > tbody > tr > td {
			border: 1px solid #e0f2e9;
			padding: 15px;
			font-size: 14px;
		}

		.table > thead > tr > th {
			background: #f8fcf9;
			color: #27ae60;
			font-weight: 600;
			border-bottom: 2px solid #27ae60;
			text-align: center;
		}

		.table > tbody > tr {
			transition: all 0.3s ease;
		}

		.table > tbody > tr:hover {
			background: #f0f9f3;
			transform: translateY(-2px);
			box-shadow: 0 3px 10px rgba(39, 174, 96, 0.1);
		}

		.table > tbody > tr > td {
			text-align: center;
			vertical-align: middle;
		}

		.btn-info {
			background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%);
			border: none;
			color: white;
			border-radius: 25px;
			padding: 6px 20px;
			transition: all 0.3s ease;
			font-weight: 500;
		}

		.btn-info:hover {
			background: linear-gradient(90deg, #219653 0%, #27ae60 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(39, 174, 96, 0.3);
			color: white;
		}

		.btn-xs {
			padding: 5px 15px;
			font-size: 12px;
		}

		.pagination {
			margin: 10px 0;
		}

		.pagination > li > a {
			color: #27ae60;
			border: 1px solid #e0f2e9;
			margin: 0 3px;
			border-radius: 5px;
			transition: all 0.3s ease;
			padding: 8px 12px;
		}

		.pagination > li > a:hover {
			background: #27ae60;
			color: white;
			border-color: #27ae60;
		}

		.pagination > .active > a,
		.pagination > .active > a:hover,
		.pagination > .active > a:focus {
			background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%);
			border-color: #27ae60;
			color: white;
		}

		.pagination > .disabled > a,
		.pagination > .disabled > a:hover,
		.pagination > .disabled > a:focus {
			color: #95a5a6;
			border-color: #e0f2e9;
			background: #f8f9fa;
		}

		#footer {
			margin-top: 30px;
			padding: 20px 0;
			background: #f8fcf9;
			border-top: 1px solid #e8f5e9;
			color: #27ae60;
			text-align: center;
		}

		.col-md-10 {
			padding-left: 30px;
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
						<h1 class="col-md-12">课程列表</h1>
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
							<td>${item.coursetype}</td>
							<td>${item.score}</td>
							<td>
								<button class="btn btn-default btn-xs btn-info" onClick="location.href='/student/stuSelectedCourse?id=${item.courseid}'">
									<i class="fas fa-plus-circle"></i> 选课
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
								<li><a href="/student/showCourse?page=${pagingVO.upPageNo}">&laquo; 上一页</a></li>
								<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
								<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
									<li><a href="/student/showCourse?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
									<li><a href="/student/showCourse?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
									<li><a href="/student/showCourse?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
									<li><a href="/student/showCourse?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
								</c:if>
								<li><a href="/student/showCourse?page=${pagingVO.totalCount}">最后一页 &raquo;</a></li>
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