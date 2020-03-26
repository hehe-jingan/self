<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
    <%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
        <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String userLoginFlag = "";
	if(request.getSession().getAttribute("user")==null){
		userLoginFlag = "false";
	}else{
		userLoginFlag = "true";
	}
	System.out.println("登录状态："+userLoginFlag);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>艾博客</title>
  <meta name="description" content="艾博客">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="<%=basePath %>static/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="<%=basePath %>static/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
<style type="text/css">
.admin-content{
<%-- background-image:url('<%=basePath%>static/image/backg.jpg'); --%>
/* background-size:cover ; */
/* background-repeat: no-repeat;  */
}
</style>
</head>

<body style="">  
 
<header class="am-topbar admin-header">
  <%@include file="header.jsp" %>
</header>
<%--   <%@include file="menu.jsp" %> --%>
<div class="am-cf admin-main" id="mainView" >
 
 
</div>


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!-- [if (gte IE 9)|!(IE)]><! -->
<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="<%=basePath %>static/assets/js/app.js"></script>

 <script type="text/javascript">
 var userIsLoginFlag = "<%=userLoginFlag%>";
  $(document).ready(function() {
	  $("#mainView").html($("#hiddenMainView").html());
	  
	  $(".yr-button").mouseover(function(){
			$(this).css("background-color","#F56213");
	  });
	  
	  $(".yr-button").mouseout(function(){
			$(this).css("background-color","#e6e6e6");
	  });
	  
	  $(".yr-delete-button").mouseover(function(){
			$(this).css("background-color","red");
	  });
	  $(".yr-delete-button").mouseout(function(){
			$(this).css("background-color","#e6e6e6");
	  });
  	  
	  if(userIsLoginFlag=="false"){
		  alert("请重新登录！！");
		  window.location.href = "<%=basePath%>main/login";
	  }  
	  
// 	  $("input").css("background-color:transparent;");
<%-- 	  $(".admin-content").css("background-image","url('<%=basePath%>static/image/1.jpg')"); --%>
// 	  $(".admin-content").css("background-size","percentage");   
// 	  $(".admin-content").css("background-repeat","repeat-y"); 
  });
  </script>
</body>
</html>