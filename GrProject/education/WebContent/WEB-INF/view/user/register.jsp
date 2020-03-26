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
    <title>图书馆后台管理-登陆页面</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

        <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";%>

    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/normalize.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/themify-icons.css">
<link rel="stylesheet" href="<%=basePath %>static/back/assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/lib/chosen/chosen.min.css">
        <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>

    <link href='<%=basePath %>static/back/assets/css/my.css' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<body class="bg-dark">

    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="#">
                        <img class="align-content" src="<%=basePath %>static/back/images/logo.png" alt="">
                    </a>
                </div>
                <div class="login-form">
                    <form id="form5">
                        <div class="form-group">
                            <label>账号</label>
                            <input type="text" class="form-control" placeholder="请输入账号" name="name" id="name"  value="">
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" class="form-control" placeholder="请输入密码" name="pass" id="pass" value="">
                        </div>
                         <div class="form-group">
                            <label>确认密码</label>
                            <input type="password" class="form-control" placeholder="请输入确认密码" name="confirmPass" id="confirmPass" value="">
                        </div>
                        <div class="form-group">
                            <label>身份证</label>
                            <input type="text" class="form-control" placeholder="请输入身份证号" name="idcard" id="idcard"  value="${idcard }">
                        </div>
                        <div class="form-group">
                            <label>性别</label>
                             <select data-placeholder="Choose a Country..."  id="sex" name="sex" class="standardSelect" tabindex="1">
                                <option value="男" label="default">男</option>
                                <option value="女">女</option>
                                <option value="保密">保密</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>年龄</label>
                            <input type="number" class="form-control" placeholder="请输入年龄" name="age" id="age"  value="">
                        </div>
                        
                        <div class="checkbox">

                        </div>
                        <button type="button" id="register" class="btn btn-success btn-flat m-b-30 m-t-30">注册</button>
                        <br><br>
                        <button type="button" id="returnBack" class="btn btn-info btn-flat m-b-30 m-t-30">返回</button>
<!--                         <div class="social-login-content"> -->
<!--                             <div class="social-button"> -->
<!--                                 <button type="button" class="btn social facebook btn-flat btn-addon mb-3"><i class="ti-facebook"></i>Sign in with facebook</button> -->
<!--                                 <button type="button" class="btn social twitter btn-flat btn-addon mt-2"><i class="ti-twitter"></i>Sign in with twitter</button> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="register-link m-t-15 text-center"> -->
<!--                             <p>Don't have account ? <a href="#"> 注册</a></p> -->
<!--                         </div> -->
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="<%=basePath %>static/back/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/popper.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/jquery.matchHeight.min.js"></script>
    <script src="<%=basePath %>static/back/assets/js/main.js"></script>
    <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
        <script src="<%=basePath %>static/back/assets/js/lib/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	//返回
	$("#returnBack").click(function(){
		
		window.history.go(-1) ;
		
	});
	
	//选择
	$(".standardSelect").chosen({
        disable_search_threshold: 10,
        no_results_text: "Oops, nothing found!",
        width: "100%"
    });
	//注册
	$("#register").click(function(e){
		e.preventDefault();
		var adminName = $("#name").val();
   		var idcard = $("#idcard").val();
   		 var adminPass = $("#pass").val();
   		 var confirm = $("#confirmPass").val();
   		var age = $("#age").val();
   		
   		 if(adminName==""){
   			 alert("请输入用户名！");
   		 }else if(adminPass==""){
   			 alert("请输入密码！");
   		 }else if(confirm==""){
   			 alert("请输入确认密码！");
   		 }else if(confirm!=adminPass){
   			 alert("输入密码与确认密码不一致！");
   		 }else if(idcard==""){
   			 alert("请输入身份证号码！");
   		 }else if(!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(idcard)){
   				 alert("请输入正确的身份证号码！！");
   		 }else if(age!=""&&(age<1||age>150)){
   				 alert("请输入正确的年龄！！！");
   		 }else{ 
   			 var data = decodeURIComponent($("#form5").serialize(),true);
   			 console.log("data= "+data);
   			 var url = "<%=basePath%>main/register";
   			 
   			 $.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="success"){
   			       			alert("注册成功！！");
   			       			window.location = "<%=basePath%>main/login";
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
