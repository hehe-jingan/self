<%@page import="com.education.pojo.Supervisor"%>
<%@page import="com.education.pojo.Teacher"%>
<%@page import="com.education.pojo.Student"%>
<%@page import="com.education.pojo.Classes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>教育后台管理</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="model/superHeader.jsp"%>
</head>
<% 
String pageFlag = "false";
Supervisor userInfo = new Supervisor();

if(request.getAttribute("userInfo")!=null){
	userInfo = (Supervisor)request.getAttribute("userInfo");
	 pageFlag = "true";
}

%>
<body>
	<!-- Left Panel -->
	<%@include file="model/superMenu.jsp"%>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="model/superTitle.jsp"%>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">个人信息</strong>
						</div>
						<div class="card-body">
							<!-- Credit Card -->
							<div id="pay-invoice">
								<div class="card-body col-md-3">
									<form action="#" method="post" novalidate="novalidate"
										id="form5">
										<div class="form-group text-center"></div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">督导号</label>
											<input type="text" id="" name="" disabled
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=userInfo.getSpare1()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">姓名</label>
											<input type="text" id="" name="" disabled
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=userInfo.getName()%>">
										</div>
										<br />
										<div>
<!-- 											<button type="button" id="makeSure" -->
<!-- 												class="btn btn-lg btn-info"> -->
<!-- 												<i class="fa fa-lock fa-lg"></i>&nbsp; <span -->
<!-- 													id="payment-button-amount">提交</span> -->
<!-- 											</button> -->
											 <button  type="button" id="returnBack" class="btn btn-lg btn-info ">
                                                    <span id="payment-button-amount" >返回</span>
                                                </button>
										</div>
									</form>
								</div>
							</div>

						</div>
					</div>
					<!-- .card -->

				</div>
				<!--/.col-->


				<!-- Animated -->
				<!--             <br/><br/><br/><br/> -->
				<!--             <br/><br/><br/><br/> -->
				<!--             <br/><br/><br/><br/> -->
				<!--             <br/><br/><br/><br/> -->
				<!--             <br/><br/> -->
				<!-- .animated -->
			</div>
			<!-- /.content -->
			<div class="clearfix"></div>
			<!-- Footer -->
			<footer class="site-footer">
				<div class="footer-inner">
					<div class="row">
						<div class="col-sm-6">
							Copyright &copy; 2020 Education. </a>
						</div>
						<div class="col-sm-6 text-right">Designed by ZhiYong</div>
					</div>
				</div>
			</footer>
			<!-- /.site-footer -->
		</div>
		<!-- /#right-panel -->
</div>
		<!--Local Stuff-->
		<script>
    $(document).ready(function() {
   	  
    	var pageFlag = "<%=pageFlag%>";
    	
    	if(pageFlag == "false"){
    		alert("暂无此督导！！！");
    		window.history.go(-1);
    	}
    	
   	 $("#makeSure").click(function(){
   		 var classesId = "";
   			 
   			 if(confirm("确认要修改邮箱吗？")){
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>teacher/updateEmail";
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data+"&indexid="+classesId,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("修改成功！！");
   			       			window.location = "<%=basePath%>admin/classesList";
   			       		}else{
   			       		 	alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
   			 
   			 }
   		 
   	 });
   	 
   	 //返回
   	 $("#returnBack").click(function(){
   		window.location = "<%=basePath%>supervisor/index";
   	 });
    });
    </script>
</body>
</html>
