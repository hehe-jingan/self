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
                                <strong class="card-title">书籍入库</strong>
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
                                                <input type="text"  id="name" name="name" value="111" class="form-control" aria-required="true" aria-invalid="false" >
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >作者</label>
                                                <input type="text" id="author" name="author" value="111" class="form-control" aria-required="true" aria-invalid="false" >
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >出版社</label>
                                                <input type="text"  id="publish" name="publish" value="111" class="form-control" aria-required="true" aria-invalid="false">
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >价格</label>
                                                <input type="number"  id="price" name="price" value="111" class="form-control" aria-required="true" aria-invalid="false" >
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >库存数量</label>
                                                <input type="number"  id="totalCount" name="totalCount" value="1" class="form-control" aria-required="true" aria-invalid="false">
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-payment" class="control-label mb-1" >封面</label>
                                                <input type="file"  id="bookImage" name="bookImage" class="" aria-required="true" aria-invalid="false" value="">
                                            </div>
                                            <div class="form-group has-success">
                                                <label for="cc-name" class="control-label mb-1" >电子版文件</label>
                                                <input type="file" id="bookDoc" name="bookDoc" class="" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name">
                                                <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                            </div>
                                            <br/>
                                            <div>
                                                <button  type="button" id="makeSure" class="btn btn-lg btn-info ">
                                                    <span id="payment-button-amount" >入库</span>
                                                </button>
                                                <button  type="button" id="returnBack" class="btn btn-lg btn-info ">
                                                    <span id="payment-button-amount" >返回</span>
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
   var newCertNo = ${newCertId }+"";
    function getNewCertNO(){
    	
    	var url = "<%=basePath%>admin/getNewCertNo";
			 
			 $.ajax({
			       	type : "GET",
			       	url : url,
			       	data : "",
			       	dataType : "json",
			       	success : function(data){
			       		if(data.msg=="SUCCESS"){
			       			
			       			newCertNo = data.newCertNo;
			       			$("#certNo").val(data.newCertNo);
			       			console.log("newCertNo="+newCertNo);
			       		}else{
			       			alert(data.msg);
			       		}
			      	}
			 });
    }
    
    $(document).ready(function() {
   	  
    	jQuery(".standardSelect").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });
    	
    	
    	
   	 $("#makeSure").click(function(){
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
   		 }else if(bookImage==""){
   			 alert("请选择图书封面！");
   		 }else{ 
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 
   			 
   			 var image = document.getElementById('bookImage').files[0];
   			 var doc = document.getElementById('bookDoc').files[0];

             var fd = new FormData();
             fd.append('name', name);
             fd.append('author', author);
             fd.append('publish', publish);
             fd.append('price', price);
             fd.append('totalcount', totalCount);
             fd.append('bookImage', image);
             fd.append('bookDoc', doc);
   			 var url = "<%=basePath%>admin/addBook";
   			 
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			    	 processData:false,  //tell jQuery not to process the data
                 	contentType: false,  //tell jQuery not to set contentType
   			       	data : fd,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("新增成功！！");
   			       			window.location = "<%=basePath%>admin/bookList";
   			       		}else{
   			       			alert(data.msg);
   			       		getNewCertNO();
   			       		}
   			      	}
   			     			
   			 });
   			 
   			 
   		 }
   		 
   		 
   		 
   	 });
   	 
   	 
   	 
   	 
   	 //返回
   	 $("#returnBack").click(function(){
   		window.history.go(-1);
   	 });
    });
    </script>
</body>
</html>
