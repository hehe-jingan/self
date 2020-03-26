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
	<div class="admin-content">
		<div class="am-u-md-6 am-u-md-offset-2 am-fl">
		<br/>     
		<h2>私信</h2>
		 <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
		 <div class="am-btn-group">
<!--   <button type="button" class="am-btn am-btn-default am-round am-btn-sm">一键置为已读</button> -->
<!--   <button type="button" class="am-btn am-btn-default am-round am-btn-sm">清空所有私信</button> -->
</div>  
<br/>
<div> 
<c:if test="${chatList==null||chatList.size()<1 }">
<span>暂无私信</span>
</c:if>
<c:if test="${!(chatList==null||chatList.size()<1) }">
<c:forEach items="${chatList }" var="list" varStatus="status">
    <div class="am-input-group" style="width: 600px;">   
      <a class="am-input-group-label" style="height: 30px;width: 60px;" href="<%=basePath%>friend/chatList/${list.friendid}">  
        <img alt="" src="/images/blog/user/${list.userimage}" style="height: 30px;width: 30px;" >
      </a>  
      <span class="am-input-group-label" style="width: 230px;">
      <a class=""  href="<%=basePath%>friend/chatList/${list.userid}"> 
      <span class="am-fl">${list.username}</span>
      </a>
       <span class="am-fr"><fmt:formatDate value="${list.inputDate}" pattern="yyyy-MM-dd HH:mm"/> </span> <br>  
<span class="am-fl">${list.content }</span>
      </span>   
      
    </div>   
</c:forEach>
</c:if>


</div> 
		</div>
		<div class="am-fl " >
		<br/><br/>  
			<span style="font-size: large;"><strong>好友列表</strong></span><br/>
			<br/> 
			<c:if test="${friendList==null||friendList.size()<1 }">
<span>暂无好友</span>
</c:if>
<c:if test="${!(friendList==null||friendList.size()<1) }">
<div class="am-panel am-panel-secondary" style="width: 200px;height: 400px;background-color:transparent;">
<c:forEach items="${friendList }" var="list" varStatus="status">
			 <div class="am-input-group" style="">   
      <a class="am-input-group-label" style="height: 30px;width: 60px;" href="<%=basePath%>friend/chatList/${list.friendid}">  
        <img alt="" src="/images/blog/user/${list.friendimage }" style="height: 30px;width: 30px;" >
      </a>  
      <a class="am-input-group-label"  href="<%=basePath%>friend/chatList/${list.friendid}"> 
      <span class="am-fl">${list.friendname }</span>  
      </a> 
			</div>
 
			
			</c:forEach></div> 
			</c:if>
		
		<br> <br><br><br>   
		</div>
		
	</div>
</div>


<script type="text/javascript">

$(document).ready(function(){
	
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


