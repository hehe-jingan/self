
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
<title>图书馆首页</title>
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
<div class="banner">
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
		 <div class="banner-bottom">
		 	<div class="bann-para">
		 	<h2>在线图书馆</h2>
		 	<p>书中自有颜如玉，书中自有黄金屋。本站为您提供在线阅读、在线续借、简便的借书还书流程。</p>
		   </div>
		   <a href="<%=basePath %>main/login">登陆</a>
		 </div>
	</div>
</div>
<!--header strat here-->
<!--welcome start here-->
<div class="welcome">
	<div class="container">
		<div class="wel-main">
		  <div class="wel-top">
			<h3>欢迎来到在线图书馆</h3>
	      </div>
	      <div class="wel-bottom">
	      	  <div class="col-md-6 wel-left">
	      	  	 <div class="wel-block">
		      	  	 <div class="wel-img">
		      	  	 	<img src="<%=basePath %>static/front/images/w6.jpg" alt="" class="img-responsive">
		      	  	 </div>
		      	  	 <div class="wel-text">
		      	  	 	<h4>在线阅读</h4>
		      	  	 	<p>遇到想看的书，但是又不想出门，加入我们马上体验足不出户的看书体验。</p>
		      	  	 </div>
		      	   <div class="clearfix"> </div>
	      	    </div>
	      	    <div class="wel-block">
		      	  	 <div class="wel-img">
		      	  	 	<img src="<%=basePath %>static/front/images/w2.jpg" alt="" class="img-responsive">
		      	  	 </div>
		      	  	 <div class="wel-text">
		      	  	 	<h4>在线借书</h4>
		      	  	 	<p>怕赶到图书馆，心心念的书被别人借走了？加入我们可以在线预约，再也不用担心被人捷足先登。</p>
		      	  	 </div>
		      	   <div class="clearfix"> </div>
	      	    </div>
	      	  </div>
	      	  <div class="col-md-6 wel-right">
	      	  	 <div class="wel-block">
		      	  	 <div class="wel-img">
		      	  	 	<img src="<%=basePath %>static/front/images/w3.jpg" alt="" class="img-responsive">
		      	  	 </div>
		      	  	 <div class="wel-text">
		      	  	 	<h4>热门书籍</h4>
		      	  	 	<p>我们会根据每周、每月的借阅记录，统计出每个时间段的热门书籍，可以摆脱选择困难症。</p>
		      	  	 </div>
		      	   <div class="clearfix"> </div>
	      	    </div>
	      	  	 <div class="wel-block">
		      	  	 <div class="wel-img">
		      	  	 	<img src="<%=basePath %>static/front/images/w5.jpg" alt="" class="img-responsive">
		      	  	 </div>
		      	  	 <div class="wel-text">
		      	  	 	<h4>在线续借</h4>
		      	  	 	<p>图书到期，但是不想出门怎么办？不用担心，我们提供在线续借功能，可以让您继续徜徉在书海之中。</p>
		      	  	 </div>
		      	   <div class="clearfix"> </div>
	      	    </div>
	      	   <div class="clearfix"> </div>
	      	  </div>
	      	<div class="clearfix"> </div>
	      </div>
		</div>
	</div>
</div>
<!--welcome end here-->
<!--testimonial start here-->
<div class="testimo">
	<div class="container">
		<div class="testimo-main">
			<h3>在线完成以往的繁琐操作</h3>
			<p>我们提供多样化的功能，旨在提高用户的借阅体验，通过改善用户体验，让各位用户体验到全方位的舒适服务。</p>
		</div>
	</div>
</div>
<!--testimonial end here-->
<!--our admissions start here-->
<div class="admission">
	<div class="container">
		<div class="admissions-main">
			<div class="admission-top">
				<h3>读者声音</h3>
			</div>
			<div class="admission-bottom">
				<div class="col-md-6 admission-left">
					<span class="quot1"> </span>
					<div class="quot-text">
						<p>在线图书馆大大解决了我们的困惑，虽然我们也想走出门去借书，但怎奈出行条件受限，在线续借真是很好的功能！！</p>
					    <h4>来自一位深度懒癌患者</h4>
					</div>
				 <div class="clearfix"> </div>
				</div>
				<div class="col-md-6 admission-left">
					<span class="quot1"> </span>
					<div class="quot-text">
						<p>在这里我可以找到各式各样的书籍，再也不怕书荒，没书可看。每次看看热门推荐总是能找到合心水的书，很棒！</p>
					    <h4>来自一位资深阅读者</h4>
					</div>
				  <div class="clearfix"> </div>
				</div>
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
<!--our admissions end here-->
<!--course strat here-->
<div class="course">
	<div class="col-md-6 course-left">
		
	</div>
	<div class="col-md-6 course-right">
		<h3>共同进步</h3>
		<p>网站的建设离不开用户的支持，只有倾听使用者的声音，才能使网站更丰富，我们愿意提升用户的使用体验。请单击下面的按钮，联系我们！</p>
	    <a href="<%=basePath %>main/contact">联系我们</a>
	</div>
   <div class="clearfix"> </div>
</div>
<!--courses end here-->
<%@include file="footer.jsp" %>
</body>
</html>