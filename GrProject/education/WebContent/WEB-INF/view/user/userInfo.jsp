<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../main/index.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/diyUpload/css/diyUpload.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/diyUpload/css/webuploader.css">
<div id="hiddenMainView" style="visibility: visible; display: none;">
  <div class="admin-content" >
  <div class="am-u-lg-6 am-u-md-8 am-u-md-offset-1">
    <h3>个人信息</h3>
    <br>
 
    <form method="post" action="admin-index.html" class="am-form">
     <img alt="" src="/images/blog/user/${user.image }" style="width: 60px;height: 60px;">
      <input class="am-btn am-btn-default webuploader-element-invisible" value="上传照片"
		type="file" name="file" multiple="multiple" accept="image/*">
       <div id="demo">
    <div id="as" ></div>
    </div>  
    <label for="username">账号名称:</label>
      <input style="background-color:transparent;" type="text" name="username" id="username" value="${user.username }">
      <br>
       <label for="email">邮箱:</label>
      <input style="background-color:transparent;" type="email" name="email" id="email" value="${user.email }">
      <br>
      <label for="sex">性别:</label>
      <br> 
      <input style="background-color:transparent;" type="radio" name="sex" id="sex1" value="男" checked="checked">男
      <input style="background-color:transparent;" type="radio" name="sex" id="sex2" value="女">女
      <input type="radio" name="sex" id="sex3" value="保密">保密
      <br/><br/> 
      <label for="birthday">生日:</label>
      <input style="background-color:transparent;" type="date" name="birthday" id="birthday" value="${user.birthday }" >
      <br>
       <label for="location">所在地:</label>
      <input style="background-color:transparent;" type="text" name="location" id="location" value="${user.location }">
      <br>
      <div class="am-form-group">
      <label for="doc-select-1">血型:</label> 
      <select style="background-color:transparent;" name="bloodtype" id="bloodtype" >
        <option value="option1" selected="selected">A型血</option>
        <option value="option2">B型血</option>
        <option value="option3">AB型血</option>
        <option value="option4">O型血</option>
        <option value="option5">保密</option>
      </select>
      <span class="am-form-caret"></span>
    </div>
      <label for="qq">QQ</label>
      <input style="background-color:transparent;" type="text" name="qq" id="qq" value="${user.qq }">
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
var filename = "";
var sex = "男";
$(document).ready(function(){
	
	$("input[id^='sex']").click(function(){
		
		sex = $(this).val();
		
	});
	
		$('#as').diyUpload({
		    url:'<%=basePath%>user/upload/user',
		    success:function( data ) {
		    	console.log("data.msg="+data.msg);
		        if(data.msg=="success"){
		        	
		        	if(data.filename!=""){
		        		filename+=data.filename+",";
		        	}
		        	
		        	console.log("filename="+filename);
		        }
		    },
		    error:function( err ) {
		        console.info( err );  
		    },
		    buttonText : '修改头像',
		    chunked:true,
		    // 分片大小
		    chunkSize:512 * 1024,
		    //最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
		    fileNumLimit:1,
		    fileSizeLimit:5 *1024 * 1024,
		    fileSingleSizeLimit:5*1024  * 1024,
		    accept: {}
		});
	$("#register").click(function(){
		
		var username = $("#username").val();
		var email = $("#email").val();
		var birthday = $("#birthday").val();
		var location = $("#location").val();
		var bloodtype = $("#bloodtype").find("option:selected").text();
		var qq = $("#qq").val();
		 
		if(username == ""){
			alert("账户名称不能为空！");
		}else if(username.length<2||username.length>15){
			alert("账户名称长度应为2~15");
		}else if(email==""){
			alert("邮箱不能为空");
		}else if(!email.match(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/)){
			alert("请输入正确的邮箱格式");
		}else {
			var url = "<%=basePath%>user/userInfo"
			var data = "username="+username+"&sex="+sex+"&image="+filename
			+"&birthday="+birthday+"&location="+location+"&bloodtype="+bloodtype+"&qq="+qq
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
						window.location.href="<%=basePath%>user/userInfo";
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

