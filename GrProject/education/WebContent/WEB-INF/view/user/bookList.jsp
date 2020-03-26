<%@page import="com.book.pojo.Book"%>
<%@page import="com.book.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
<%
List<Book> list = null;
    if(request.getAttribute("bookList")!=null){
    	list = (List<Book>)request.getAttribute("bookList");
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
    %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>图书馆后台管理</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <%@include file="model/userHeader.jsp" %>
</head>

<body>
    <!-- Left Panel -->
   <%@include file="model/userMenu.jsp" %>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <%@include file="model/userTitle.jsp" %>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
        

        <div class="content">
        
            <div class="animated fadeIn">
            
                <div class="row">

                    <div class="col-md-12">
                  
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">书籍列表</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>书名</th>
                                            <th>作者</th>
                                            <th>出版社</th>
                                            <th>价格</th>
                                            <th>入库时间</th>
                                            <th>库存</th>
                                            <th>借阅次数</th>
                                            <th>在线阅读次数</th>
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
                                            <td><%=list.get(i).getAuthor() %></td>
                                            <td><%=list.get(i).getPublish() %></td>
                                            <td><%=list.get(i).getPrice() %></td>
                                            <td><%=list.get(i).getInputdate()==null?"暂未入库":sdf.format(list.get(i).getInputdate()) %></td>
                                             <td><%=list.get(i).getTotalcount() %></td>
                                            <td><%=list.get(i).getBorrowcount() %></td>
                                            <td><%=list.get(i).getReadcount() %></td>
                                            
                                            <td>
                                            
                                            <a href="<%=basePath%>user/bookDetail/<%=list.get(i).getId()%>" >详情</a>
                                             <a href="#" id="preBro<%=list.get(i).getId()%>" >在线预借</a>
<%--                                             <a href="#" id="deleteAdminBtn<%=list.get(i).getId() %>" data-am-modal="{closeOnConfirm	: false,target: '#deleteAd', closeViaDimmer: 0, width: 400, height: 125}">删除 --%>
<!--                                             </a> -->
                                            </td>
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
                        Copyright &copy; 2019 Library. </a>
                    </div>
                    <div class="col-sm-6 text-right"> Designed by Hualing
                    </div>
                </div>
            </div>
        </footer>
        <div class="am-modal am-modal-prompt " tabindex="-1" id="deleteAd"
	style="margin-top: 300px;">
	<div class="am-modal-dialog">确认删除该书籍？
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

    	 $("a[id^='preBro']").click(function(){
    		
    		 if(confirm("确定要在线预借这本书吗？")){
    		 
    		 var id = $(this).prop("id").substring(6);
    		 var url = "<%=basePath%>user/preBorrowBook";
    		 var data = "bookId="+id;
    		 $.ajax({
 		       	type : "POST",
 		       	url : url,
 		       	data : data,
 		       	dataType : "json",
 		       	success : function(data){
 		       		if(data.msg=="SUCCESS"){
 		       			alert("在线预借成功！！");
 		       			window.location = "<%=basePath%>user/bookList";
 		       		}else{
 		       			alert(data.msg);
 		       		}
 		      	}
 		     			
 		 });
    		 }
    	 });
    	 
    	 
//     	 $("#menu3").addClass("active");
    	 var updataMessId = "";
    	 
    	 $("#addAdminBtn").click(function(){
    		 window.location.href = "<%=basePath%>admin/addBook";
    	 });
    	 
    	 $("a[id^='deleteAdminBtn']").click(function(){
    		var id = $(this).prop("id").substring(14);
    		data = "userId="+id;
    		console.log("data="+data);
    	 });
    	 
    	 $("#makeSure").click(function(){
    		
    		 var url = "<%=basePath%>admin/deleteBook";
    		 
    		 $.ajax({
    		       	type : "POST",
    		       	url : url,
    		       	data : data,
    		       	dataType : "json",
    		       	success : function(data){
    		       		if(data.msg=="SUCCESS"){
    		       			alert("删除成功！！");
    		       			window.location = "<%=basePath%>admin/userList";
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
