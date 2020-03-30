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
    <title>教育后台管理-登陆页面</title>
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
                    <form id="adminLoginForm">
                        <div class="form-group">
                            <label>账号</label>
                            <input type="text" class="form-control" placeholder="请输入账号" name="name" id="name"  value="admin">
                        </div>
                        <div class="form-group">
                            <label>密码</label>
                            <input type="password" class="form-control" placeholder="请输入密码" name="pass" id="pass" value="admin">
                        </div>
                        <div class="checkbox">

                        </div>
                        <button type="button" id="login" class="btn btn-success btn-flat m-b-30 m-t-30">登陆</button>
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
<script type="text/javascript">

$(document).ready(function(){
	 
	//登录
	$("#login").click(function(e){
		e.preventDefault();
		var account = $("#name").val();
		var password = $("#pass").val();
		
		if(account == ""){
			alert("账号不能为空！");
		}else if(password==""){
			alert("密码不能为空");
		}else{
			
			var url = "<%=basePath%>admin/login";
			var data = decodeURIComponent($("#adminLoginForm").serialize(),true);;
			$.ajax({
				type:"POST",
				url:url,
				data:data,
				dataType:"json",
				success:function(data){
					if(data.msg == "SUCCESS"){
						window.location.href="<%=basePath%>admin/index";
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
