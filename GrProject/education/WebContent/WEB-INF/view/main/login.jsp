<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>艾博客</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="<%=basePath %>static/assets/i/favicon.png">
  <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style> 
</head>

<body style="background-image:url('<%=basePath%>static/image/bg1.jpg');background-size:cover ;background-repeat: no-repeat; ">
<div class="header"> 
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h3 style="color: white;">登录</h3>
    <hr>
    <div class="am-btn-group">
<!--       <a href="#" class="am-btn am-btn-secondary am-btn-sm"><i class="am-icon-github am-icon-sm"></i> Github</a> -->
<!--       <a href="#" class="am-btn am-btn-success am-btn-sm"><i class="am-icon-google-plus-square am-icon-sm"></i> Google+</a> -->
<!--       <a href="#" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-stack-overflow am-icon-sm"></i> stackOverflow</a> -->
    </div>
    <br>
    <br>
 
    <form method="post" action="admin-index.html" class="am-form">
      <label for="email" style="color: white;">账号:</label>
      <input type="text" name="" id="account" value="近干"> 
      <br>
      <label for="password" style="color: white;">密码:</label>
      <input type="password" name="" id="password" value="9508">
      <br>
      <label for="remember-me">
      <p style="color: white;"> <a href="<%=basePath%>main/forgetPass">忘记密码</a></p>
      </label>
      <br />
      <div class="am-cf">
        <input type="button" name="" id="login"    value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
        <input style="margin-left: 15px;" type="button" name="" id="register" value="注 册" class="am-btn am-btn-default am-btn-sm am-fl">
      </div>
    </form>
    <hr>
    <p>© 2018 版权所有.</p>
  </div>
</div>
<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	//注册
	$("#register").click(function(){
		window.location.href="<%=basePath%>main/register";
	});
	
	
	//登录
	$("#login").click(function(){
		
		var account = $("#account").val();
		var password = $("#password").val();
		
		if(account == ""){
			alert("账号不能为空！");
		}else if(password==""){
			alert("密码不能为空");
		}else{
			
			var url = "<%=basePath%>main/login";
			var data = "loginAccount="+account+"&loginPass="+password;
			$.ajax({
				type:"POST",
				url:url,
				data:data,
				dataType:"json",
				success:function(data){
					if(data.msg == "SUCCESS"){
						window.location.href="<%=basePath%>main/index";
						
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