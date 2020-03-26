
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";%>
<!DOCTYPE HTML>
<html>
<head>
<title>图书馆首页-关于</title>
<link href="<%=basePath %>static/front/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=basePath %>static/front/js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="<%=basePath %>static/front/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Training Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Asap:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Kreon:400,700,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="<%=basePath %>static/front/js/move-top.js"></script>
<script type="text/javascript" src="<%=basePath %>static/front/js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<!-- //end-smoth-scrolling -->
<script src="<%=basePath %>static/front/js/bootstrap.min.js"></script>
</head>
<body>
<!--header start here-->
<div class="banner1">
	<div class="container">
		<div class="header">
			<div class="col-md-7 logo">
				<a href="<%=basePath %>main/index"><h1>Library</h1></a>
			</div>
			<div class="col-md-5 details">
				<div class="addre">
					<span class="location"> </span>
					  <div class="detail-para">
						<p>广州大学华软软件学院</p>				
					  </div>
					<div class="clearfix"> </div>
				</div>
				<div class="addre ad-para">
					<span class="tel-ph"> </span>
					 <div class="detail-para">					
						<p><a href="#">hualing@scse.com</a></p>
					  </div> 
					  <div class="clearfix"> </div>
				</div>
				<div class="addre addres-mes">
					<span class="mess"> </span>
					 <div class="detail-para">
						<p>+8612345678901</p>					
					  </div>
					<div class="clearfix"> </div>
				</div>
			  <div class="clearfix"> </div>
			</div>
		  <div class="clearfix"> </div>
		</div>
		<div class="top-nav">
			<div class="navbar-header">
	   			 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
                </button>
              </div>
	   			<div id="navbar" class="navbar-collapse collapse">
	              <ul class="nav navbar-nav">
	                 <li class="home"><a href="<%=basePath %>main/index">首页</a></li>
	                  <li class=""><a href="<%=basePath %>main/Introduction">简介</a></li>
					  <li class=""><a href="<%=basePath %>main/about">关于</a></li>
					  <li class=""><a href="<%=basePath %>main/online">热门图书</a></li>
					  <li class=""><a href="<%=basePath %>main/contact">联系我们</a></li>	         
	              </ul>
	            </div>
			</div>
	</div>
</div>
<!--header strat here-->

<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="col-md-6 contact-left">
				<div class="contact-top">
					<h2>联系信息</h2>
					<p>可以通过以下方式联系我们</p>
			    </div>
				<div class="conta-1">
					<div class="con-phone">
						<span class="con-ph"> </span>
						<div class="con-para">
							<h6>手机</h6>
							<p>+86 020 87818918</p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="conta-2">
					<div class="con-address">
						<span class="con-location"> </span>
						<div class="con-para">
							<h6>地址</h6>
							<p>广东省广州市从化区经济开发区高技术产业园广从南路548号</p>
						</div>
					</div>
				</div>
			 </div>
			<div class="col-md-6 contact-right">
				<div class="contact-top">
					<h3>留言</h3>
					<p>欢迎留言，给我们提供宝贵的意见和建议。</p>
				</div>
				<form id="form5">
						<input type="text" id="name" name="name"  class="shart" placeholder="请输入姓名" >
					 	<input type="email" id="mail" name="mail" class="shart" placeholder="请输入邮箱" >
					 	<input type="text" id="title" name="title" class="long" placeholder="请输入标题" >
				         <textarea placeholder="请输入留言"  value="" id="message" name="message" ></textarea>
                        <input type="button" id="makeSure" value="提交">
				</form>
				</div>
		  <div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--contact end here-->
<script>
    
    $(document).ready(function() {
    	
   	 $("#makeSure").click(function(){
   		var name = $("#name").val();
   		var mail = $("#mail").val();
   		 var title = $("#title").val();
   		 var message = $("#message").val();
   		
   		 if(name==""){
   			 alert("请输入姓名！");
   		 }else if(mail==""){
   			 alert("请输入邮箱！");
   		 }else if(mail.search(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/)){
   			 alert("请输入正确格式的邮箱");
   		 }else if(title==""){
   			 alert("请输入标题！");
   		 }else if(message==""){
   			 alert("请输入留言内容！");
   		 }else{ 
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>content/addContent";
   			 
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("留言成功！！");
   			       			window.location.reload();
   			       		}else{
   			       			alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
   			 
   			 
   		 }
   		 
   		 
   		 
   	 });
   	 
    });
    </script>
<%@include file="footer.jsp" %>
</body>
</html>