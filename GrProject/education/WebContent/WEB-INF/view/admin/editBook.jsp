<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.book.pojo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
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
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
 <%@include file="model/adminHeader.jsp" %>
</head>
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/lib/chosen/chosen.min.css">
    <script src="<%=basePath %>static/back/assets/js/lib/chosen/chosen.jquery.min.js"></script>
<body>
<%
 String pageFlag = "false";
 Book book = new Book();
 book.setAuthor("");
 book.setName("");
 book.setPublish("");
 if(request.getAttribute("book")!=null){
	 book = (Book)request.getAttribute("book");
	 pageFlag = "true";
 }
 
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 %>
    <!-- Left Panel -->
   <%@include file="model/adminMenu.jsp" %>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <%@include file="model/adminTitle.jsp" %>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
        
         <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">编辑书籍</strong>
                            </div>
                            <div class="card-body">
                                <!-- Credit Card -->
                                <div id="pay-invoice">
                                    <div class="card-body">
                                        <form action="#" method="post" novalidate="novalidate" id="form5" enctype="multipart/form-data">
                                            <div class="form-group text-center">
                                            </div>
                                             <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >书名</label>
                                                <input type="text"  id="name" name="name" value="<%=book.getName() %>" class="form-control" aria-required="true" aria-invalid="false" >
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >作者</label>
                                                <input type="text" id="author" name="author" value=<%=book.getAuthor() %> class="form-control" aria-required="true" aria-invalid="false" >
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >出版社</label>
                                                <input type="text"  id="publish" name="publish" value="<%=book.getPublish() %>" class="form-control" aria-required="true" aria-invalid="false">
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >价格</label>
                                                <input type="number"  id="price" name="price" value="<%=book.getPrice() %>" class="form-control" aria-required="true" aria-invalid="false" >
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >库存数量</label>
                                                <input type="number"  id="totalCount" name="totalCount" value="<%=book.getTotalcount() %>" class="form-control" aria-required="true" aria-invalid="false">
                                            </div>
                                            <div class="form-group">
                                            <img alt="封面" class="float-right"
											src="<%=basePath %>../book/image/<%=book.getPicurl()%>"
											width="200px">
                                                <label for="cc-payment" class="control-label mb-1" >更换封面</label>
                                                <input type="file"  id="bookImage" name="bookImage" class="" aria-required="true" aria-invalid="false" value="">
                                            </div>
                                            <br/>
                                            <div>
                                                <button  type="button" id="makeSure" class="btn btn-lg btn-info ">
                                                    <span id="payment-button-amount" >提交</span>
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div> <!-- .card -->

                    </div><!--/.col-->
        
        
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
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!--Local Stuff-->
    <script>
    
    $(document).ready(function() {
   	  
        	var pageFlag = "<%=pageFlag%>";
        	
        	if(pageFlag == "false"){
        		alert("暂无此书籍！！！");
        		window.history.go(-1);
        	}
        	 
        	//返回
          	 $("#returnBack").click(function(){
          		window.history.go(-1);
          	 });
        	
        	
    	
    	jQuery(".standardSelect").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });
    	
    	
    	
   	 $("#makeSure").click(function(){
   		 var id = "<%=book.getId()%>";
   		var name = $("#name").val();
   		var author = $("#author").val();
   		 var publish = $("#publish").val();
   		 var price = $("#price").val();
   		var totalCount = $("#totalCount").val();
   		var bookImage = $("#bookImage").val();
   		 if(name==""){
   			 alert("请输入书名！");
   		 }else if(author==""){
   			 alert("请输入作者！");
   		 }else if(publish==""){
   			 alert("请输入出版社！");
   		 }else if(price==""){
   			 alert("请输入价格！");
   		 }else if(price!=""&&(price<1)){
   				 alert("请输入正确的价格！！！");
   		 }else if(totalCount==""){
   			 alert("请输入库存数量！");
   		 }else if(totalCount!=""&&(totalCount<1)){
   				 alert("请输入正确的库存！！！");
   		 }else{ 
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 
   			 
   			 var image = document.getElementById('bookImage').files[0];

             var fd = new FormData();
             fd.append('id', id);
             fd.append('name', name);
             fd.append('author', author);
             fd.append('publish', publish);
             fd.append('price', price);
             fd.append('totalcount', totalCount);
             fd.append('bookImage', image);
   			 var url = "<%=basePath%>admin/editBook";
   			 
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			    	 processData:false,  //tell jQuery not to process the data
                 	contentType: false,  //tell jQuery not to set contentType
   			       	data : fd,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("编辑成功！！");
   			       			window.location = "<%=basePath%>admin/bookList";
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
