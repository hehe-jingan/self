<%@page import="com.education.pojo.CourseArrange"%>
<%@page import="com.education.pojo.Teacher"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.education.pojo.Course"%>
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
<%@include file="../model/stuHeader.jsp"%>
</head>
<% 
String pageFlag = "false";
CourseArrange courseArrange = new CourseArrange();


if(request.getAttribute("courseArrange")!=null){
	courseArrange = (CourseArrange)request.getAttribute("courseArrange");
	 pageFlag = "true";
}


%>
<body>
	<!-- Left Panel -->
	<%@include file="../model/stuMenu.jsp"%>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="../model/stuTitle.jsp"%>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">课程评价</strong>
						</div>
						<div class="card-body">
							<!-- Credit Card -->
							<div id="pay-invoice">
								<div class="card-body col-md-3">
									<form action="#" method="post" novalidate="novalidate"
										id="form5">
										<div class="form-group text-center"></div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">课程名称</label>
											<input type="text" id="" name="" disabled
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=courseArrange.getCourse().getName()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">教师名字</label>
											<input type="text" id="" name="" disabled
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=courseArrange.getTeacher().getName()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">年度</label>
											<input type="text" id="" name=""  disabled
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=courseArrange.getYear().substring(0,4)+"年度第"+courseArrange.getYear().substring(4,6)+"学期" %>">
												
										</div>
										<div class="form-group">
											<label for="cc-sex" class="control-label mb-1">是否开设</label> 
											<br/> 
											<select data-placeholder="请选择是否开设" id="" disabled
												name="" class="form-control" tabindex="1">
												<option value="1" <%="1".equals(courseArrange.getIsuse())?"selected":"" %>>开设中</option>
												<option value="0" <%="0".equals(courseArrange.getIsuse())?"selected":"" %>>不开设</option>
											</select>
										</div>
										<div class="form-group">
											<label for="cc-sex" class="control-label mb-1">评分</label> 
											<br/> 
											<select data-placeholder="请选择评分" id="score" 
												name="score" class="form-control" tabindex="1">
												<option value="10">10</option>
												<option value="9">9</option>
												<option value="8">8</option>
												<option value="7">7</option>
												<option value="6">6</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
											</select>
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">评价</label>
											<input type="text" id="content" name="content" 
												class="form-control" aria-required="true"
												aria-invalid="false" value="">
										</div>
										<br />
										<div>
											<button type="button" id="makeSure"
												class="btn btn-lg btn-info">
												<i class="fa fa-lock fa-lg"></i>&nbsp; <span
													id="payment-button-amount">提交</span>
											</button>
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
				<div class="footer-inner bg-white">
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
    		alert("暂无此课程！！！");
    		window.history.go(-1);
    	}
    	
    	$("#makeSure").click(function(){
   		 var courseId = "<%=courseArrange.getIndexid()%>";
   		 var year =  "<%=courseArrange.getYear()%>";
//    		var content = jQuery("#content").val();

//   		console.log("content="+content);
  		
//   		if(content==""){
//    			 alert("请选择任课老师！");
//    		 }else if(year==""){
//    			alert("请填写开课年度！");
//    		 }else if(year<=1970||year>=2100){
//    			alert("请填写正确的开课年度！范围1970~2100");
//    		 }else{ 
   			 if(confirm("确认要评价吗？")){
   			 var data = decodeURIComponent($("#form5").serialize(),true);
//    			 data = "tid="+tid + "&cid="+courseId+"&year="+year+term;
				data = data+"&caid= "+courseId+"&year="+year;
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>student/studentEvaluate";
   			$ .ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("评价成功！！");
   			       			window.location = "<%=basePath%>student/courseList";
   			       		}else{
   			       		 	alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
   			 
   		 }
   		 
   	 });
   	  
   	 //返回
   	 $("#returnBack").click(function(){
   		window.location = "<%=basePath%>student/courseList";
   	 });
    });
    </script>
</body>
</html>
