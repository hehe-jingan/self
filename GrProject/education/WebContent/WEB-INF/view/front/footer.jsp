<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer start here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
			<h3>欢迎注册</h3>
			<p></p>
		    <form>
		    	<input type="text" value="" id="attendPhone" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入身份证';}" placeholder="请输入身份证号" >
		    	<input type="button" id="attend" class="btn btn-secondary btn-flat" value="加入我们">
		    </form>
		</div>
	</div>
</div>
<!--footer end here-->
<!--copy right-->
<div class="copy-rights">
	<div class="container">
		<div class="copy-rights-main">
			<p>Copyright &copy; 2019.Company name All rights reserved.</p>
		</div>
	</div>
</div>
<!--/copy rights-->
<script>
$(document).ready(function() {
	$("#attend").click(function(){
		var phone = $("#attendPhone").val();
		window.location.href = "<%=basePath%>main/register?idcard="+phone;
	})
	
	
});

</script>