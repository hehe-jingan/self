
<%@page import="com.book.pojo.Book"%>
<%@page import="java.util.List"%>
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
<%
List<Book> lists = null;
if(request.getAttribute("lists")!=null){
	lists = (List<Book>)request.getAttribute("lists");
}
System.out.println("lists="+lists);
%>
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

<!--about start here-->
<div class="about">
  <div class="container">
  	<div class="about-main">
		   <div class="about-top">
			<h2>热门图书</h2>
	</div>
	<div class="team">
		 	<h3>热门图书</h3>
		 	<%if(lists!=null){
		 		int n = lists.size()>4?4:lists.size();
		 		System.out.println("n="+n);
		 		for(int i =0;i<n;i++){%>
		 	<div class="col-md-3 team-grid">
		 	<a href="#">
		 		<img src="<%=basePath %>../book/image/<%=lists.get(i).getPicurl() %>" alt="" width="255px" style="height:288px;" class="img-responsive" >
		 	</a></div>
		 	<%}} %>
	   <div class="clearfix"> </div>
	 </div>
	</div>
</div>
<!--about end here-->
<%@include file="footer.jsp" %>
</body>
</html>