<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- sidebar start -->  <%@taglib uri="/WEB-INF/fn.tld" prefix="fn" %>
<%@ include file="index.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/diyUpload/css/diyUpload.css">
<script type="text/javascript" src="<%=basePath %>static/diyUpload/js/diyUpload.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>static/diyUpload/css/webuploader.css">
<script type="text/javascript" src="<%=basePath %>static/diyUpload/js/webuploader.html5only.min.js"></script>
<div id="hiddenMainView" style="visibility: visible; display: none;">
  <div class="admin-content" style=""> 
<!--   左边 -->   
  <div class="am-u-md-7 am-u-md-offset-1 am-fl">
<!--   左上 --><br>
 <div class="am-input-group">
						 <form action="<%=basePath%>main/index" method="get" class="am-input-group">
      <span class="am-input-group-btn"> 
        <button class="am-btn am-btn-default" type="submit" id="search"><span class="am-icon-search"></span> </button>
      </span> 
      
      <input style="background-color:transparent;height: 38px;" type="text" class="am-form-field" placeholder="搜搜想找的文章" id="query" name="query">
      
      <span class="am-input-group-btn">
        <a class="am-btn am-btn-default" id="showDiv" style="margin-left: 50px;">
        <span class="am-icon-edit"></span> 
        </a>
      </span> 
      </form>
    </div>
     
<div style="visibility:hidden; display: none;" id="messDiv">  
<form class="am-form am-form-horizontal" id="messageForm">

          <div class="am-form-group am-fl">
<!--             <label for="user-intro" class="am-u-sm-3 am-form-label"></label> -->
<!--             <div class="am-u-sm-9 am-input-group"> -->
<!--               <textarea class="am-form-field" id="user-intro" ></textarea> -->
<!--               <input type="button" value="发布" name="sendMess" id="sendMess" class="am-input-group-btn" /> -->
<!--             </div> -->
            <div class="am-input-group">
      <br/> 
      <textarea style="background-color:transparent;" type="" class="am-form-field"  rows="3" placeholder="说点什么吧" id="message" name="message"></textarea>
      <input value="照片" type="file" name="file" class="webuploader-element-invisible" multiple="multiple" accept="image/*">
      
      <span class="am-input-group-btn "> 
        <button class="am-btn am-btn-xl am-btn-default" type="button" id="sentMessage">发布</button>
      </span>  
     
</div>
       <div id="demo">
    <div id="as" ></div>
    </div> 
          </div>

        </form>
        
        <br/><br/>
        
</div><br/> 
<!-- 左下 --> 
<div class="am-u-md-9 am-fl">
<c:if test="${messList==null||messList.size()==0 }">
<span>查找不到您所要的文章</span>
</c:if>
<c:if test="${messList!=null&&messList.size()!=0 }">

<c:forEach items="${messList }" varStatus="status" var="list">
<div> 
<form action="" id="messForm${list.indexid }">
<div class="">   
<div class="am-fl">
<a href="<%=basePath %>user/userMess/${list.userId }">
<img alt="user" src="/images/blog/user/${list.image }" style="height: 40px;width: 40px;"></a> 
</div>
<div class="am-fl am-text" style="margin-left: 15px;"> 
<a href="<%=basePath %>user/userMess/${list.userId }">
<span> ${list.username }</span></a>
<br/> 
<span><fmt:formatDate value="${list.inputDate }" pattern="MM-dd HH:mm"/></span>  
</div> <br/> 
 <br/> 
<!-- message -->
<div>
<span>${list.message }</span>
</div>

<div> 
<c:if test="${list.pic!=null && list.pic!=''  }"> 
  <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2  
  am-avg-md-3 am-avg-lg-3 am-gallery-bordered am-gallery-default" data-am-gallery="{ pureview: true }" > 
     <c:forEach items="${list.pic.split(',')}" end="${fn:length(list.pic.split(','))-1}" var="img" varStatus="status">
      <li>  
        <div class="am-gallery-item">
        <a >  
              <img src="/images/blog/message/${img }"   data-am-modal="{target: '#messageModal', closeViaDimmer: 0, width: 400, height: 125}"
               alt="${status.count }" id="imageDetail${list.indexid }${status.count }"/>
               </a>
        </div> 
      </li>  
      </c:forEach> 
  </ul>
