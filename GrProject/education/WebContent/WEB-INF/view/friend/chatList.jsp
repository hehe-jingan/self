<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- sidebar start -->
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
<%@ include file="../main/index.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>static/diyUpload/css/diyUpload.css">
<script type="text/javascript"
	src="<%=basePath %>static/diyUpload/js/diyUpload.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>static/diyUpload/css/webuploader.css">
<script type="text/javascript"
	src="<%=basePath %>static/diyUpload/js/webuploader.html5only.min.js"></script>
<div id="hiddenMainView" style="visibility: visible; display: none;">
	<div class="admin-content" style="">
		<div class="am-u-md-7 am-u-md-offset-1 am-fl">
		
		<h2>与 <span>${chaterName }</span> 聊天中</h2>
		 <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
<div>    
<div class="am-panel am-panel-default" id="iDDiv" style="background-color:transparent;">
          <div id="iDiv"  class="am-panel-bd am-collapse am-in am-cf am-scrollable-vertical" id="collapse-panel-3" style="height: 400px;" >
         <c:if test="${chatList==null||chatList.size()<1 }">
<span>暂无消息</span>
</c:if>
         <c:if test="${!(chatList==null||chatList.size()<1) }">
<ul class="am-comments-list admin-content-comment ">
<c:forEach items="${chatList }" var="list" varStatus="status">
             <c:if test="${list.userId==userId }">
             <li class="am-comment"> 
             </c:if>
             <c:if test="${list.userId!=userId }">
             <li class="am-comment am-comment-flip">
             </c:if>
                <a href="#"><img src="/images/blog/user/${list.image}" class="am-comment-avatar" width="30" height="30"></a>
                <div class="am-comment-main">
                  <div class="am-comment-bd"><p>${list.content }</p>
                  </div>
                </div>
              </li> 

            

    
</c:forEach>
</ul>
</c:if>
        </div>
        
      </div>
 <div class="am-input-group">
      <input   type="text" class="am-form-field" id="content">
      <span class="am-input-group-btn">
        <button class="am-btn am-btn-default" type="button" id="send">发送</button>
      </span> 
    </div> 
 </div> 
     
 <br> <br><br><br>  


</div> 
		</div>
		
	</div>
</div>


<script type="text/javascript">
var height=$("#iDiv")[0].scrollHeight;
 
$(document).ready(function(){
	 
	
	setInterval(function () {
height = $("#iDiv")[0].scrollTop;
		 $("#iDDiv").load(location.href+" #iDiv",function(){
		$("#iDiv").scrollTop(height); 
		console.log("刷新");  
		 }); //注意后面DIV的ID前面的空格，很重要！没有空格的话，会出双眼皮！（也可以使用类名）
		 
	}, 2000);
	
	 
// 	 alert("1 "+$("#iDiv")[0].scrollHeight);
	$("#iDiv").scrollTop($("#iDiv")[0].scrollHeight);
	  
	$("#send").click(function(){
		
		var content = $("#content").val();
		if(content == ""){
			alert("请输入文本内容！");
		}else{
			var data = "friendId="+${friendId}+"&content="+content;
			var url = "<%=basePath%>friend/sendMess";
			
			 $.ajax({
			       	type : "POST",
			       	url : url,
			       	data : data,
			       	dataType : "json",
			       	success : function(data){
			       		if(data.msg=="success"){
// 			       			alert("");
							$("#content").val("");  
							$("#iDDiv").load(location.href+" #iDiv",function(){
								$("#iDiv").scrollTop($("#iDiv")[0].scrollHeight); 
								console.log("刷新");  
								 });
			       		}else{
			       			alert(data.msg);
			       		}
			      	}
			     			
			 });
			
			 
		}
		
		
		
		
		
	});
	
// 	$("#iDDiv").onload(function(){
// 		alert(1);
// 	});
	 
});
  
	
	
	    
 
$(document).delegate("a[id^='replyDetailParent']","click",function(){
		var id = $(this).prop("id").substring(17);
		var text = $("#replyer"+id).html();
		spare1 = $(this).next().prop("id");
		console.log("id="+id+"  spare1="+$(this).next().prop("id"));
		var reply = $(this).parent().prev().children("input").eq(0);
		parentId = id;
		messageId = reply.prop("id").substring(5);
		console.log("parentId="+parentId);
		reply.val("回复  "+text+": ");
		reply.focus(); 
		 
// 		alert(text);
});



function timestampToTime(timestamp) {
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    Y = date.getFullYear() + '-';
    M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
    D = (date.getDate()<10?'0'+date.getDate():date.getDate()) + ' ';
    h = (date.getHours()<10?'0'+date.getHours():date.getHours()) + ':';
    m = (date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes());
//     s = date.getSeconds();
    return Y+M+D+h+m;
}
</script>


