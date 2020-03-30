<%@page import="com.education.pojo.CourseArrange"%>
<%@page import="com.education.pojo.ClassArrange"%>
<%@page import="com.education.pojo.Classes"%>
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
<%@include file="../model/adminHeader.jsp"%>
</head>
<%
	String pageFlag = "false";

	CourseArrange ca = new CourseArrange();
	List<Classes> classList = new ArrayList<>();
	List<Classes> classNoList = new ArrayList<>();

	if (request.getAttribute("courseArrangeInfo") != null) {
		ca = (CourseArrange) request.getAttribute("courseArrangeInfo");
		pageFlag = "true";
	}

	if (request.getAttribute("classList") != null) {
		classList = (List<Classes>) request.getAttribute("classList");
	}

	if (request.getAttribute("classNoList") != null) {
		classNoList = (List<Classes>) request.getAttribute("classNoList");
	}

%>
<body>
	<!-- Left Panel -->
	<%@include file="../model/adminMenu.jsp"%>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="../model/adminTitle.jsp"%>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">分配班级课程</strong>
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
												aria-invalid="false" value="<%=ca.getCourse().getName()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">教师</label>
											<input type="text" id="" name="" disabled
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=ca.getTeacher().getName()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">课程名称</label>
											<input type="text" id="" name="" disabled
												class="form-control" aria-required="true"
												aria-invalid="false"
												value="<%=ca.getYear().substring(0, 4) + "年度第" + ca.getYear().substring(4, 6) + "学期"%>">
										</div>
										<div class="form-group">
											<label for="cc-sex" class="control-label mb-1">是否开设</label> <br />
											<select data-placeholder="请选择是否开设" id="" disabled
												name="isUse" class="form-control" tabindex="1">
												<option value="1"
													<%="1".equals(ca.getIsuse()) ? "selected" : ""%>>开设中</option>
												<option value="0"
													<%="0".equals(ca.getIsuse()) ? "selected" : ""%>>不开设</option>
											</select>
										</div>

										<div class="form-group">
											<label for="cc-sex" class="control-label mb-1">排课班级</label> <br />
											<select data-placeholder="请选择一个课室" id="cid" multiple
												name="cid" class="form-control standardSelect " tabindex="1">
												<option value="" label="default"></option>
												<%
													if (classList != null) {
														for (int i = 0; i < classList.size(); i++) {
												%>
												<option selected value="<%=classList.get(i).getIndexid()%>"><%=classList.get(i).getName()%></option>
												<%
													}
													}
												%>
												<%
													if (classNoList != null) {
														for (int i = 0; i < classNoList.size(); i++) {
												%>
												<option value="<%=classNoList.get(i).getIndexid()%>"><%=classNoList.get(i).getName()%></option>
												<%
													}
													}
												%>

											</select>
										</div>
										<br />
										<div>
											<button type="button" id="makeSure"
												class="btn btn-lg btn-info">
												<i class="fa fa-lock fa-lg"></i>&nbsp; <span
													id="payment-button-amount">提交</span>
											</button>
											<button type="button" id="returnBack"
												class="btn btn-lg btn-info ">
												<span id="payment-button-amount">返回</span>
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
	<link rel="stylesheet"
		href="<%=basePath%>static/assets/css/chosen/chosen.min.css">
	<script src="<%=basePath%>static/assets/js/chosen/chosen.jquery.min.js"></script>
	<script src="<%=basePath%>static/assets/js/chosen/main.js"></script>



	<script>
		
		jQuery(document).ready(function() {
   	  
		if(pageFlag == "false"){
	    	alert("暂无此课程！！！");
	    	window.history.go(-1);
	   	}
    	var pageFlag = "<%=pageFlag%>";
    	
    	
    	jQuery(".standardSelect").chosen({
            disable_search_threshold: 1,
            no_results_text: "找不到该教师信息！",
            width: "100%"
        });
    	
    	
    	
    	jQuery("#makeSure").click(function(){
   		 var caId = "<%=ca.getIndexid()%>";
//    		var tid = jQuery("#tid").val();
//    		var year = jQuery("#year").val();
//   		var term = jQuery("#term").val();

//   		console.log("tid="+tid);
//   		console.log("year="+year);
//   		console.log("term="+term);
  		
//   		if(tid==""){
//    			 alert("请选择任课老师！");
//    		 }else if(year==""){
//    			alert("请填写开课年度！");
//    		 }else if(year<=1970||year>=2100){
//    			alert("请填写正确的开课年度！范围1970~2100");
//    		 }else{ 
   			 if(confirm("确认要安排课程给该教师吗？")){
   			 var data = decodeURIComponent(jQuery("#form5").serialize(),true);
   			 data = data+"&coaId="+caId;
   			 console.log("data= "+data);
   			 
   			 var url = "<%=basePath%>admin/arrangeClasses";
   			jQuery .ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			    	 traditional:true,
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("安排成功！！");
   			       			window.location = "<%=basePath%>admin/courseArrangeList";
   			       		}else{
   			       		 	alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
   			 
   			 }
//    		 }
   		 
   	 });
   	  
   	 //返回
   	 jQuery("#returnBack").click(function(){
   		window.location = "<%=basePath%>admin/courseArrangeList"
   	 });
    });
    </script>
</body>
</html>