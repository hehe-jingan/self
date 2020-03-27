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
				<li class="menu-title">用户模块</li>
				<!-- /.menu-title -->
				<li><a href="<%=basePath%>admin/adminList"> <i
						class="menu-icon fa fa-user"></i>管理员列表
				</a></li>
				<li><a href="<%=basePath%>admin/teacherList"> <i
						class="menu-icon fa fa-users"></i>教师管理
				</a></li>
				<li><a href="<%=basePath%>admin/studentList"> <i
						class="menu-icon fa fa-users"></i>学生管理
				</a></li>
				<li class="menu-title">课程模块</li>
				<!-- /.menu-title -->

				<li><a href="<%=basePath%>admin/classesList"> <i
						class="menu-icon   fa-archive"></i>班级管理
				</a></li>
				<li><a href="<%=basePath%>admin/courseList"> <i
						class="menu-icon  fa-mail-forward (alias)"></i>课程管理
				</a></li>
				<li><a href="<%=basePath%>admin/bookList"> <i
						class="menu-icon fa-book"></i>课程编排
				</a></li>
				<li class="menu-title">评价模块</li>
				<li><a href="<%=basePath%>content/contentList"> <i
						class="menu-icon fa-comments"></i>评价管理
				</a></li>
				<li class="menu-title">个人模块</li>
				<li><a href="<%=basePath%>admin/changePass"> <i
						class="menu-icon fa-book"></i>修改密码
				</a></li>
				<li><a href="<%=basePath%>admin/login?flag=logout"> <i
						class="menu-icon fa-book"></i>退出系统
				</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>