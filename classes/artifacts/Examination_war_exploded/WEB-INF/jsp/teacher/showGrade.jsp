<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>学生成绩管理</title>
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

		.panel-heading h1 {
			margin: 0;
			font-weight: 600;
			font-size: 24px;
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
			text-align: center;
			vertical-align: middle;
		}

		.table > thead > tr > th {
			background: #fff9f0;
			color: #ff6b35;
			font-weight: 600;
			border-bottom: 2px solid #ff6b35;
		}

		.table > tbody > tr {
			transition: all 0.3s ease;
		}

		.table > tbody > tr:hover {
			background: #fff3e6;
			transform: translateY(-2px);
			box-shadow: 0 3px 10px rgba(255, 107, 53, 0.1);
		}

		.btn-info {
			background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%);
			border: none;
			color: white;
			border-radius: 25px;
			padding: 6px 20px;
			transition: all 0.3s ease;
			font-weight: 500;
			font-size: 14px;
		}

		.btn-info:hover {
			background: linear-gradient(90deg, #e55a2b 0%, #ff7a35 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
			color: white;
		}

		.btn-warning {
			background: linear-gradient(90deg, #f39c12 0%, #e67e22 100%);
			border: none;
			color: white;
			border-radius: 25px;
			padding: 6px 20px;
			transition: all 0.3s ease;
			font-weight: 500;
			font-size: 14px;
		}

		.btn-warning:hover {
			background: linear-gradient(90deg, #d68910 0%, #d35400 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(243, 156, 18, 0.3);
			color: white;
		}

		.btn-success {
			background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%);
			border: none;
			color: white;
			border-radius: 25px;
			padding: 6px 20px;
			transition: all 0.3s ease;
			font-weight: 500;
			font-size: 14px;
		}

		.btn-success:hover {
			background: linear-gradient(90deg, #219653 0%, #27ae60 100%);
			transform: translateY(-2px);
			box-shadow: 0 5px 15px rgba(39, 174, 96, 0.3);
			color: white;
		}

		.btn-xs {
			padding: 5px 15px;
			font-size: 12px;
		}

		.grade-excellent {
			color: #27ae60 !important;
			font-weight: 700;
			font-size: 16px;
		}

		.grade-good {
			color: #f39c12 !important;
			font-weight: 700;
			font-size: 16px;
		}

		.grade-pass {
			color: #3498db !important;
			font-weight: 700;
			font-size: 16px;
		}

		.grade-fail {
			color: #e74c3c !important;
			font-weight: 700;
			font-size: 16px;
		}

		.grade-pending {
			color: #95a5a6 !important;
			font-weight: 500;
			font-style: italic;
		}

		.student-avatar {
			width: 40px;
			height: 40px;
			border-radius: 50%;
			background: linear-gradient(135deg, #ff6b35 0%, #ff8c42 100%);
			color: white;
			display: flex;
			align-items: center;
			justify-content: center;
			font-weight: bold;
			margin: 0 auto;
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

		/* 统计卡片 */
		.stats-card {
			background: white;
			border-radius: 10px;
			padding: 15px;
			margin-bottom: 15px;
			box-shadow: 0 3px 10px rgba(255, 107, 53, 0.1);
			border-left: 4px solid #ff6b35;
		}

		.stats-card h5 {
			color: #2c3e50;
			margin-bottom: 10px;
			font-weight: 600;
		}

		.stats-card .count {
			font-size: 24px;
			font-weight: 700;
			color: #ff6b35;
		}

		.stats-card .label {
			font-size: 12px;
			color: #7f8c8d;
		}

		/* 空状态 */
		.empty-state {
			text-align: center;
			padding: 40px 20px;
			color: #7f8c8d;
		}

		.empty-state i {
			font-size: 48px;
			margin-bottom: 20px;
			color: #ffd4bc;
		}

		.empty-state h4 {
			color: #ff6b35;
			margin-bottom: 10px;
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

			.student-avatar {
				width: 30px;
				height: 30px;
				font-size: 12px;
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
						<h1 class="col-md-12">
							<i class="fas fa-users"></i> 已选该课程学生名单
							<small style="color: #fff3cd; font-size: 16px; margin-left: 10px;">
								${courseName}
							</small>
						</h1>
					</div>
				</div>

				<!-- 统计卡片 -->
				<div class="row" style="padding: 20px 15px 0 15px;">
					<div class="col-md-3">
						<div class="stats-card">
							<h5><i class="fas fa-user-graduate"></i> 总人数</h5>
							<div class="count">${selectedCourseList.size()}</div>
							<div class="label">已选课学生</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="stats-card">
							<h5><i class="fas fa-check-circle"></i> 已评分</h5>
							<div class="count">
								<c:set var="gradedCount" value="0" />
								<c:forEach items="${selectedCourseList}" var="item">
									<c:if test="${item.over}">
										<c:set var="gradedCount" value="${gradedCount + 1}" />
									</c:if>
								</c:forEach>
								${gradedCount}
							</div>
							<div class="label">已完成评分</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="stats-card">
							<h5><i class="fas fa-clock"></i> 待评分</h5>
							<div class="count">
								<c:set var="ungradedCount" value="0" />
								<c:forEach items="${selectedCourseList}" var="item">
									<c:if test="${!item.over}">
										<c:set var="ungradedCount" value="${ungradedCount + 1}" />
									</c:if>
								</c:forEach>
								${ungradedCount}
							</div>
							<div class="label">等待评分</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="stats-card">
							<h5><i class="fas fa-chart-line"></i> 平均分</h5>
							<div class="count">
								<c:set var="totalScore" value="0" />
								<c:set var="gradedCount" value="0" />
								<c:forEach items="${selectedCourseList}" var="item">
									<c:if test="${item.over and item.mark != null}">
										<c:set var="totalScore" value="${totalScore + item.mark}" />
										<c:set var="gradedCount" value="${gradedCount + 1}" />
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${gradedCount > 0}">
										<fmt:formatNumber value="${totalScore / gradedCount}" pattern="0.0"/>
									</c:when>
									<c:otherwise>0.0</c:otherwise>
								</c:choose>
							</div>
							<div class="label">当前平均成绩</div>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th width="8%">#</th>
							<th width="12%">学号</th>
							<th width="15%">姓名</th>
							<th width="15%">分数</th>
							<th width="25%">状态</th>
							<th width="25%">操作</th>
						</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty selectedCourseList}">
								<c:forEach items="${selectedCourseList}" var="item" varStatus="status">
									<tr>
										<td>
											<div class="student-avatar">
													${status.index + 1}
											</div>
										</td>
										<td>
											<strong>${item.studentCustom.userid}</strong>
										</td>
										<td>
											<i class="fas fa-user"></i> ${item.studentCustom.username}
										</td>
										<td class="
													<c:choose>
														<c:when test="${!item.over}">grade-pending</c:when>
														<c:when test="${item.mark >= 90}">grade-excellent</c:when>
														<c:when test="${item.mark >= 80}">grade-good</c:when>
														<c:when test="${item.mark >= 60}">grade-pass</c:when>
														<c:otherwise>grade-fail</c:otherwise>
													</c:choose>
												">
											<c:choose>
												<c:when test="${!item.over}">
													<small>未评分</small>
												</c:when>
												<c:otherwise>
													<strong>${item.mark}</strong>
													<c:if test="${item.mark >= 60}">
														<i class="fas fa-check-circle" style="margin-left: 5px;"></i>
													</c:if>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<c:choose>
												<c:when test="${!item.over}">
															<span class="label label-warning" style="background: #f39c12; padding: 5px 10px; border-radius: 12px;">
																<i class="fas fa-clock"></i> 待评分
															</span>
												</c:when>
												<c:otherwise>
															<span class="label label-success" style="background: #27ae60; padding: 5px 10px; border-radius: 12px;">
																<i class="fas fa-check-circle"></i> 已评分
															</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<div style="display: flex; gap: 10px; justify-content: center;">
												<c:choose>
													<c:when test="${!item.over}">
														<button class="btn btn-warning btn-xs" onClick="location.href='/teacher/mark?studentid=${item.studentid}&courseid=${item.courseid}'">
															<i class="fas fa-edit"></i> 打分
														</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-info btn-xs" onClick="location.href='/teacher/mark?studentid=${item.studentid}&courseid=${item.courseid}'">
															<i class="fas fa-redo"></i> 修改成绩
														</button>
													</c:otherwise>
												</c:choose>
												<button class="btn btn-default btn-xs" onClick="showStudentDetails('${item.studentCustom.username}', '${item.studentCustom.userid}')">
													<i class="fas fa-info-circle"></i> 详情
												</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="empty-state">
										<i class="fas fa-user-slash"></i>
										<h4>暂无学生选择此课程</h4>
										<p>目前还没有学生选择这门课程，请耐心等待学生选课。</p>
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
								<li><a href="/teacher/gradeCourse?page=${pagingVO.upPageNo}&id=${courseId}">&laquo; 上一页</a></li>
								<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
								<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
									<li><a href="/teacher/gradeCourse?page=${pagingVO.curentPageNo+1}&id=${courseId}">${pagingVO.curentPageNo+1}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
									<li><a href="/teacher/gradeCourse?page=${pagingVO.curentPageNo+2}&id=${courseId}">${pagingVO.curentPageNo+2}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
									<li><a href="/teacher/gradeCourse?page=${pagingVO.curentPageNo+3}&id=${courseId}">${pagingVO.curentPageNo+3}</a></li>
								</c:if>
								<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
									<li><a href="/teacher/gradeCourse?page=${pagingVO.curentPageNo+4}&id=${courseId}">${pagingVO.curentPageNo+4}</a></li>
								</c:if>
								<li><a href="/teacher/gradeCourse?page=${pagingVO.totalCount}&id=${courseId}">最后一页 &raquo;</a></li>
							</ul>
						</nav>
					</c:if>

					<div class="row" style="margin-top: 20px;">
						<div class="col-md-12 text-center">
							<button class="btn btn-default" onclick="history.back()" style="background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%); border: none; color: white; padding: 10px 30px;">
								<i class="fas fa-arrow-left"></i> 返回课程列表
							</button>
							<button class="btn btn-default" onclick="exportGrades()" style="background: linear-gradient(90deg, #27ae60 0%, #2ecc71 100%); border: none; color: white; padding: 10px 30px; margin-left: 10px;">
								<i class="fas fa-download"></i> 导出成绩单
							</button>
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

<!-- 学生详情模态框 -->
<div class="modal fade" id="studentDetailModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background: linear-gradient(90deg, #ff6b35 0%, #ff8c42 100%); color: white;">
				<button type="button" class="close" data-dismiss="modal" style="color: white; opacity: 0.8;">&times;</button>
				<h4 class="modal-title"><i class="fas fa-user-graduate"></i> 学生详情</h4>
			</div>
			<div class="modal-body">
				<div id="studentDetailContent">
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
	$("#nav li:nth-child(1)").addClass("active")

	<c:if test="${pagingVO != null}">
	if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
		$(".pagination li:last-child").addClass("disabled")
	};

	if (${pagingVO.curentPageNo} == ${1}) {
		$(".pagination li:nth-child(1)").addClass("disabled")
	};
	</c:if>

	// 显示学生详情
	function showStudentDetails(studentName, studentId) {
		var content = '<div class="student-detail">';
		content += '<h4 style="color: #ff6b35; margin-bottom: 20px;"><i class="fas fa-user-graduate"></i> ' + studentName + '</h4>';
		content += '<div class="detail-item">';
		content += '<p><strong><i class="fas fa-id-card"></i> 学号:</strong> ' + studentId + '</p>';
		content += '<p><strong><i class="fas fa-book"></i> 课程:</strong> ' + '${courseName}' + '</p>';
		content += '</div>';
		content += '<div class="alert alert-info" style="background: #fff9f0; border-color: #ffe8d6; color: #ff6b35; margin-top: 20px;">';
		content += '<i class="fas fa-exclamation-circle"></i> 提示：点击"打分"按钮可以给学生评分';
		content += '</div>';
		content += '</div>';

		$('#studentDetailContent').html(content);
		$('#studentDetailModal').modal('show');
	}

	// 导出成绩单
	function exportGrades() {
		if (confirm('确定要导出本课程的成绩单吗？')) {
			alert('导出功能开发中...');
			// 实际开发中可以调用后端导出接口
			// window.location.href = '/teacher/exportGrades?id=${courseId}';
		}
	}

	// 页面加载完成后的初始化
	$(document).ready(function() {
		// 如果没有学生，显示提示信息
		<c:if test="${empty selectedCourseList}">
		setTimeout(function() {
			alert("温馨提示：暂无学生选择此课程！");
		}, 1000);
		</c:if>
	});
</script>
</html>