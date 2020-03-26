<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
%>
 <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<%=basePath%>user/index"><i class="menu-icon fa fa-laptop"></i>Library </a>
                    </li>
                    <li class="menu-title">图书管理</li><!-- /.menu-title -->
                    <li>
                        <a href="<%=basePath%>user/bookList"> <i class="menu-icon fa fa-user"></i>图书列表</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/allBorrowBook"> <i class="menu-icon fa fa-users"></i>已借阅图书</a>
                    </li>



                    <li>
                        <a href="<%=basePath%>user/allReNewBook"> <i class="menu-icon  fa-mail-forward (alias)"></i>已续借图书 </a>
                    </li>
                    
                    <li>
                        <a href="<%=basePath%>user/allOnlineBook"> <i class="menu-icon  fa-search"></i>已在线预借图书 </a>
                    </li>
                                        <li class="menu-title">个人模块</li>
                    <li>
                        <a href="<%=basePath%>user/changePass"> <i class="menu-icon fa-book"></i>修改密码 </a>
                    </li>
                    <li>
                        <a href="<%=basePath %>main/login?flag=logout"> <i class="menu-icon fa-book"></i>退出系统 </a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>