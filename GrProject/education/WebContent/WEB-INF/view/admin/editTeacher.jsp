<%@page import="com.education.pojo.Teacher"%>
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
<%@include file="model/adminHeader.jsp"%>
</head>
<% 
String pageFlag = "false";
Teacher teacher = new Teacher();

if(request.getAttribute("teacherInfo")!=null){
	teacher = (Teacher)request.getAttribute("teacherInfo");
	 pageFlag = "true";
}

%>
<body>
	<!-- Left Panel -->
	<%@include file="model/adminMenu.jsp"%>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="model/adminTitle.jsp"%>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">修改教师信息</strong>
						</div>
						<div class="card-body">
							<!-- Credit Card -->
							<div id="pay-invoice">
								<div class="card-body col-md-3">
									<form action="#" method="post" novalidate="novalidate"
										id="form5">
										<div class="form-group text-center"></div>
										<div class="form-group">
											<label for="cc-payment" class="control-label mb-1">姓名</label>
											<input type="text" id="teacherName" name="name"
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=teacher.getName()%>">
										</div>
										<div class="form-group has-success">
											<label for="cc-age" class="control-label mb-1">年龄</label> <input
												type="number" id="teacherAge" name="age" value="<%=teacher.getAge()%>"
												class="form-control cc-name valid" data-val="true"
												data-val-required="Please enter the name on card"
												autocomplete="cc-name" aria-required="true"
												aria-invalid="false" aria-describedby="cc-name"> <span
												class="help-block field-validation-valid"
												data-valmsg-for="cc-age" data-valmsg-replace="true"></span>
										</div>
										<div class="form-group">
											<label for="cc-sex" class="control-label mb-1">性别</label> 
											<br/> 
											<select data-placeholder="Choose a Sex..." id="teacherSex"
												name="sex" class="form-control" tabindex="1">
												<option value="男" <%="男".equals(teacher.getSex())?"selected":"" %>>男</option>
												<option value="女" <%="女".equals(teacher.getSex())?"selected":"" %>>女</option>
											</select>
										</div>
										<div class="form-group">
											<label for="cc-email" class="control-label mb-1">邮箱</label>
											<input type="text" id="teacherEmail" name="email"
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=teacher.getEmail()%>">
										</div>
										<div class="form-group">  <div class="form-check-inline form-check">
                                        <label for="cc-pass" class="control-label mb-1">是否在职</label>
                                        <br/>
                                                <label for="inline-radio1" class="form-check-label ">
                                                    <input type="radio" id="onJob1" name="onjob" value="1" class="form-check-input" <%="1".equals(teacher.getOnjob())?"checked":"" %>>在职
                                                </label> 
                                                <label for="inline-radio2" class="form-check-label ">
                                                    <input type="radio" id="onJob2" name="onjob" value="0" class="form-check-input" <%="0".equals(teacher.getOnjob())?"checked":"" %>>离职
                                                </label>
                                        </div>
                                    </div>
										<div class="form-group has-success">
											<label for="cc-pass" class="control-label mb-1">登录密码</label>
											<input type="password" id="teacherPass" name="pass"
												class="form-control cc-name valid" data-val="true"
												data-val-required="Please enter the name on card"
												autocomplete="cc-name" aria-required="true"
												aria-invalid="false" aria-describedby="cc-name"> <span
												class="help-block field-validation-valid"
												data-valmsg-for="cc-pass" data-valmsg-replace="true"></span>
										</div>
										<div class="form-group">
											<label for="cc-conPass" class="control-label mb-1">确认密码</label>
											<input type="password" id="confirmPass" name="confirmPass"
												class="form-control cc-number identified visa" value=""
												data-val="true"
												data-val-required="Please enter the card number"
												data-val-cc-number="Please enter a valid card number">
											<span class="help-block" data-valmsg-for="cc-conPass"
												data-valmsg-replace="true"></span>
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
    		alert("暂无此教师！！！");
    		window.history.go(-1);
    	}
    	
   	 $("#makeSure").click(function(){
   		 var teacherId = "<%=teacher.getIndexid()%>";
   		var teacherName = $("#teacherName").val();
   		 var teacherAge = $("#teacherAge").val();
   		var teacherEmail = $("#teacherEmail").val();
   		 var teacherSex = $("#teacherSex").val();
  		 var teacherPass = $("#teacherPass").val();
  		 var confirmPass = $("#confirmPass").val();
  		 
   		 if(teacherName==""){
   			 alert("请输入教师姓名！");
   		 }else if(teacherAge==""){
   			 alert("请输入教师年龄！");
   		 }else if((teacherAge<1||teacherAge>120)){
   				 alert("请输入正确的年龄！！！");
   		 }else if(teacherEmail == ""){
   			alert("请输入邮箱！！！");
   		 }else if(!/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/.test(teacherEmail)){
   			alert("请输入正确的邮箱格式！！！");
   		 }else if(teacherPass==""){
   			 alert("请输入密码！");
   		 }else if(confirmPass==""){
   			 alert("请输入确认密码！");
   		 }else if(confirmPass!=teacherPass){
   			 alert("输入密码与确认密码不一致！");
   		 }else{ 
   			 
   			 if(confirm("确认要修改该教师信息吗？")){
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>admin/updateTeacher";
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data+"&indexid="+teacherId,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("修改成功！！");
   			       			window.location = "<%=basePath%>admin/teacherList";
   			       		}else{
   			       		 	alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
   			 
   			 }
   		 }
   		 
   		 
   		 
   	 });
   	 
   	 
   	 
   	 
   	 //返回
   	 $("#returnBack").click(function(){
   		window.location = "<%=basePath%>admin/teacherList";
   	 });
    });
    </script>
</body>
</html>
