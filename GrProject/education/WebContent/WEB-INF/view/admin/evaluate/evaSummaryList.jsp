<%@page import="java.util.ArrayList"%>
<%@page import="com.education.pojo.EvaItem"%>
<%@page import="com.education.pojo.Evaluation"%>
<%@page import="com.education.pojo.CourseArrange"%>
<%@page import="com.education.pojo.Course"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
<%

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
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


			<div class="content">

				<div class="animated fadeIn">

					<div class="row">

						<div class="col-md-12">
				
							<div class="card">
								<div class="card-header">
									<strong class="card-title">评价统计</strong>
									<!--                                   <span class="btn btn-lg btn-outline-secondary float-right" id="addCourseBtn">新增课程</span>  -->
								</div>
								<div class="card-body">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
                                        按教师-课程</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">
                                        按教师-班级</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">
                                        按教师</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
<!--                                         <h3>Home</h3> -->
                                        <%@include file="summary/groupByTeaAndCourse.jsp"%>
                                     </div>
                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
<!--                                         <h3>Profile</h3> -->
									<%@include file="summary/groupByTeaAndClass.jsp"%>
                                    </div>
                                    <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
<!--                                         <h3>Cotanct</h3> -->
									<%@include file="summary/groupByTeacher.jsp"%>
                                    </div>
                                </div>
                            </div>
							</div>
						</div>


					</div>
				</div>
				<!-- .animated -->
			</div>
			<!-- .content -->


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
						Copyright &copy; 2020 Library. </a>
					</div>
					<div class="col-sm-6 text-right">Designed by ZhiYong</div>
				</div>
			</div>
		</footer>
		
		<div class="am-modal am-modal-prompt " tabindex="-1" id="deleteAd"
			style="margin-top: 300px;">
			<div class="am-modal-dialog">
				确认删除该评价？
				<div class="am-modal-hd"></div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" id="makeSure">确认</span> <span
						class="am-modal-btn">取消</span>
				</div>
			</div>
		</div>
		<!-- /.site-footer -->
	</div>
	<!-- /#right-panel -->
	<link rel="stylesheet"
		href="<%=basePath%>static/back/assets/css/lib/datatable/dataTables.bootstrap.min.css">
	<!--Local Stuff-->
	<script
		src="<%=basePath%>static/back/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script src="<%=basePath%>static/back/assets/js/popper.min.js"></script>
	<script src="<%=basePath%>static/back/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/jquery.matchHeight.min.js"></script>
	<script src="<%=basePath%>static/back/assets/js/main.js"></script>


	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/jszip.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script
		src="<%=basePath%>static/back/assets/js/init/datatables-init.js"></script>

	<script type="text/javascript">
     var isClick = 0 ;
     var essayId = 0;
     var data = "";
     $(document).ready(function() {
    	 $('#bootstrap-data-table-export').DataTable();
//     	 $('#bootstrap-data-table-export').DataTable();
    	 
    	 $('#bootstrap-data-table2').DataTable();
    	 $("a[id^='pills']").on('click',function(){
    		console.log($(this).prop("id"));
    		var id = $(this).prop("id").replace("-tab","");
    		console.log("id="+id);
    		$("#"+id).addClass("show");
//     		 $("#"+id).prop("class", $(this).prop("class")+" show")
    		 
    	 });
    	 
//     	 $("#menu3").addClass("active");
    	 var updataMessId = "";
    	 
    	 $("#addCourseBtn").click(function(){
    		 window.location.href = "<%=basePath%>admin/addCourse";
    	 });
    	 
    	 $("a[id^='deleteEvaluationBtn']").click(function(){
    		var id = $(this).prop("id").substring(19);
    		data = "evId="+id;
    		console.log("data="+data);
    	 });
    	 
    	 $("#makeSure").click(function(){
    		
    		 var url = "<%=basePath%>admin/deleteEvaluation";
    			 
    		 $.ajax({
    		       	type : "POST",
    		       	url : url,
    		       	data : data,
    		       	dataType : "json",
    		       	success : function(data){
    		       		if(data.msg=="SUCCESS"){
    		       			alert("删除成功！！");
    		       			window.location = "<%=basePath%>admin/evaluationList";
						} else {
							alert(data.msg);
						}
					}

				});
			});

		});
	</script>
</body>
</html>
