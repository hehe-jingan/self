<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
        <%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
    <%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
    <%@taglib uri="/WEB-INF/fn.tld" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>艾博客</title>
<meta name="description" content="艾博客">
<meta name="keywords" content="index">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="<%=basePath%>static/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=basePath%>static/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="<%=basePath%>static/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="<%=basePath%>static/assets/css/admin.css">
<style type="text/css">
.admin-content { <%--
	background-image: url('<%=basePath%>static/image/backg.jpg');
	--%>
	/* background-size:cover ; */
	/* background-repeat: no-repeat;  */
}
</style>
</head>

<body style="">

	<header class="am-topbar admin-header"> <%@include
		file="header.jsp"%> </header>
	<div class="am-cf admin-main" id="mainView">
		<div class="admin-content">
			<!--   左边 -->
			<div class="am-u-md-6 am-u-md-offset-3 am-fl">
				<!--   左上 -->
				<br /> 
				<div class="am-u-md-9 am-fl">
						 <div class="am-input-group">
						 <form action="<%=basePath%>main/home" method="get" class="am-input-group">
      <span class="am-input-group-btn"> 
        <button class="am-btn am-btn-default" type="submit" id="search"><span class="am-icon-search"></span> </button>
      </span> 
      
      <input  style="background-color:transparent;height: 38px;" type="text" class="am-form-field" placeholder="搜搜想找的文章" id="query" name="query">
      
      <span class="am-input-group-btn">
        <a class="am-btn am-btn-default" id="showDiv" style="margin-left: 50px;">
        <span class="am-icon-edit"></span> 
        </a>
      </span> 
      </form>
    </div>
    
    <br/>
    <c:if test="${messList==null||messList.size()==0 }">
<span>查找不到您所要的文章</span>
</c:if>
<c:if test="${messList!=null&&messList.size()!=0 }">
					<c:forEach items="${messList }" varStatus="status" var="list">
						<div>
							<form action="" id="messForm${list.indexid }">
								<div class="">
									<div class="am-fl">
										<a href="<%=basePath %>user/userMess/${list.userId }"> <img
											alt="user" src="/images/blog/user/${list.image }"
											style="height: 40px; width: 40px;"></a>
									</div>
									<div class="am-fl am-text" style="margin-left: 15px;">
										<a href="<%=basePath %>user/userMess/${list.userId }"> <span>
												${list.username }</span></a> <br /> <span><fmt:formatDate
												value="${list.inputDate }" pattern="MM-dd HH:mm" /></span>
									</div>
									<br /> <br />
								 	<!-- message -->
									<div>
										<span>${list.message }</span>
									</div>

									<div>
										<c:if test="${list.pic!=null && list.pic!=''  }">
											<ul data-am-widget="gallery"
												class="am-gallery am-avg-sm-2  
  am-avg-md-3 am-avg-lg-3 am-gallery-bordered am-gallery-default"
												data-am-gallery="{ pureview: true }">
												<c:forEach items="${list.pic.split(',')}"
													end="${fn:length(list.pic.split(','))-1}" var="img"
													varStatus="status">
													<li>
														<div class="am-gallery-item">
															<a> <img src="/images/blog/message/${img }"
																data-am-modal="{target: '#messageModal', closeViaDimmer: 0, width: 400, height: 125}"
																alt="${status.count }"
																id="imageDetail${list.indexid }${status.count }" />
															</a>
														</div>
													</li>
												</c:forEach>
											</ul>
										</c:if>
									</div>
									<div> 
										<!-- footer --><br>
										<div class="am-btn-group">
											<button type="button"
												class="yr-button am-btn am-btn-default am-round am-icon-thumbs-o-up"
												id="zan${list.indexId }">赞(${list.likes })</button>
											<button type="button"
												class="yr-button am-btn am-btn-default am-radius am-icon-share-square"
												id="share${list.indexId }">转发(${list.share })</button>
											<button type="button"
												class=" yr-button am-btn am-btn-default am-round am-icon-comments-o"
												id="comment${list.indexId }">评论(${list.reply })</button>
										</div>
										<!-- <span>footer</span> -->
									</div>

									<!-- replyList -->
									<div style="visibility: hidden; display: none;"
										id="commentDiv${list.indexId }">
										<div class="am-input-group">
											<br /> <input type="" class="am-form-field"
												placeholder="说点什么吧" id="reply${list.indexId }"
												name="reply${list.indexId }" />
											<button class="am-btn am-btn-default" type="button"
												id="sentReply${list.indexId }">评论</button>

										</div>

										<div id="replyDiv${list.indexId }">
											<!-- <img alt="" src="/images/blog/user/none.png" style="height: 30px;"><a href="#">name</a>: -->
											<!-- <span>repCly123456789</span> -->
											<!-- <br/> -->
											<!-- <span> -->
											<!--   18-04-21 13:22  -->
											<%-- <fmt:formatDate value="2018-04-21 13:33:11" pattern="yy-MM-dd HH:mm"/> --%>
											<!-- </span> -->
											<!-- <a href="#" id="replyDetail20">回复</a> -->
											<!-- <div style="margin-left: 40px;" id="replyChildDiv"> -->
											<!-- <img alt="" src="/images/blog/user/none.png" style="height: 30px;"><a href="#">name</a> 回复<a href="#">22name</a>: -->
											<!-- <span>2</span> -->
											<!-- <br/> -->
											<!-- <span>  -->
											<!--   18-04-21 13:22  -->
											<%-- <fmt:formatDate value="2018-04-21 13:33:11" pattern="yy-MM-dd HH:mm"/> --%>
											<!-- </span> -->
											<!-- <a href="#" id="">回复</a> -->
											<!-- </div> -->

										</div>


									</div>

								</div>
								<div></div>
							</form>
						</div>
						<br /> 
						<hr>
					</c:forEach>
