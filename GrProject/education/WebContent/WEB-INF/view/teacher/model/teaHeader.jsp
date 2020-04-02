<%@page import="com.education.pojo.Teacher"%>
<%@page import="com.education.pojo.Student"%>
<%@page import="com.education.pojo.Admin"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
    <%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt" %>
     <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String userLoginFlag = "";
	String userName="未登录";
	Integer userId = 0;
	Teacher user = null;
	if(request.getSession().getAttribute("teacher")==null){
		userLoginFlag = "false";
	}else{
		userLoginFlag = "true";
		user = (Teacher)request.getSession().getAttribute("teacher");
		userName = user.getName();
		userId  = user.getIndexid();
	}
			%>

    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/normalize.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/themify-icons.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/style.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="<%=basePath %>static/back/assets/weather/css/weather-icons.css" rel="stylesheet" />
<link href="<%=basePath %>static/back/assets/calendar/fullcalendar.css" rel="stylesheet" />
<link href="<%=basePath %>static/back/assets/css/charts/chartist.min.css" rel="stylesheet">
<link href="<%=basePath %>static/back/assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css"/>

   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }

    </style>
    
    
      <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>static/back/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="<%=basePath %>static/back/assets/js/popper.min.js"></script>
<script src="<%=basePath %>static/back/assets/js/plugins.js"></script>
<script src="<%=basePath %>static/back/assets/js/main.js"></script>
<script src="<%=basePath %>static/back/assets/js/lib/chart-js/Chart.bundle.js"></script>

<script src="<%=basePath %>static/back/assets/js/lib/chartist/chartist.min.js"></script>
<script src="<%=basePath %>static/back/assets/js/lib/chartist/chartist-plugin-legend.js"></script>
<script src="<%=basePath %>static/back/assets/js/lib/flot-chart/jquery.flot.js"></script>
<script src="<%=basePath %>static/back/assets/js/lib/flot-chart/jquery.flot.pie.js"></script>
<script src="<%=basePath %>static/back/assets/js/lib/flot-chart/jquery.flot.spline.js"></script>
<script src="<%=basePath %>static/back/assets/js/moment/moment.js"></script>
<script src="<%=basePath %>static/back/assets/calendar/fullcalendar.min.js"></script>
<script src="<%=basePath %>static/back/assets/calendar/fullcalendar-init.js"></script>
<%--     <script src="<%=basePath %>static/back/assets/js/init/weather-init.js"></script> --%>
<%-- <script src="<%=basePath %>static/back/assets/weather/js/jquery.simpleWeather.min.js"></script> --%>
<%-- <script src="<%=basePath %>static/back/assets/weather/js/weather-init.js"></script> --%>

<!--     <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script> -->
<!--     <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script> -->
    <script src="<%=basePath %>static/back/assets/js/init/fullcalendar-init.js"></script>
    <script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
    
    
    
  <script type="text/javascript">
 var userIsLoginFlag = "<%=userLoginFlag%>"; 
 var userId = "<%=userId%>";
 
 function getMessageCount(){
	
<%-- 	 var url = "<%=basePath%>admin/getMessageCount"; --%>
// 	 var data = "adminId="+adminId;
// 	 $.ajax({
// 	       	type : "POST",
// 	       	url : url,
// 	       	data : data,
// 	       	dataType : "json",
// 	       	success : function(data){
// 	       		if(data.msg=="success"){
// 	       				var count = data.data;
// 	       				console.log("cont="+count);
// 	       				if(count>0){
// 	       					$("#messageCount").html(count);
// 	       					$("#messageCount").addClass("count bg-danger");
// 	       				}else{
// 	       					$("#messageCount").html("");
// 	       					$("#messageCount").removeClass("count bg-danger");
// 	       				}
	       				
// 	       		}
// 	       		}
	     			
// 	 });
	 
 }
  $(document).ready(function() {
// 	  getMessageCount();
	  if(userIsLoginFlag=="false"){
		  alert("请重新登录！！");
		  window.location.href = "<%=basePath%>teacher/login";
	  }
	  
	  $("#logoutSystem").click(function(){
		  
		 if(confirm("确定要退出系统吗？？")){
			 window.location.href = "<%=basePath%>teacher/login?flag=logout";
		 }
		  
	  });
	  
	  
// 	  setInterval(getMessageCount,10000);
	  
  });
  
  
  </script>
  
