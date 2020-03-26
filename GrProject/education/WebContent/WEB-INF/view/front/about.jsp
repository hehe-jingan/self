
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
<!--about start here-->
<div class="about">
  <div class="container">
  	<div class="about-main">
		   <div class="about-top">
			<h2>关于我们</h2>
			<div class="col-md-4 abouttop-left">
				<a href="#"><img src="<%=basePath %>static/front/images/a1.jpg" alt="" class="img-responsive"></a>
			</div>
			<div class="col-md-8 abouttop-right">
				<h4><a href="#">我们旨在提供最贴心的服务</a></h4>
				<p>足不出户就能在线预约，在线续借，提高您的阅读体验.图书馆引进具有国际先进水平的图书馆集成管理系统Sierra和资源发现系统Primo；建成由29台服务器和430TB存储组成的全虚拟化数字图书馆基础硬件平台；引进RFID技术，实现基于RFID的智能化流通管理；采用VPN技术支持读者远程访问，提供无线网络访问和手机图书馆服务，在图书馆外设立移动式自助图书馆，建成泛在式全方位服务体系。</p>
			</div>
			  <div class="clearfix"> </div>
		    </div>
	</div>
	<div class="team">
		 	<h3>我们的团队</h3>
		 	<div class="col-md-3 team-grid">
		 		<img src="<%=basePath %>static/front/images/t1.jpg" alt="" class="img-responsive">
		 	</div>
		 	<div class="col-md-3 team-grid">
		 		<img src="<%=basePath %>static/front/images/t2.jpg" alt="" class="img-responsive">
		 	</div>
		 	<div class="col-md-3 team-grid">
		 		<img src="<%=basePath %>static/front/images/t3.jpg" alt="" class="img-responsive">
		 	</div>
		 	<div class="col-md-3 team-grid">
		 		<img src="<%=basePath %>static/front/images/t4.jpg" alt="" class="img-responsive">
		 	</div>
	   <div class="clearfix"> </div>
	 </div>
	 <div class="history">
	 	<div class="history-top">
	 	    <h3>我们的历史</h3>
	    </div>
	    <div class="history-bottom">
	    	<div class="col-md-4 history-grids">
	    		<h4>2015</h4>
	    		<p>伴随着电子科技大学五十多年的峥嵘岁月，图书馆也在不断积累与发展。通过加强现代数字图书馆建设，业已初步建立起一个以电子信息科学技术为核心，以工为主，理工渗透，理、工、管、文协调发展的特色文献资源保障与服务体系。</p>
	    	</div>
	    	<div class="col-md-4 history-grids">
	    		<h4>2014</h4>
	    		<p>根据工作需要，为了健全和加强领导班子建设，中共成都电讯工程学院委员会（78）党字第21号《关于梁克勤等部分干部任免报告》，向中共成都市委提请部分干部的任免意见报告审查批示。其中包括拟调任成电一系系主任张汝云同志为成电图书馆主任。</p>
	    	</div>
	    	<div class="col-md-4 history-grids">
	    		<h4>2013</h4>
	    		<p>全国高校图工委对可能具备研究级水平的图书馆进行文献调查，经过统计分析，认为电子科技大学图书馆收藏的“电子学与计算机”类图书、文献，完全达到研究级水平。图书馆利用世行贷款购置了大量图书、文献、资料，充实了馆藏。同年9月，经四川省科委批准建立了“电子科技成果查新咨询服务分中心”，这在成都地区高校图书馆中尚属唯一。</p>
	    	</div>
	    	<div class="clearfix"> </div>
	    </div>
	    <div class="history-bottom">
	    	<div class="col-md-4 history-grids">
	    		<h4>2012</h4>
	    		<p>图书馆藏书达115万余册，中外文电类期刊达1200余种。此时的图书馆以电子与信息科学领域文献采集为重点，适当照顾相关学科的文献采集。同时，提高文献管理自动化程度，建成局域网，开发文献资料集成管理系统，改善情报检索手段，与国际国内大型数据库联网，并通过公共信息网与全国大学及科技信息网联网，成为国内一流水平的电子与信息科学文献中心及大学公共信息网西南地区中继站。</p>
	    	</div>
	    	<div class="col-md-4 history-grids">
	    		<h4>2011</h4>
	    		<p>2011年以来，围绕“创新、深入、融合”的核心理念，图书馆全面融入创新型人才培养与学科建设发展体系，深入各院系所，为各单位开展持续服务。和院系合作共建“01空间”、“经管之角”、“英语之角”等主题阅览区；“独立研修室”与学校竞赛组织活动相结合，“团队研修室”服务院系团队；加强数字化建设，引进先进的硬件设施；引入RFID技术，实现智能化管理系统；实现自助借还书服务；建立校内自助图书馆，建设多媒体学习共享空间，用最先进的阅读工具，提供多元化视听享受。从而，扩展服务空间范围，提高服务质量.</p>
	    	</div>
	    	<div class="col-md-4 history-grids">
	    		<h4>2009</h4>
	    		<p>2009年6月，图书馆清水河校区新馆建成并投入使用，建筑面积52000余平方米，作为主馆和沙河校区分馆并行使用。</p>
	    	</div>
	      <div class="clearfix"> </div>
	    </div>
	 </div>
	</div>
</div>
<!--about end here-->
<%@include file="footer.jsp" %>
</body>
</html>