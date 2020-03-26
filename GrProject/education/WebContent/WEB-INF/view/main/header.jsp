<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
    <%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
    <%
    String userLoginFlag2 = "";
	if(request.getSession().getAttribute("user")==null){
		userLoginFlag2 = "false";
	}else{
		userLoginFlag2 = "true";
	}
	System.out.println("登录状态2："+userLoginFlag2);
    %>
  <div class="am-topbar-brand">
    <strong>IBlog</strong> <small>艾博客</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-tabs am-topbar-nav am-topbar-right admin-header-list">
  <% if(userLoginFlag2!="false"){ %>     
  <li id="menu1"  style="background-color:transparent;"><a style="color: black;" href="<%=basePath %>main/index"><span class="am-icon-home"></span> 首页</a></li>
      <li id="menu2" style="background-color:transparent;"><a style="color: black;" href="<%=basePath %>user/userMess/${user.indexid}"><span class="am-icon-table"></span>我的博客</a></li>
      <li id="menu3"  style="background-color:transparent;"><a style="color: black;" href="<%=basePath %>album/allAlbum"><span class="am-icon-file"></span>我的相册</a></li>
      <li id="menu4" style="background-color:transparent;"><a style="color: black;" href="<%=basePath%>user/changePass"><span class="am-icon-pencil-square-o"></span>修改密码</a></li>
      <li id="menu5" style="background-color:transparent;"><a style="color: black;" href="<%=basePath %>main/login?flag=logout"><span class="am-icon-sign-out"></span>退出登录</a></li>
  <%} %>
  
   <li id="menu6"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    
</ul>
  </div>
  
  
