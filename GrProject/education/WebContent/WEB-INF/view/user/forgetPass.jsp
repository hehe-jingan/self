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
 <%@include file="model/userHeader.jsp" %>
</head>
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/lib/chosen/chosen.min.css">
    <script src="<%=basePath %>static/back/assets/js/lib/chosen/chosen.jquery.min.js"></script>
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
        
         <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">修改密码</strong>
                            </div>
                            <div class="card-body">
                                <!-- Credit Card -->
                                <div id="pay-invoice">
                                    <div class="card-body">
                                        <form action="#" method="post" novalidate="novalidate" id="form5">
                                            <div class="form-group text-center">
                                            </div>
                                            <div class="form-group has-success">
                                                <label for="cc-name" class="control-label mb-1" >旧密码</label>
                                                <input type="password" id="oldPass" name="oldPass" class="form-control cc-name valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name">
                                                <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                            </div>
                                            <div class="form-group has-success">
                                                <label for="cc-name" class="control-label mb-1" >新密码</label>
                                                <input type="password" id="newPass" name="newPass" class="form-control cc-name valid" data-val="true" data-val-required="Please enter the name on card" autocomplete="cc-name" aria-required="true" aria-invalid="false" aria-describedby="cc-name">
                                                <span class="help-block field-validation-valid" data-valmsg-for="cc-name" data-valmsg-replace="true"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="cc-number" class="control-label mb-1">确认密码</label>
                                                <input  type="password" id="confirmPass" name="confirmPass" class="form-control cc-number identified visa" value="" data-val="true" data-val-required="Please enter the card number" data-val-cc-number="Please enter a valid card number">
                                                <span class="help-block" data-valmsg-for="cc-number" data-valmsg-replace="true"></span>
                                            </div>
                                            <br/>
                                            <div>
                                                <button  type="button" id="makeSure" class="btn btn-lg btn-info ">
                                                    <span id="payment-button-amount" >提交</span>
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
    	
    $(document).ready(function() {
   	 $("#makeSure").click(function(){
   		var newPass = $("#newPass").val();
   		var oldPass = $("#oldPass").val();
   		var confirmPass = $("#confirmPass").val();
   		
   		 if(oldPass==""){
   			 alert("请输入旧密码！");
   		 }else if(newPass==""){
   			 alert("请输入新密码！");
   		 }else if(confirmPass==""){
   			 alert("请输入确认密码！");
   		 }else if(newPass!=confirmPass){
   			 alert("输入密码与确认密码不一致！");
   		 }else{ 
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>user/changePass";
   			 
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="success"){
   			       			alert("修改成功！！");
   			       			window.location = "<%=basePath%>user/changePass";
   			       		}else{
   			       			alert(data.msg);
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