</c:if>
</div>
<div><br/> 
<!-- footer -->
<div class="am-btn-group">
 <button type="button" class="yr-button am-btn am-btn-default am-round am-icon-thumbs-o-up" id="zan${list.indexId }"> 赞(${list.likes })</button>
  <button type="button" class="yr-button am-btn am-btn-default am-radius am-icon-share-square" id="share${list.indexId }" > 转发(${list.share })</button>
  <button type="button" class="yr-button am-btn am-btn-default am-round am-icon-comments-o" id="comment${list.indexId }"> 评论(${list.reply })</button>
</div> 
<!-- <span>footer</span> -->
</div>

<!-- replyList --> 
<div style="visibility:hidden; display: none;" id="commentDiv${list.indexId }"> 
<div class="am-input-group">
      <br/> 
      <input type="" class="am-form-field"  placeholder="说点什么吧" id="reply${list.indexId }" name="reply${list.indexId }"/>
        <button class="am-btn am-btn-default" type="button" id="sentReply${list.indexId }">评论</button>
      
</div>

<div id="replyDiv${list.indexId }">
</div>


</div>

</div>
<div>
</div>
</form>
</div>
<hr>
<br/>  
</c:forEach>
</c:if>
<br/><br/>
<br/><br/>
<br/><br/>
</div>


</div>

  
<!--   右边 --> 
<div class="am-u-md-3 am-fl">
<div>
<br/>  
<div style="background-color:transparent;" class="am-u-sm-centered  am-panel am-panel-secondary">
<br/>
<a href="<%=basePath %>user/userMess/${user.indexid }">    
<img class="am-center" alt="" src="/images/blog/user/${user.image }" style="height: 60px;">
<span class="am-center am-text-center">${user.username }</span> 
</a>    
<div class="am-text-center am-u-sm-centered am-center"> 
	<a href="<%=basePath %>friend/friendList" class="" >${friendCount }</a>
	<a href="<%=basePath %>user/userMess/${user.indexid }" style="margin-left: 30px;" class="" >${messCount }</a>
	<br/> 
	<span class="">关注</span><span style="margin-left: 10px;" class="">文章</span>
</div>
 
</div> 
</div>
<br/><br/><br/>
<div class="">

<br/> 
<div style="background-color:transparent;" class="am-u-sm-centered  am-panel am-panel-secondary">
<br/>
<span class="am-center am-text-center">公告栏</span> 
<hr />
<div class="am-text-center am-u-sm-centered am-center"> 
<span class="am-center am-text-center">${bulletin}</span>
</div>
 
</div> 
</div>  
  
<!--   <center><p style="font-family: fantasy;;font-size:60px;font-style: italic;">艾博客</p></center> -->
<!--    <br/>  <br/>  <br/> -->
<!--     <br/>  <br/>  <br/> -->
<!--      <br/>  <br/>  <br/> -->
<!--       <br/>  <br/>  <br/> -->
  </div>
  
  <!-- Modal -->  
		<div class="am-modal am-modal-no-btn" tabindex="-1" id="messageModal" style="margin-top: 300px;">
			<div class="am-modal-dialog" >
				<div class="am-modal-hd">
					<a href="javascript: void(0)" class="am-close am-close-spin"
						data-am-modal-close>&times;</a>
				</div>
				<div class="am-modal-bd">
						<center>
						<img alt="" src="" id="modalImage">
						</center>
					</div>
			</div>
		</div>
  </div>
</div>

<script type="text/javascript">
var messageId = "";
var headText = "";
var parentId = "";
var spare1 = "";

