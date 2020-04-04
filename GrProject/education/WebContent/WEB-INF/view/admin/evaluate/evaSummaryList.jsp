<%@page import="java.util.ArrayList"%>
<%@page import="com.education.pojo.EvaItem"%>
<%@page import="com.education.pojo.Classes"%>
<%@page import="com.education.pojo.Teacher"%>
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

String type = "";
if (request.getAttribute("type") != null) {
	type = (String) request.getAttribute("type");
}

String chooseYear = "all";
Integer chooseCourse = 0;
Integer chooseClass = 0;
Integer chooseTea = 0;

if (request.getAttribute("chooseCourse") != null) {
	chooseCourse = (Integer) request.getAttribute("chooseCourse");
}
if (request.getAttribute("chooseYear") != null) {
	chooseYear = (String) request.getAttribute("chooseYear");
}
if (request.getAttribute("chooseCl") != null) {
	chooseClass = (Integer) request.getAttribute("chooseCl");
}
if (request.getAttribute("chooseTea") != null) {
	chooseTea = (Integer) request.getAttribute("chooseTea");
}
List<Classes> classLists = new ArrayList<Classes>();
if (request.getAttribute("classLists") != null) {
	classLists = (List<Classes>) request.getAttribute("classLists");
}
List<Teacher> teaLists = new ArrayList<Teacher>();
if (request.getAttribute("teaLists") != null) {
	teaLists = (List<Teacher>) request.getAttribute("teaLists");
}
List<String> yearLists = new ArrayList<String>();
if (request.getAttribute("yearLists") != null) {
	yearLists = (List<String>) request.getAttribute("yearLists");
}
List<Course> courseLists = new ArrayList<Course>();
if (request.getAttribute("courseLists") != null) {
	courseLists = (List<Course>) request.getAttribute("courseLists");
}
// List<Evaluation> list = null;
// if (request.getAttribute("evLists") != null) {
// 	list = (List<Evaluation>) request.getAttribute("evLists");
// }


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

				<div class="animated fadeIn" >

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
                                        <a class="nav-link active" id="pills-home-tab"  data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
                                        年度学期-课程-教师</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">
                                        年度学期-教师</a>
                                    </li>
                                </ul>
                               
                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                        <%@include file="summary/groupByTeaAndCourse.jsp"%>
                                     </div>
                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
									<%@include file="summary/groupByTeaAndClass.jsp"%>
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
    	 $('#bootstrap-data-table3').DataTable();
    	 
    	 var type = "<%=type%>";
    	 
    	 if(type=="1"){
    		 $("#pills-profile").css("visibility","hidden")
				$("#pills-profile").css("display","none")
				
				$("#pills-home").css("visibility","visible")
				$("#pills-home").css("display","block")
//     		 $("#pills-tabContent div:first").tab("show");
<%--     		 window.location.href = "<%=basePath%>admin/evaSummary/1"; --%>
// 				$("#pills-home-tab").addClass("active");
    	 }else if(type == "2"){
//     		 console.log($("#pills-tabContent div:last").prop("id"));
//     		 $("#pills-tabContent div:last").tab("show");
				$("#pills-home").removeClass("show");
				$("#pills-home").removeClass("active");
				$("#pills-home").removeClass("in");
				$("#pills-home").css("visibility","hidden")
				$("#pills-home").css("display","none")
				
				$("#pills-profile").css("visibility","visible")
				$("#pills-profile").css("display","block")
				$("#pills-profile").addClass("show");
				$("#pills-profile").addClass("active");
				$("#pills-profile").addClass("in");
				$("#pills-profile").tab("show");
				$("#pills-home-tab").removeClass("active");
				$("#pills-home-tab").removeClass("in");
				$("#pills-home-tab").removeClass("show");
				$("#pills-profile-tab").addClass("show");
				$("#pills-profile-tab").addClass("active");
				$("#pills-profile-tab").addClass("in");
<%--     		 window.location.href = "<%=basePath%>admin/evaSummary/2"; --%>
    	 }
    	 
    	 
    	 $("a[id^='pills']").on('click',function(){
    		console.log($(this).prop("id"));
    		var id = $(this).prop("id").replace("-tab","");
    		console.log("id="+id);
//     		$("#"+id).addClass("show");
    		if(id=="pills-home"){
    			window.location.href = "<%=basePath%>admin/evaSummary/1/all/0/0/0";
    		}else{
    			window.location.href = "<%=basePath%>admin/evaSummary/2/all/0/0/0";
    		}
//     		 $("#"+id).prop("class", $(this).prop("class")+" show")
    		 
    	 });
    	 
//     	 $("#menu3").addClass("active");
    	 var updataMessId = "";
    	 
    	 var coYear = "<%=chooseYear%>";
    	 var coCourse = "<%=chooseCourse%>";
    	 var chooseTea = "<%=chooseTea%>";
    	 var chooseClass = "<%=chooseClass%>";
    	 
    	 $("#chooseYear").on('change',function(){
     		var val = $(this).val();
     		console.log("val="+val);
     		window.location = "<%=basePath%>admin/evaSummary/"+type+"/"+val+"/"+coCourse+"/"+chooseClass+"/"+chooseTea;
     	 });
     	 
     	 $("#chooseCourse").on('change',function(){
      		var val = $(this).val();
      		console.log("val="+val);
      		window.location = "<%=basePath%>admin/evaSummary/"+type+"/"+coYear+"/"+val+"/"+chooseClass+"/"+chooseTea;
      	 });
     	 $("#chooseClass").on('change',function(){
       		var val = $(this).val();
       		console.log("val="+val);
       		window.location = "<%=basePath%>admin/evaSummary/"+type+"/"+coYear+"/"+coCourse+"/"+val+"/"+chooseTea;
       	 });
     	$("#chooseTea").on('change',function(){
       		var val = $(this).val();
       		console.log("val="+val);
       		window.location = "<%=basePath%>admin/evaSummary/"+type+"/"+coYear+"/"+coCourse+"/"+chooseClass+"/"+val;
       	 });
    	 
    	 
    	 
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
