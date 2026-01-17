<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>已选课程</title>
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
			width: 100%;
		}

		.table-bordered {
			border: 1px solid #e0f2e9;
		}

		.table-bordered > thead > tr > th,
		.table-bordered > tbody > tr > td {
			border: 1px solid #e0f2e9;
			padding: 15px;
			font-size: 14px;
			text-align: center;
			vertical-align: middle;
		}

		.table > thead > tr > th {
			background: #f8fcf9;
			color: #27ae60;
			font-weight: 600;
			border-bottom: 2px solid #27ae60;
		}

		.table > tbody > tr {
			transition: all 0.3s ease;
		}

		.table > tbody > tr:hover {
			background: #f0f9f3;
			transform: translateY(-2px);
			box-shadow: 0 3px 10px rgba(39, 174, 96, 0.1);
		}

		.btn-danger {
			background: linear-gradient(90deg, #e74c3c 0%, #c0392b 100%);
			border: none;
			color: white;
			border-radius: 25px;
			padding: 8px 20px;
			transition: all 0.3s ease;
			font-weight: 500;
			font-size: 14px;
		}

		.btn-danger:hover {
			background: linear-gradient(90deg, #c0392b 0%, #a93226 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(231, 76, 60, 0.3);
			color: white;
		}

		.btn-xs {
			padding: 5px 15px;
			font-size: 12px;
		}

		.btn-danger i {
			margin-right: 5px;
		}

		.empty-course {
			text-align: center;
			padding: 40px 20px;
			color: #7f8c8d;
			font-size: 16px;
		}

		.empty-course i {
			font-size: 48px;
			margin-bottom: 20px;
			color: #bdc3c7;
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

		/* 学分显示样式 */
		.credit-badge {
			background: #27ae60;
			color: white;
			border-radius: 15px;
			padding: 3px 10px;
			font-size: 12px;
			font-weight: 600;
			display: inline-block;
		}

		/* 操作按钮容器 */
		.action-buttons {
			display: flex;
			justify-content: center;
			gap: 10px;
		}

		/* 响应式调整 */
		@media (max-width: 768px) {
			.table-responsive {
				border: none;
			}

			.table > thead > tr > th,
			.table > tbody > tr > td {
				padding: 10px 5px;
				font-size: 12px;
			}

			.btn-danger {
				padding: 5px 10px;
				font-size: 12px;
			}

			.panel-heading h1 {
				font-size: 20px;
			}

			.col-md-10 {
				padding-left: 15px;
			}
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
			background: #e8f6f3;
			color: #27ae60;
			border: 1px solid #27ae60;
		}

		.course-type-elective {
			background: #fef9e7;
			color: #f39c12;
			border: 1px solid #f39c12;
		}

		.course-type-practical {
			background: #ebf5fb;
			color: #3498db;
			border: 1px solid #3498db;
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
						<h1 class="col-md-12">已选课程</h1>
					</div>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th width="10%">课程号</th>
							<th width="15%">课程名称</th>
							<th width="12%">授课老师</th>
							<th width="13%">上课时间</th>
							<th width="12%">上课地点</th>
							<th width="8%">周数</th>
							<th width="10%">课程类型</th>
							<th width="8%">学分</th>
							<th width="12%">操作</th>
						</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty selectedCourseList}">
								<c:forEach items="${selectedCourseList}" var="item">
									<%--输出还没修完的课程--%>
									<c:if test="${!item.over}">
										<tr>
											<td>${item.couseCustom.courseid}</td>
											<td>${item.couseCustom.coursename}</td>
											<td>${item.couseCustom.teacherid}</td>
											<td>${item.couseCustom.coursetime}</td>
											<td>${item.couseCustom.classroom}</td>
											<td>${item.couseCustom.courseweek}</td>
											<td>
														<span class="course-type
															<c:choose>
																<c:when test="${item.couseCustom.coursetype eq '必修'}">course-type-required</c:when>
																<c:when test="${item.couseCustom.coursetype eq '选修'}">course-type-elective</c:when>
																<c:otherwise>course-type-practical</c:otherwise>
															</c:choose>
														">
																${item.couseCustom.coursetype}
														</span>
											</td>
											<td>
												<span class="credit-badge">${item.couseCustom.score} 学分</span>
											</td>
											<td>
												<div class="action-buttons">
													<button class="btn btn-danger btn-xs" onClick="confirmWithdrawal('${item.couseCustom.coursename}', '${item.couseCustom.courseid}')">
														<i class="fas fa-trash-alt"></i> 退课
													</button>
													<button class="btn btn-default btn-xs" onClick="showCourseDetails('${item.couseCustom.coursename}', '${item.couseCustom.coursetime}', '${item.couseCustom.classroom}')">
														<i class="fas fa-info-circle"></i> 详情
													</button>
												</div>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9" class="empty-course">
										<i class="fas fa-book-open"></i>
										<h4>暂无已选课程</h4>
										<p>您还没有选择任何课程，快去 <a href="/student/showCourse" style="color: #27ae60; font-weight: bold;">选课中心</a> 选择课程吧！</p>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div>

				<div class="panel-footer">
					<c:if test="${pagingVO != null}">
						<nav style="text-align: center">
							<ul class="pagination">
								<li><a href="/student/selectedCourse?page=${pagingVO.upPageNo}">&laquo; 上一页</a></li>
								<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
								<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
									<li><a href="/student/selectedCourse?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
									<li><a href="/student/selectedCourse?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
									<li><a href="/student/selectedCourse?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
									<li><a href="/student/selectedCourse?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
								</c:if>
								<li><a href="/student/selectedCourse?page=${pagingVO.totalCount}">最后一页 &raquo;</a></li>
							</ul>
						</nav>
					</c:if>

					<!-- 统计信息 -->
					<div class="row" style="margin-top: 20px;">
						<div class="col-md-12">
							<div class="well" style="background: #f8fcf9; border: 1px solid #e8f5e9; border-radius: 8px; padding: 15px;">
								<div class="row">
									<div class="col-md-3">
										<h5 style="color: #27ae60; margin-top: 5px;">
											<i class="fas fa-book"></i> 已选课程数:
											<span class="badge" style="background: #27ae60;">${selectedCourseCount}</span>
										</h5>
									</div>
									<div class="col-md-3">
										<h5 style="color: #27ae60; margin-top: 5px;">
											<i class="fas fa-star"></i> 总学分:
											<span class="badge" style="background: #2ecc71;">${totalCredits}</span>
										</h5>
									</div>
									<div class="col-md-6 text-right">
										<a href="/student/showCourse" class="btn btn-success" style="background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%); border: none;">
											<i class="fas fa-plus-circle"></i> 继续选课
										</a>
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

<!-- 课程详情模态框 -->
<div class="modal fade" id="courseDetailModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%); color: white;">
				<button type="button" class="close" data-dismiss="modal" style="color: white; opacity: 0.8;">&times;</button>
				<h4 class="modal-title"><i class="fas fa-info-circle"></i> 课程详情</h4>
			</div>
			<div class="modal-body">
				<div id="courseDetailContent">
					<!-- 详情内容将通过JS动态填充 -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	<%--设置菜单中--%>
	$("#nav li:nth-child(2)").addClass("active")

	<c:if test="${pagingVO != null}">
	if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
		$(".pagination li:last-child").addClass("disabled")
	};

	if (${pagingVO.curentPageNo} == ${1}) {
		$(".pagination li:nth-child(1)").addClass("disabled")
	};
	</c:if>

	// 确认退课函数
	function confirmWithdrawal(courseName, courseId) {
		if (confirm("您确定要退选《" + courseName + "》这门课程吗？")) {
			location.href = '/student/outCourse?id=' + courseId;
		}
	}

	// 显示课程详情
	function showCourseDetails(courseName, courseTime, classroom) {
		var content = '<div class="course-detail">';
		content += '<h4 style="color: #27ae60; margin-bottom: 20px;"><i class="fas fa-book"></i> ' + courseName + '</h4>';
		content += '<div class="detail-item">';
		content += '<p><strong><i class="fas fa-clock"></i> 上课时间:</strong> ' + courseTime + '</p>';
		content += '<p><strong><i class="fas fa-map-marker-alt"></i> 上课地点:</strong> ' + classroom + '</p>';
		content += '</div>';
		content += '<div class="alert alert-info" style="background: #f8fcf9; border-color: #e8f5e9; color: #27ae60; margin-top: 20px;">';
		content += '<i class="fas fa-exclamation-circle"></i> 提示：退课前请确保了解退课相关政策';
		content += '</div>';
		content += '</div>';

		$('#courseDetailContent').html(content);
		$('#courseDetailModal').modal('show');
	}

	// 页面加载完成后的初始化
	$(document).ready(function() {
		// 添加表格行悬停效果
		$('.table tbody tr').hover(
				function() {
					$(this).css('cursor', 'pointer');
				},
				function() {
					$(this).css('cursor', 'default');
				}
		);

		// 如果没有已选课程，显示提示信息
		<c:if test="${empty selectedCourseList}">
		setTimeout(function() {
			alert("温馨提示：您还没有选择任何课程，请前往选课中心选择课程！");
		}, 1000);
		</c:if>
	});
</script>
</html>