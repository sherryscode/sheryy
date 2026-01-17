<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>教师管理</title>
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
			transition: all 0.2s;
			border-bottom: 1px solid #eef5f9;
		}
		.table tbody tr:hover {
			background-color: rgba(52, 152, 219, 0.05);
			transform: translateY(-1px);
			box-shadow: 0 2px 8px rgba(0,0,0,0.05);
		}
		.table tbody td {
			padding: 15px;
			vertical-align: middle;
			border-color: #eef5f9;
		}
		.btn {
			border-radius: 6px;
			padding: 6px 12px;
			font-size: 13px;
			transition: all 0.3s;
			margin: 0 2px;
		}
		.btn-info {
			background: #3498db;
			color: white;
			border: none;
		}
		.btn-info:hover {
			background: #2980b9;
			transform: translateY(-2px);
			box-shadow: 0 2px 8px rgba(52, 152, 219, 0.3);
		}
		.btn-danger {
			background: #e74c3c;
			color: white;
			border: none;
		}
		.btn-danger:hover {
			background: #c0392b;
			transform: translateY(-2px);
			box-shadow: 0 2px 8px rgba(231, 76, 60, 0.3);
		}
		.btn-primary {
			background: #2ecc71;
			color: white;
			border: none;
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
		}
		.input-group .form-control {
			border: none;
			padding: 12px 15px;
			height: 46px;
		}
		.input-group-addon {
			background: #3498db;
			color: white;
			border: none;
			padding: 12px 20px;
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
			background: #e74c3c;
			padding: 4px 8px;
			font-size: 11px;
			font-weight: 400;
		}
		.gender-icon {
			display: inline-block;
			width: 24px;
			height: 24px;
			border-radius: 50%;
			text-align: center;
			line-height: 24px;
			font-size: 12px;
			margin-right: 5px;
		}
		.gender-icon.male {
			background: #3498db;
			color: white;
		}
		.gender-icon.female {
			background: #e84393;
			color: white;
		}
		.date-badge {
			background: #95a5a6;
			color: white;
			padding: 3px 8px;
			border-radius: 4px;
			font-size: 12px;
		}
		.degree-badge {
			display: inline-block;
			padding: 3px 10px;
			border-radius: 20px;
			font-size: 12px;
			font-weight: 500;
		}
		.degree-badge.本科 {
			background: #d6eaf8;
			color: #2980b9;
			border: 1px solid #85c1e9;
		}
		.degree-badge.硕士 {
			background: #d5f4e6;
			color: #27ae60;
			border: 1px solid #82e0aa;
		}
		.degree-badge.博士 {
			background: #fadbd8;
			color: #c0392b;
			border: 1px solid #f1948a;
		}
		.title-badge {
			display: inline-block;
			padding: 3px 10px;
			border-radius: 4px;
			font-size: 12px;
			font-weight: 500;
			margin: 2px;
		}
		.title-badge.普通教师 {
			background: #f8f9fa;
			color: #6c757d;
			border: 1px solid #dee2e6;
		}
		.title-badge.助教 {
			background: #fff3cd;
			color: #856404;
			border: 1px solid #ffeaa7;
		}
		.title-badge.讲师 {
			background: #d1ecf1;
			color: #0c5460;
			border: 1px solid #bee5eb;
		}
		.title-badge.副教授 {
			background: #d4edda;
			color: #155724;
			border: 1px solid #c3e6cb;
		}
		.title-badge.教授 {
			background: #cce5ff;
			color: #004085;
			border: 1px solid #b8daff;
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
						<h1 class="col-md-5">
							<i class="fas fa-chalkboard-teacher"></i> 教师名单管理
						</h1>
						<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 10px 0;" action="/admin/selectTeacher" id="form1" method="post">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="请输入教师姓名或工号" name="findByName">
								<span class="input-group-addon btn" onclick="document.getElementById('form1').submit()" id="sub">
										<i class="fas fa-search"></i>
									</span>
							</div>
						</form>
						<button class="btn btn-primary col-md-2" style="margin: 10px 0; height: 46px;" onClick="location.href='/admin/addTeacher'">
							<i class="fas fa-user-plus"></i> 添加教师
						</button>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
					<tr>
						<th>教师编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>出生年份</th>
						<th>学历</th>
						<th>职称</th>
						<th>入职年份</th>
						<th>学院</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${teacherList}" var="item">
						<tr>
							<td><span class="badge" style="background: #3498db;">${item.userid}</span></td>
							<td><strong>${item.username}</strong></td>
							<td>
										<span class="gender-icon ${item.sex == '男' ? 'male' : 'female'}">
											<i class="fas fa-${item.sex == '男' ? 'mars' : 'venus'}"></i>
										</span>
									${item.sex}
							</td>
							<td><span class="date-badge"><fmt:formatDate value="${item.birthyear}" dateStyle="medium" /></span></td>
							<td><span class="degree-badge ${item.degree}">${item.degree}</span></td>
							<td><span class="title-badge ${item.title}">${item.title}</span></td>
							<td><span class="date-badge"><fmt:formatDate value="${item.grade}" dateStyle="medium" /></span></td>
							<td><span style="color: #2c3e50;">${item.collegeName}</span></td>
							<td>
								<div class="btn-group">
									<button class="btn btn-info btn-sm" onClick="location.href='/admin/editTeacher?id=${item.userid}'">
										<i class="fas fa-edit"></i> 编辑
									</button>
									<button class="btn btn-danger btn-sm" onClick="if(confirm('确定要删除教师【${item.username}】吗？')) location.href='/admin/removeTeacher?id=${item.userid}'">
										<i class="fas fa-trash"></i> 删除
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="panel-footer">
					<c:if test="${pagingVO != null}">
						<nav style="text-align: center">
							<ul class="pagination">
								<li><a href="/admin/showTeacher?page=${pagingVO.upPageNo}">&laquo; 上一页</a></li>
								<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
								<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
									<li><a href="/admin/showTeacher?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
									<li><a href="/admin/showTeacher?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
									<li><a href="/admin/showTeacher?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
									<li><a href="/admin/showTeacher?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
								</c:if>
								<li><a href="/admin/showTeacher?page=${pagingVO.totalCount}">最后一页 &raquo;</a></li>
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
	$("#nav li:nth-child(3)").addClass("active")

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