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
List<CourseArrange> list = null;
    if(request.getAttribute("courseArrangeList")!=null){
    	list = (List<CourseArrange>)request.getAttribute("courseArrangeList");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>教育后台管理</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <%@include file="../model/adminHeader.jsp" %>
  <link rel="stylesheet" href="<%=basePath %>static/tooltip.css"/>
</head>

<body>
    <!-- Left Panel -->
   <%@include file="../model/adminMenu.jsp" %>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <%@include file="../model/adminTitle.jsp" %>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
        

        <div class="content">
        
            <div class="animated fadeIn">
            
                <div class="row">

                    <div class="col-md-12">
                   
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">课程安排列表</strong>
<!--                                   <span class="btn btn-lg btn-outline-secondary float-right" id="addCourseBtn">新增课程</span>  -->
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>课程名称</th>
                                            <th>教师名字</th>
                                            <th>学年学期</th>
                                            <th>是否开设中</th>
                                            <th>已分配班级数量</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <% if(list!=null){
                  	for(int i = 0;i<list.size();i++){
                  		String year = list.get(i).getYear();
                  %>
                                        <tr>
                                            <td><%=i+1 %></td>
                                            <td><%=list.get(i).getCourse().getName() %></td>
                                            	<td><%=list.get(i).getTeacher().getName() %></td>
                                             		<td><%=year.substring(0,4)+"年度第"+year.substring(4,6)+"学期" %></td>
                                             		 <td><%="0".equals(list.get(i).getIsuse())?"不开设":"开设中" %></td>
                                             		  <td><a href="#" id="hideClass<%=list.get(i).getIndexid() %>" ><%=list.get(i).getClcount() %></a>
                                             		  <input id="hiddenClassName<%=list.get(i).getIndexid() %>" name="<%=list.get(i).getConcatclname() %>"  type="hidden" disabled="disabled"  />
                                             		  </td>
                                             <td>
                                              <a href="<%=basePath%>admin/editCourseArrange/<%=list.get(i).getIndexid()%>" >编辑</a>
                                              <%if("1".equals(list.get(i).getIsuse())){ %>
                                              <a href="<%=basePath%>admin/arrangeClasses/<%=list.get(i).getIndexid()%>" >安排班级</a>
                                              <%}else{ %>
                                              <a href="#">课程未开设</a>
                                              <%} %>
                                             <a href="#" id="deleteCourseArrangeBtn<%=list.get(i).getIndexid() %>" data-am-modal="{closeOnConfirm	: false,target: '#deleteAd', closeViaDimmer: 0, width: 400, height: 125}">删除</a>
                                        </tr>
                                        <%}
                  	} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
             <div class="sufee-alert alert with-close alert-primary alert-dismissible fade" id="hideDiv">
                                        <span class="badge badge-pill badge-primary"></span>
                                        该课程包含班级:<span id="hideSpan" ></span>
                                        <button type="button" class="close" id="hideBtn">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
        </div><!-- .content -->
        
        
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
                    <div class="col-sm-6 text-right"> Designed by ZhiYong
                    </div>
                </div>
            </div>
        </footer>
        <div class="am-modal am-modal-prompt " tabindex="-1" id="deleteAd"
	style="margin-top: 300px;">
	<div class="am-modal-dialog">确认删除该课程安排？
		<div class="am-modal-hd"></div>
		<div class="am-modal-footer">
			<span class="am-modal-btn" id="makeSure">确认</span> 
				<span class="am-modal-btn" >取消</span> 
		</div>
	</div>
</div>
 
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <!--Local Stuff-->
   
    
    <script src="<%=basePath %>static/back/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/popper.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/jquery.matchHeight.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/main.js"></script>


    <script src="<%=basePath %>static/back/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/init/datatables-init.js"></script>
<%--  <script src="<%=basePath %>static/tooltip.js"></script> --%>
<%--  <script src="<%=basePath %>static/jquery.min.js"></script> --%>
 

<script type="text/javascript">
     var isClick = 0 ;
     var essayId = 0;
     var clearFlag;
     var data = "";
     $(document).ready(function() {
    	 $('#bootstrap-data-table-export').DataTable();
    	 
//     	 $('[data-toggle="tooltip"]').tooltip();
//     	 $("#menu3").addClass("active");
    	 var updataMessId = "";
    	 
    	 $("#addCourseBtn").click(function(){
    		 window.location.href = "<%=basePath%>admin/addCourse";
    	 });
    	 
    	 $("body").delegate("a[id^='deleteCourseArrangeBtn']",'click',function(){
    		var id = $(this).prop("id").substring(22);
    		data = "courseArrangeId="+id;
    		console.log("data="+data);
    	 });
    	 
    	 
    	 $("#hideBtn").click(function(){
    		 closeHidden();
    	 });
    	
    	 $("a[id^='hideClass']").click(function(){
    		 clearTimeout(clearFlag);
    		 var id = $(this).prop("id").substring(9);
    		 var clname = $("#hiddenClassName"+id).prop("name");
    		 $("#hideDiv").addClass("show");
    		 if(clname=="null"){
    			 clname="";
    		 }
    		 $("#hideSpan").html(clname);
    		 clearFlag = setTimeout(closeHidden,2000);
    		 
    	 });
    	 
    	 function closeHidden(){
    		 $("#hideDiv").removeClass("show");
    	 }
    	 
    	 $("#makeSure").click(function(){
    		
    		 if(confirm("删除课程，已评价的评分、内容将会删除，确定要删除课程吗？")){
    		 var url = "<%=basePath%>admin/deleteCourseArrange";
    		 $.ajax({
    		       	type : "POST",
    		       	url : url,
    		       	data : data,
    		       	dataType : "json",
    		       	success : function(data){
    		       		if(data.msg=="SUCCESS"){
    		       			alert("删除成功！！");
    		       			window.location = "<%=basePath%>admin/courseArrangeList";
    		       		}else{
    		       			alert(data.msg);
    		       		}
    		      	}
    		     			
    		 });
    		 }
    	 });
    	 
     });
  </script>
</body>
</html>
