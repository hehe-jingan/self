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

List<EvaItem> evaItem = new ArrayList<EvaItem>();
if (request.getAttribute("evaItem") != null) {
	evaItem = (List<EvaItem>) request.getAttribute("evaItem");
}
	List<Evaluation> list = null;
	if (request.getAttribute("evLists") != null) {
		list = (List<Evaluation>) request.getAttribute("evLists");
	}
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
									<strong class="card-title">评价列表</strong>
									<!--                                   <span class="btn btn-lg btn-outline-secondary float-right" id="addCourseBtn">新增课程</span>  -->
								</div>
								<div class="card-body">
									<table id="bootstrap-data-table"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>编号</th>
												<th>课程名称</th>
												<th>任课教师</th>
												<th>学年学期</th>
												<th>评价学生</th>
												<th>评分</th>
												<th>评价内容</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<%
												if (list != null) {
													for (int i = 0; i < list.size(); i++) {
														String year = list.get(i).getYear();
											%>
											<tr>
												<td><%=i + 1%></td>
												<td><%=list.get(i).getCourse().getName()%></td>
												<td><%=list.get(i).getTeacher().getName()%></td>
												<td><%=year.substring(0, 4) + "年度第" + year.substring(4, 6) + "学期"%></td>
												<td><%=list.get(i).getStudent().getName()%></td>
												<td><a  href="#" id="spare<%=list.get(i).getSpare1() %>" data-am-modal="{closeOnConfirm	: false,target: '#showEvaItem', closeViaDimmer: 0, width: 400, height: 125}"><%=list.get(i).getScore()%> </a></td>
												<td><%=list.get(i).getContent()%></td>
												<td><a href="<%=basePath%>admin/adminEvaluate/<%=list.get(i).getIndexid()%>" >编辑</a>
												<a href="#" id="deleteEvaluationBtn<%=list.get(i).getIndexid() %>" data-am-modal="{closeOnConfirm	: false,target: '#deleteAd', closeViaDimmer: 0, width: 400, height: 125}">删除</a>
												</td>
<%-- 													<a href="#" id="deleteCourseBtn<%=list.get(i).getIndexid()%>" --%>
<!-- 													data-am-modal="{closeOnConfirm	: false,target: '#deleteAd', closeViaDimmer: 0, width: 400, height: 125}">删除</a> -->
											</tr>
											<%
												}
												}
											%>
										</tbody>
									</table>
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
		<div class="am-modal am-modal-prompt " tabindex="-1" id="showEvaItem"
			style="margin-top: 300px;">
			<div class="am-modal-dialog">
				<div class="form-group col-md-11">
											<label for="cc-payment" class="control-label mb-1">分项评分</label>
										<div><label> </label> </div>

											<%
												for (int i = 0; i < 10; i++) {
													
											%>
											<div class="form-group input-group">
												<!-- 											<label for="cc-payment" class="control-label mb-1 col-md-2" > -->
												<input type="text" id="" name=""
													class="form-control col-md-1" aria-required="true"
													aria-invalid="false" value="<%=(i + 1)%>" disabled="disabled"></label>
												<%-- 												<input name="ids" value="<%=(i+1)%>" type="hidden"/> --%>
												<input type="text" id="" name="content" class="form-control"
													aria-required="true" aria-invalid="false"
													value="<%=evaItem.get(i).getIname()%>" disabled="disabled">
												<div class="form-group">
													<!-- 											<label for="cc-sex" class="control-label mb-1">评分</label>  -->
													<!-- 											<br/>  -->
													<select data-placeholder="请选择评分" disabled="disabled"
														id="scores<%=evaItem.get(i).getIndexid()%>" name="scores" class="form-control" tabindex="1">
														<% for(int j = 10 ; j>=1; j--){
															%>
														<option id="evaItem<%=i+""+j%>" value="<%=j==10?0:j%>"><%=j%></option>
														<%} %>
													</select>
												</div>
											</div>
											<%
												}
											%>
										</div>
				<div class="am-modal-hd"></div>
				<div class="am-modal-footer">
					 <span class="am-modal-btn">返回</span>
				</div>
			</div>
		</div>
		
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
    	 
    	 $("a[id^='spare']").on("click",function(){
    		 resetEva();
    		 var evaitem = $(this).prop("id").substring(5);
    		 for(i=0;i<10;i++){
    			 for(j = 10 ; j>=1; j--){
    				 var x = Number(evaitem.charAt(i)+"");
						x = (x==0?10:x);
						if(x == j){
							 $("#evaItem"+i+""+j).prop("selected","selected");
						}
    			 }
    			 
    		 }
    		 
    	 });
    	 
    	 function resetEva(){
    		 for(i=0;i<10;i++){
    			 $("#evaItem"+i).prop("selected","");
    		 }
    	 }
    	 
    	 
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
