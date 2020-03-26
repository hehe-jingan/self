<%@page import="com.education.pojo.Classes"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
<%
List<Classes> list = null;
    if(request.getAttribute("classesList")!=null){
    	list = (List<Classes>)request.getAttribute("classesList");
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
                                <strong class="card-title">班级列表</strong>
                                  <span class="btn btn-lg btn-outline-secondary float-right" id="addClassesBtn">新增班级</span> 
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>班级名称</th>
                                            <th>是否使用中</th>
                                            <th>班级人数</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <% if(list!=null){
                  	for(int i = 0;i<list.size();i++){
                  %>
                                        <tr>
                                            <td><%=i+1 %></td>
                                            <td><%=list.get(i).getName() %></td>
                                             <td><%="0".equals(list.get(i).getIsuse())?"不使用":"使用中" %></td>
                                             	<td><%=list.get(i).getStucount() %></td>
<%--                                              <td><%=("1".equals(list.get(i).getOnjob()))?"在职":"离职" %></td> --%>
<%--                                             <td><%=list.get(i).getLastlogindate()==null?"暂未登录":sdf.format(list.get(i).getLastlogindate()) %></td> --%>
                                             <td>
                                              <a href="<%=basePath%>admin/updateClasses/<%=list.get(i).getIndexid()%>" >编辑</a>
                                             <a href="#" id="deleteClassesBtn<%=list.get(i).getIndexid() %>" data-am-modal="{closeOnConfirm	: false,target: '#deleteAd', closeViaDimmer: 0, width: 400, height: 125}">删除</a>
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
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2020 Library. </a>
                    </div>
                    <div class="col-sm-6 text-right"> Designed by ZhiYong
                    </div>
                </div>
            </div>
        </footer>
        <div class="am-modal am-modal-prompt " tabindex="-1" id="deleteAd"
	style="margin-top: 300px;">
	<div class="am-modal-dialog">确认删除该班级？
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

<script type="text/javascript">
     var isClick = 0 ;
     var essayId = 0;
     var data = "";
     $(document).ready(function() {
    	 $('#bootstrap-data-table-export').DataTable();
    	 
    	 
//     	 $("#menu3").addClass("active");
    	 var updataMessId = "";
    	 
    	 $("#addClassesBtn").click(function(){
    		 window.location.href = "<%=basePath%>admin/addClasses";
    	 });
    	 
    	 $("a[id^='deleteClassesBtn']").click(function(){
    		var id = $(this).prop("id").substring(16);
    		data = "classesId="+id;
    		console.log("data="+data);
    	 });
    	 
    	 $("#makeSure").click(function(){
    		
    		 var url = "<%=basePath%>admin/deleteClasses";
    		 $.ajax({
    		       	type : "POST",
    		       	url : url,
    		       	data : data,
    		       	dataType : "json",
    		       	success : function(data){
    		       		if(data.msg=="SUCCESS"){
    		       			alert("删除成功！！");
    		       			window.location = "<%=basePath%>admin/classesList";
    		       		}else{
    		       			alert(data.msg);
    		       		}
    		      	}
    		     			
    		 });
    		 
    	 });
    	 
     });
  </script>
    <script type="text/javascript">
        $(document).ready(function() {
          
      } );
  </script>
</body>
</html>