</c:if>
					<br />
					<br /> <br />
					<br /> <br />
					<br />
				</div>


			</div>
<div class="am-u-md-2 am-fl">
<br/><br/><br/>
<div class="">
 
<br/> 
<div style="background-color:transparent;"  class="am-u-sm-centered  am-panel am-panel-secondary">
<br/>
<span class="am-center am-text-center">公告栏</span> 
<hr />
<div class="am-text-center am-u-sm-centered am-center"> 
<span class="am-center am-text-center">${bulletin}</span>
</div>
 
</div> 
		</div>

		<!--   <center><p style="font-family: fantasy;;font-size:60px;font-style: italic;">艾博客</p></center> -->
		<!--    <br/>  <br/>  <br/> -->
		<!--     <br/>  <br/>  <br/> -->
		<!--      <br/>  <br/>  <br/> -->
		<!--       <br/>  <br/>  <br/> -->
	</div>

	<!-- Modal -->
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="messageModal"
		style="margin-top: 300px;">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				<a href="javascript: void(0)" class="am-close am-close-spin"
					data-am-modal-close>&times;</a>
			</div>
			<div class="am-modal-bd">
				<center>
					<img alt="" src="" id="modalImage">
				</center>
			</div>
		</div>
	</div>

	</div>



	<script src="<%=basePath%>static/assets/js/jquery.min.js"></script>
	<script src="<%=basePath%>static/assets/js/amazeui.min.js"></script>
	<script src="<%=basePath%>static/assets/js/app.js"></script>

	<script type="text/javascript">
 

 var messageId = "";
 var headText = "";
 var parentId = "";
 var spare1 = "";

 $(document).ready(function() {
	 
	 $(".yr-button").mouseover(function(){
			$(this).css("background-color","#F56213");
	  });
	  
	  $(".yr-button").mouseout(function(){
			$(this).css("background-color","#e6e6e6");
	  }); 
	 
 	//点赞
 	$("button[id^='zan']").click(function(){
 		needLogin();
 	});
 	
 	 $(".admin-content").css("background-image","url('<%=basePath%>static/image/1.jpg')");
	  $(".admin-content").css("background-size","cover"); 
	  $(".admin-content").css("background-repeat","no-repeat");  
 	//转发
 	$("button[id^='share']").click(function(){
 		needLogin();
 	});
 	
 	$("#showDiv").click(function(){
 		
 		needLogin();
 		
 	});
 	
 	//评论
 	$("button[id^='sentReply']").click(function(){
 		needLogin()
 	});
 	
 	
 	//评论窗口 
 	$("button[id^='comment']").click(function(){
 		needLogin();
 	});
 	  

 $("#sentMessage").click(function(){
 	var message = $("#message").val();
 	var data = "message="+message+"&pic="+filename;
 	var url = "<%=basePath%>user/sendMessage";
 	 $.ajax({
 	       	type : "POST",
 	       	url : url,
 	       	data :data,
 	       	dataType : "json",
 	       	success : function(data){
 	       		if(data.msg=="success"){
 	       			alert("发布成功，请等待管理员审核 ！！");
 	       			window.location = "<%=basePath%>main/index";
 	       		}else{
 	       			alert(data.msg);
 	       		}
 	      	}
 	     			
 	 });
 });



 });

 function needLogin(){
 	var flag = confirm("您还未登录，请先登录！！！");
 	if(flag){
 		window.location = "<%=basePath%>main/login";
			}
		}

		$(document).delegate("a[id^='replyDetailParent']", "click", function() {
			var id = $(this).prop("id").substring(17);
			var text = $("#replyer" + id).html();
			spare1 = $(this).next().prop("id");
			console.log("id=" + id + "  spare1=" + $(this).next().prop("id"));
			var reply = $(this).parent().prev().children("input").eq(0);
			parentId = id;
			messageId = reply.prop("id").substring(5);
			console.log("parentId=" + parentId);
			reply.val("回复  " + text + ": ");
			reply.focus();

			//  		alert(text);
		});

		$(document).delegate(
				"a[id^='replyDetailChlid']",
				"click",
				function() {
					var id = $(this).prop("id").substring(16);
					var text = $("#replyer" + id).html();
					spare1 = $(this).next().prop("id");
					console.log("id=" + id + "  spare1=" + spare1);
					var reply = $(this).parent().parent().prev().children(
							"input").eq(0);
					headText = "回复  " + text + ": ";
					parentId = id;
					messageId = reply.prop("id").substring(5);
					console.log("parentId=" + parentId);
					spare1 = "";
					reply.val(headText);
					reply.focus();
					// 		alert(text);
				});

		function timestampToTime(timestamp) {
			var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
			Y = date.getFullYear() + '-';
			M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
					.getMonth() + 1)
					+ '-';
			D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate())
					+ ' ';
			h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours())
					+ ':';
			m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date
					.getMinutes());
			//      s = date.getSeconds();
			return Y + M + D + h + m;
		}
	</script>
</body>
</html>



