<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<%=basePath%>admin/index"><i
						class="menu-icon fa fa-laptop"></i>Education </a></li>
<!-- 				<li class="menu-title">用户模块</li> -->
<!-- 				/.menu-title -->
<%-- 				<li><a href="<%=basePath%>admin/adminList"> <i --%>
<!-- 						class="menu-icon fa fa-user"></i>管理员列表 -->
<!-- 				</a></li> -->
<%-- 				<li><a href="<%=basePath%>admin/teacherList"> <i --%>
<!-- 						class="menu-icon fa fa-users"></i>教师管理 -->
<!-- 				</a></li> -->
<%-- 				<li><a href="<%=basePath%>admin/studentList"> <i --%>
<!-- 						class="menu-icon fa fa-users"></i>学生管理 -->
<!-- 				</a></li> -->
				<li class="menu-title">课程模块</li>
				<!-- /.menu-title -->
				
				<li><a href="<%=basePath%>student/courseList"> <i
						class="menu-icon  fa-mail-forward (alias)"></i>我的课程
				</a></li>
<%-- 				<li><a href="<%=basePath%>admin/courseArrangeList"> <i --%>
<!-- 						class="menu-icon fa-book"></i>课程编排 -->
<!-- 				</a></li> -->
				<li class="menu-title">评价模块</li>
				<li><a href="<%=basePath%>student/evaluationList"> <i
						class="menu-icon fa-comments"></i>评价查看
				</a></li>
				<li class="menu-title">个人模块</li>
				<li><a href="<%=basePath%>student/myInfo"> <i
						class="menu-icon   fa-archive"></i>我的信息
				</a></li>
				<li><a href="<%=basePath%>student/changePass"> <i
						class="menu-icon fa-book"></i>修改密码
				</a></li>
				<li><a id="logoutSystem"> <i
						class="menu-icon fa-book"></i>退出系统
				</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>