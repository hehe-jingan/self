<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.education.pojo.EvaItem"%>
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
List<EvaItem> evaItem = new ArrayList<EvaItem>();
if(request.getAttribute("evaItem")!=null){
	evaItem = (List<EvaItem>)request.getAttribute("evaItem");
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
							<strong class="card-title">修改评分项</strong>
						</div>
						<div class="card-body">
							<!-- Credit Card -->
							<div id="pay-invoice">
								<div class="card-body col-md-8">
									<form action="#" method="post" novalidate="novalidate"
										id="form5">
										<div class="form-group text-center"></div>
										<% for(int i = 0 ; i< 10;i++){ %>
										
										<div class="form-group input-group" >
											<label for="cc-payment" class="control-label mb-1 col-md-2" >
											<input type="text" id="" name=""
												class="form-control" aria-required="true"
												aria-invalid="false" value="<%=(i+1)%>" disabled="disabled"></label>
												<input name="ids" value="<%=(i+1)%>" type="hidden"/>
											<input type="text" id="" name="content"
												class="form-control col-md-8" aria-required="true"
												aria-invalid="false" value="<%=evaItem.get(i).getIname()%>">
										</div>
										<%} %>
										
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
   	  
   	 $("#makeSure").click(function(){
  		 
   		 if(confirm("确认要修改分项")){
   			 
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>admin/evaItem";
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			     traditional:true,
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("保存成功！！");
   			       			window.location = "<%=basePath%>admin/evaItem";
   			       		}else{
   			       			alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });

   		 }
   		 
   		 
   	 });
   	 
   	 
   	 
   	 
   	 //返回
   	 $("#returnBack").click(function(){
   		window.location = "<%=basePath%>admin/index";
    });
    });
    </script>
</body>
</html>
