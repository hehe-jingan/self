<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../admin/index.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/diyUpload/css/diyUpload.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/diyUpload/css/webuploader.css">
<div id="hiddenMainView" style="visibility: visible; display: none;">
  <div class="admin-content" >
  <div class="am-u-lg-6 am-u-md-8 am-u-md-offset-1">
    <h3>修改密码</h3>
    <br>
 
    <form method="post" action="admin-index.html" class="am-form">
    <label for="oldPass">旧密码:</label>
      <input type="password" name="oldPass" id="oldPass" value="">
      <br>
       <label for="newPass">新密码:</label>
      <input type="password" name="newPass" id="newPass" value="">
      <br>
      <label for="sex">确认密码:</label>
      <input type="password" name="confPass" id="confPass" value="">
      <br> 
      <div class="am-cf">
        <input type="button" name="" id="register" value="确定修改" class="am-btn am-btn-default am-btn-sm am-fl">
        <input style="margin-left: 15px;" type="button" name="" id="return" value="返  回" class="am-btn am-btn-default am-btn-sm am-fl">
        
      </div>
    </form>
    <hr>
    <p>© 2018 版权所有.</p>
  </div>
</div>
</div>
<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/diyUpload/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="<%=basePath %>static/diyUpload/js/diyUpload.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#register").click(function(){
		
		var oldPass = $("#oldPass").val();
		var newPass = $("#newPass").val();
		var confPass = $("#confPass").val();
		 
		if(oldPass == ""){
			alert("旧密码不能为空！");
		}else if(newPass==""){
			alert("新密码不能为空");
		}else if(newPass.length<2||newPass.length>15){
			alert("新密码名称长度应为2~15");
		}else if(confPass==""){
			alert("确认密码不能为空");
		}else if(confPass!=newPass){
			alert("确认密码与新密码不符");
		}else {
			var url = "<%=basePath%>admin/changePass"
			var data = "oldPass="+oldPass+"&newPass="+newPass
			;
			console.log("data="+data);
			$.ajax({
				type:"POST",
				url:url,
				data:data,
				dataType:"json",
				success:function(data){
					if(data.msg == "success"){
						alert("修改成功");
						window.location.href="<%=basePath%>admin/changePass";
					}else{
						alert(data.msg);
					}
					
				}
			});
			
			
		}
		
		
	});
	
	
	$("#return").click(function(){
  		window.history.go(-1);
  	});
	
});

</script>