$(document).ready(function() {
	
// 	$("#menu1").addClass("am-active");
	
	
	
	var filename = "";
	$('#as').diyUpload({
	    url:'<%=basePath%>user/upload/message',
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
	    buttonText : '添加图片',
	    chunked:true,
	    // 分片大小
	    chunkSize:512 * 1024,
	    //最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
	    fileNumLimit:9,
	    fileSizeLimit:5 *1024 * 1024,
	    fileSingleSizeLimit:5*1024  * 1024,
	    accept: {}
	});
	$('#messageModal').on('open.modal.amui', function(){
// 		  alert('第一个演示弹窗打开了');
		});
	
	$("img[id^='imageDetail']").click(function(){
		$("#modalImage").prop("src",$(this).prop("src"))
// 		alert(11);
		
		 
	}); 
	
	
	//点赞
	$("button[id^='zan']").click(function(){
		 
		var data ="messageId="+$(this).prop("id").substring(3); 
		
		var num = $(this).html().substring(3,$(this).html().length-1); 
// 		console.log("num="+num+" $(this).html().length="+$(this).html().length);
		var id = $(this).prop("id");
		var url = "<%=basePath%>user/likesMess";
		 $.ajax({
		       	type : "POST",
		       	url : url,
		       	data : data,
		       	dataType : "json",
		       	success : function(data){
		       		if(data.msg=="+"){
// 		       			alert("办理成功，请等待管理员审核 ！！");
						console.log("点赞成功");
						console.log("id="+id);
						$("#"+id).html(" 赞("+(parseInt(num)+1)+")");
						
		       		}else if(data.msg == "-"){
		       			console.log("取消成功");
		       			console.log("id="+id); 
		       			$("#"+id).html(" 赞("+(parseInt(num)-1)+")");
		       		}else{
		       			alert(data.msg);
		       		}
		      	}
		     			
		 });
		
		
	});
	
	
	//转发
	$("button[id^='share']").click(function(){
		
		var result = confirm("是否转发此文章？");
		if(result){
			var data ="messageId="+$(this).prop("id").substring(5); 
			
			var num = $(this).html().substring(4,$(this).html().length-1); 
//	 		console.log("num="+num+" $(this).html().length="+$(this).html().length);
			var id = $(this).prop("id");
			var url = "<%=basePath%>user/shareMess";
			 $.ajax({
			       	type : "POST",
			       	url : url,
			       	data : data,
			       	dataType : "json",
			       	success : function(data){
			       		if(data.msg=="success"){
	 		       			alert("转发成功，请等待管理员审核 ！！");
							console.log("转发成功");
							console.log("id="+id);
							$("#"+id).html(" 转发("+(parseInt(num)+1)+")");
							
			       		}else{
			       			alert(data.msg);
			       		}
			      	}
			     			
			 });
			
			
		}
	});
	
	//评论
	$("button[id^='sentReply']").click(function(){
		var id = $(this).prop("id").substring(9);
		var text = $("#reply"+id).val();
		if(text == ""){
			alert("请先输入评论！！");
		}else{ 
			var data ="";
			if(headText!=""&&text.indexOf(headText)!=-1){
				text = text.replace(headText,"");
				data = "messageId="+messageId+"&content="+text+"&spare1="+spare1; 
			}else{
				parentId = 0;
				data = "messageId="+id+"&content="+text+"&spare1=-1"; 
			} 
			console.log("headText="+headText);
			  console.log("spare1="+spare1);
			  console.log("parentId="+parentId);
			  console.log("data="+data);
// 			var num = $(this).html().substring(3,$(this).html().length-1); 
//	 		console.log("num="+num+" $(this).html().length="+$(this).html().length);
			 
			var url = "<%=basePath%>user/replyMess/"+parentId;
			 $.ajax({
			       	type : "POST",
			       	url : url,
			       	data : data,
			       	dataType : "json",
			       	success : function(data){
			       		if(data.msg=="success"){
//	 		       			alert("办理成功，请等待管理员审核 ！！");
							console.log("评论成功");
							console.log("id="+id);
							window.location.href = "<%=basePath%>main/index";
// 							$("#"+id).html(" 赞("+(parseInt(num)+1)+")");
							
			       		}else{
			       			alert(data.msg);
			       		}
			      	}
			     			
			 });
			
		}
		
	});
	
	//显示窗口 
	$("#showDiv").click(function(){
		var flag = $("#messDiv").css("visibility");
		if(flag=="visible"){
			$("#messDiv").css("visibility","hidden"); 
			$("#messDiv").css("display","none"); 
		}else{
			$("#messDiv").css("visibility","visible");
			$("#messDiv").css("display","block"); 
			$('#as').diyUpload({
			    url:'<%=basePath%>user/upload/message',
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
			    buttonText : '添加图片',
			    chunked:true,
			    // 分片大小
			    chunkSize:512 * 1024,
			    //最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
			    fileNumLimit:9,
			    fileSizeLimit:5 *1024 * 1024,
			    fileSingleSizeLimit:5*1024  * 1024,
			    accept: {}
			});
		}
		
	});
	
	//评论窗口 
	$("button[id^='comment']").click(function(){
		var id = $(this).prop('id').substring(7); 
		var flag = $("#commentDiv"+id).css("visibility");
		if(flag=="visible"){
			$("#commentDiv"+id).css("visibility","hidden"); 
			$("#commentDiv"+id).css("display","none"); 
		}else{
			$("#commentDiv"+id).css("visibility","visible");
			$("#commentDiv"+id).css("display","block"); 
			
			var data = "messageId="+id;
			var url = "<%=basePath%>user/getReplyList";
			 $.ajax({
			       	type : "POST",
			       	url : url,
			       	data : data,
			       	dataType : "json",
			       	success : function(data){
			       		if(data.msg=="success"){
			       			var array = data.replyList; 
// 			       			console.log("array="+array[0].commentDate);
			       			var html = "";
			       			if(array.length>0){ 
			       				var spare = "-1";
			       			for(var i = 0 ; i < array.length;i++){
			       				var val = array[i]; 
			       				
			       				if(spare == array[i].spare1){
			       					html+='<div style="margin-left: 40px;" id="replyChildDiv">';
			       					html += '<img alt="" src="/images/blog/user/'+val.replyerPic+'" style="height: 30px;"><a href="<%=basePath %>user/userMess/'+val.cuid+'" id="replyer'+val.deplyId+'">'+val.replyer+'</a> 回复<a href="<%=basePath %>user/userMess/'+val.pcuid+'" > '+val.pcuname+'</a>:';
					    			html+='<span>'+val.content+'</span><br/>';
					    			html+='<span style="margin-left:70px;">'+timestampToTime(val.commentDate)+'</span><a id="replyDetailChlid'+val.deplyId+'" > 回复</a>';
					    			html += '<input type="hidden" id="'+val.spare1+'" />';
					    			html+='</div>';
			       				}else{ 
			       					html += '<img alt="" src="/images/blog/user/'+val.replyerPic+'" style="height: 30px;"><a href="<%=basePath %>user/userMess/'+val.cuid+'" id="replyer'+val.deplyId+'">'+val.replyer+'</a>:';
			       					
			       					html+='<span>'+val.content+'</span><br/>'; 
					    			html+='<span style="margin-left:70px;">'+timestampToTime(val.commentDate)+'</span><a id="replyDetailParent'+val.deplyId+'"> 回复</a>';
					    			html += '<input type="hidden" id="'+val.spare1+'" />';
					    			html+='<br/>';
			       				}
				    			spare = array[i].spare1;
			       			}
			       			}
			    			$("#replyDiv"+id).html(html);
			       		}else{
			       			alert(data.msg);
			       		}
			      	}
			 });
		} 
	});
	 
	
	//发布
$("#sentMessage").click(function(){
	
	var message = $("#message").val();
	if(message==""&&filename==""){
		alert("请输入文字或选择图片！！");
	}else{
	var data = "message="+message+"&pic="+filename;
	var url = "<%=basePath%>user/sendMessage";
	 $.ajax({
	       	type : "POST",
	       	url : url,
	       	data :data,
	       	dataType : "json",
	       	success : function(data){
	       		if(data.msg=="success"){
	       			alert("发布成功，请等待管理员审核 ！！");
	       			window.location = "<%=basePath%>main/index";
	       		}else{
	       			alert(data.msg);
	       		}
	      	}
	     			
	 });
	} 
});



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


$(document).delegate("a[id^='replyDetailChlid']","click",function(){
	var id = $(this).prop("id").substring(16);
	var text = $("#replyer"+id).html();
	spare1 = $(this).next().prop("id");
	console.log("id="+id+"  spare1="+spare1);
	var reply = $(this).parent().parent().prev().children("input").eq(0);
	headText="回复  "+text+": ";
	parentId = id;
	messageId = reply.prop("id").substring(5); 
	console.log("parentId="+parentId);
	spare1 = "";
	reply.val(headText);
	reply.focus();
//		alert(text);
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


