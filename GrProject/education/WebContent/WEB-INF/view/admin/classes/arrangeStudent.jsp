<%@page import="java.util.ArrayList"%>
<%@page import="com.education.pojo.Student"%>
<%@page import="java.util.List"%>
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
Classes classes = new Classes();
List<Student> noClassStudentList= new ArrayList<>();
List<Student> inClassStudentList= new ArrayList<>();
List<Integer> ids= new ArrayList<>();
List<Integer> noClassIds= new ArrayList<>();
if(request.getAttribute("classesInfo")!=null){
	classes = (Classes)request.getAttribute("classesInfo");
	 pageFlag = "true";
}

if(request.getAttribute("studentList")!=null){
	inClassStudentList = (List<Student>)request.getAttribute("studentList");
}
if(request.getAttribute("studentNoClassList")!=null){
	noClassStudentList = (List<Student>)request.getAttribute("studentNoClassList");
}
if(request.getAttribute("noClassIds")!=null){
	noClassIds = (List<Integer>)request.getAttribute("noClassIds");
}
if(request.getAttribute("ids")!=null){
	ids = (List<Integer>)request.getAttribute("ids");
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
							<strong class="card-title">学生安排</strong>
						</div>
						<div class="card-body">
							<!-- Credit Card -->
							<div id="pay-invoice">
							
								<div class="card-body col-md-10">
								<div class="box">
			
			<div class="row">
				<div class="col-md-5 text-center">未分配学生</div>
				<div class="col-md-2"></div>
				
					<div class="col-md-5 text-center">班上学生</div>
			</div>		
			<br/>	
	<div class="box_l"> 
	

	 <% if(noClassStudentList!=null){
                  	for(int i = 0;i<noClassStudentList.size();i++){
                  %>
                  <li id="idsL<%=noClassStudentList.get(i).getIndexid() %>"><%=noClassStudentList.get(i).getName() %> <%=noClassStudentList.get(i).getSex() %> <%=noClassStudentList.get(i).getAge() %>岁 </li> 
                  <%}}
                  	%>
	 
	</div>
	<div class="box_m">
<!-- 		<a href="javascript:" id="top">上移</a> -->
		<a href="javascript:" id="left">向左◁</a>
		<a href="javascript:" id="right">向右▷</a>
<!-- 		<a href="javascript:" id="bottom">下移</a> -->
	</div>
	<div class="box_r">
	 <% if(inClassStudentList!=null){
                  	for(int i = 0;i<inClassStudentList.size();i++){
                  %>
                  <li id="idsR<%=inClassStudentList.get(i).getIndexid() %>" value=""><%=inClassStudentList.get(i).getName() %> <%=inClassStudentList.get(i).getSex() %> <%=inClassStudentList.get(i).getAge() %>岁</li> 
                  <%}}
                  	%>
	</div>
	
	
	
</div>

<!-- 									<form action="#" method="post" novalidate="novalidate" -->
<!-- 										id="form5"> -->
<!-- 										<div class="form-group text-center"></div> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label for="cc-payment" class="control-label mb-1">班级名称</label> -->
<!-- 											<input type="text" id="classesName" name="name" -->
<!-- 												class="form-control" aria-required="true" -->
<%-- 												aria-invalid="false" value="<%=classes.getName()%>"> --%>
<!-- 										</div> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label for="cc-sex" class="control-label mb-1">是否使用</label>  -->
<!-- 											<br/>  -->
<!-- 											<select data-placeholder="Choose a Sex..." id="classesUse" -->
<!-- 												name="isuse" class="form-control" tabindex="1"> -->
<%-- 												<option value="1" <%="1".equals(classes.getIsuse())?"selected":"" %>>使用中</option> --%>
<%-- 												<option value="0" <%="0".equals(classes.getIsuse())?"selected":"" %>>不使用</option> --%>
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 										<br /> -->
<!-- 										<div> -->
<!-- 											<button type="button" id="makeSure" -->
<!-- 												class="btn btn-lg btn-info"> -->
<!-- 												<i class="fa fa-lock fa-lg"></i>&nbsp; <span -->
<!-- 													id="payment-button-amount">提交</span> -->
<!-- 											</button> -->
<!-- 											 <button  type="button" id="returnBack" class="btn btn-lg btn-info "> -->
<!--                                                     <span id="payment-button-amount" >返回</span> -->
<!--                                                 </button> -->
<!-- 										</div> -->
<!-- 									</form> -->
								
								
								</div>
								
								
								
<div> 
											<button type="button" id="makeSure"
												class="btn btn-lg btn-info">
												<i class="fa fa-lock fa-lg"></i>&nbsp; <span
													id="payment-button-amount">保存</span>
											</button>
											 <button  type="button" id="returnBack" class="btn btn-lg btn-info ">
                                                    <span id="payment-button-amount" >返回</span>
                                                </button>
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
		<link rel="stylesheet"  href="<%=basePath %>static/leftToRight/css/orso.css"/>
<script type="text/javascript" src="<%=basePath %>static/leftToRight/js/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="<%=basePath %>static/leftToRight/js/orso.js" ></script>
		<script>
		
    $(document).ready(function() {
    	var classId = "<%=classes.getIndexid() %>";
    	var ids = <%=ids%>;
    	var noClassIds = <%=noClassIds%>;
    	
    	console.log("ids="+ids);
    	console.log("noClassIds="+noClassIds);
    	
    	let idsSet = new Set(ids);
    	let noClassIdsSet = new Set(noClassIds);
    	
    	let deleteIds = new Set();
    	let addIds = new Set();
    	
//     	console.log("set="+set);
//     	console.log("noClassIdsSet="+noClassIdsSet);
    	
    	
    		$(".box").orso({
    			boxl:".box_l",//左边大盒子
    			boxr:".box_r",//右边大盒子
    			boxlrX:"li",//移动小盒子
    			boxon:"on",//点击添加属性
    			idclass:true,//添加的属性是否为class//true=class; false=id;
    			boxlan:"#left",//单个向左移动按钮
    			boxran:"#right",//单个向右移动按钮
//     			boxtan:"#top",//单个向上移动按钮
//     			boxban:"#bottom",//单个向下移动按钮
    			boxalllan:"#allleft",//批量向左移动按钮
    			boxallran:"#allright",//批量向右移动按钮
    			boxalltan:"#alltop",//移动第一个按钮 
    			boxallban:"#allbottom"//移动最后一个按钮
    		})
    	var pageFlag = "<%=pageFlag%>";
    	
    	if(pageFlag == "false"){
    		alert("暂无此班级！！！");
    		window.history.go(-1);
    	}
    	
    	
    	
    	$("li[id^='ids']").bind("dblclick",function(){
    		var className = $(this).parent().prop("class").substring(4);
    		console.log("className="+className);
    		var id = Number($(this).prop("id").substring(4));
    		console.log("id="+id);
    		//如果是右边双击
    		if(className == "r"){
    			console.log("right double click");
    			$(this).prop("id","idsI"+id);
    			//如果之前在未分配中
    			console.log("noClassIdsSet.has(id)="+noClassIdsSet.has(id)); 
    			if(noClassIdsSet.has(id)){
    				console.log("之前已存在左边 所以不变更");
    				addIds.delete(id);
    			}else{
    				console.log("之前不存在左边 所以变更");
    				deleteIds.add(id);
    			}
    		//如果是左边双击
    		}else{
    			console.log("left double click");
    			$(this).prop("id","idsR"+id);
    			//如果之前在班级中
    			if(idsSet.has(id)){
    				console.log("之前已存在右边 所以不变更");
    				deleteIds.delete(id);
    			}else{ 
    				console.log("之前已存在右边 所以不变更");
    				addIds.add(id);
    			}
    		}
    		 
    		for (var x of addIds) { // 遍历Set
    			console.log("addIds="+x);
    		}
    		for (var x of deleteIds) { // 遍历Set
    			console.log("deleteIds="+x);
    		}
    	}); 
    	
    	 //向左按钮
    	$("#left").click(function(){
    		
    		var id = Number($("li[class='on']").prop("id").substring(4));
    		console.log("left click");
    		
    		if(noClassIdsSet.has(id)){
				addIds.delete(id);
			}else{
				deleteIds.add(id);
			}
    		 
    	});
    	
    	 //向右按钮
		$("#right").click(function(){
    		
    		var id = Number($("li[class='on']").prop("id").substring(4));
    		console.log("right click");
    		if(idsSet.has(id)){
				deleteIds.delete(id);
			}else{ 
				addIds.add(id);
			} 
    		
    	});
    	
   	 $("#makeSure").click(function(){
   		 var classesId = "<%=classes.getIndexid()%>";
   		var classesName = $("#classesName").val();
  		 
   		 if(deleteIds.size==0&&addIds.size==0){
   			 alert("没有改动，无需保存！");
   		 }else{ 
   			 
   			 if(confirm("确认要保存该班级的改动吗？")){
   			 var addStr = "";
   			 var deleteStr="";
   			 
   			 for (var x of addIds) { // 遍历Set
   				addStr += x + ","
    		}
    		for (var x of deleteIds) { // 遍历Set
    			deleteStr += x + ","
    		}
    		console.log("addStr="+addStr);
    		console.log("deleteStr="+deleteStr);
    		var data = "addIds="+addStr+"&deleteIds="+deleteStr+"&classesId="+classId;
   			
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>admin/arrangeStudent";
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data+"&indexid="+classesId,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("保存成功！！");
   			       			window.location = "<%=basePath%>admin/arrangeStudent/"+classId;
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
   		window.location = "<%=basePath%>admin/classesList";
   	 });
    });
    </script>
</body>
</html>
