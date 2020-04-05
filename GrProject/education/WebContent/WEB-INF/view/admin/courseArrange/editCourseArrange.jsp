<%@page import="com.education.pojo.CourseArrange"%>
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
<%@include file="../model/adminHeader.jsp"%>
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
							<strong class="card-title">修改课程安排信息</strong>
						</div>
						<div class="card-body">
							<!-- Credit Card -->
							<div id="pay-invoice">
								<div class="card-body col-md-3">
									<form action="#" method="post" novalidate="novalidate"
										id="form5">
										<div class="form-group text-center"></div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">班级名称</label>
											<input type="text" id="" name="" disabled="disabled"
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=courseArrange.getCourse().getName()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">教师名字</label>
											<input type="text" id="" name="" disabled="disabled"
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=courseArrange.getTeacher().getName()%>">
										</div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">年度学期</label>
											<input type="text" id="" name="" disabled="disabled"
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=courseArrange.getYear().substring(0,4)+"年度第"+courseArrange.getYear().substring(4,6)+"学期" %>">
										</div>
										<div class="form-group">
											<label for="cc-sex" class="control-label mb-1">是否使用</label> 
											<br/> 
											<select data-placeholder="Choose a Sex..." id="classesUse"
												name="isuse" class="form-control" tabindex="1">
												<option value="1" <%="1".equals(courseArrange.getIsuse())?"selected":"" %>>使用中</option>
												<option value="0" <%="0".equals(courseArrange.getIsuse())?"selected":"" %>>不使用</option>
											</select>
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
    		alert("暂无此班级！！！");
    		window.history.go(-1);
    	}
    	
    	
   	 $("#makeSure").click(function(){
   		 var indexId = "<%=courseArrange.getIndexid()%>";
   			 
   			 if(confirm("确认不使用该课程信息吗？")){
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>admin/editCourseArrange";
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data+"&indexid="+indexId,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("保存成功！！");
   			       			window.location = "<%=basePath%>admin/courseArrangeList";
   			       		}else{
   			       		 	alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
   			 
   		 }
   		 
   	 });
   	 
   	 //返回
   	 $("#returnBack").click(function(){
   		window.location = "<%=basePath%>admin/courseArrangeList";
   	 });
    });
    </script>
</body>
</html>
