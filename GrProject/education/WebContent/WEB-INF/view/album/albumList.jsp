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
	<!-- <h1 style="">相册</h1> -->
	<div class="admin-content">
	<ol class="am-breadcrumb">
		<li><a href="<%=basePath %>album/allAlbum" class="am-icon-home">我的相册</a></li>
		<!--   <li><a href="#">分类</a></li> -->
		<!--   <li class="am-active">内容</li> -->
	</ol>
	<input style="margin-left: 15px;" class="am-btn am-btn-default" id="addAlbum" value="新增相册"
		type="button"
		data-am-modal="{target: '#addAlbumModal', closeViaDimmer: 0, width: 400, height: 125}">
	<br/><br/>
	<ul data-am-widget="gallery"
		class="am-gallery am-avg-sm-2
  am-avg-md-3 am-avg-lg-5 am-gallery-bordered am-u-md-9"
		data-am-gallery="{pureview:true}">
		<c:if test="${albumList==null||albumList.size()<1 }">
			<h2>暂无相册</h2>
		</c:if>
		<c:if test="${albumList!=null&&albumList.size()>0 }">
			<c:forEach items="${albumList }" var="list" varStatus="status">
				<li>
					<div class="am-gallery-item">
						<a href="<%=basePath %>album/allAlbum/${list.indexid }" class=""> 
						<c:if test="${list.pics==null||list.pics=='' }">
						<img src="<%=basePath %>static/image/album.png" alt="" />
						</c:if>
						<c:if test="${list.pics!=null&&list.pics!='' }">
						<img src="/images/blog/album/${list.pics.split(',')[0] }" alt="" />
						</c:if>
							<h3 class="am-gallery-title">${list.name }</h3>
							<div class="am-gallery-desc">
							<fmt:formatDate value="${list.inputdate }" pattern="yyyy-MM-dd"/>
							</div>
						</a>
					</div>
					<br> 
						<a class="yr-delete-button am-btn am-btn-default" id="deleteAlbum${list.indexid }">删除</a>
						<br><br><br><br><br><br>   
				</li>
			</c:forEach>
		</c:if>
		
	</ul>   
  
</div>

<!-- Modal -->
<div class="am-modal am-modal-prompt " tabindex="-1" id="addAlbumModal"
	style="margin-top: 300px;">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">相册名称</div>
		<div class="am-modal-bd">
			<input type="text" class="am-modal-prompt-input" id="albumName">
		</div>
		<div class="am-modal-footer">
			<span class="am-modal-btn">取消</span> <span class="am-modal-btn"
				id="addAlbumBtn">增加</span>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="am-modal am-modal-no-btn" tabindex="-1" id="addAlbumModal2"
	style="margin-top: 300px;">
	<div class="am-modal-dialog">
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

</div></div>


<script type="text/javascript">
var messageId = "";
var headText = "";
var parentId = "";
var spare1 = "";

$(document).ready(function() {
	var filename = "";
	$('#as').diyUpload({
	    url:'<%=basePath%>user/upload',
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
	
	
	$("#addAlbumBtn").click(function(){
		var name = $("#albumName").val();
		var data = "name="+name;
		var url = "<%=basePath%>album/addAlbum";
		 $.ajax({
		       	type : "POST",
		       	url : url,
		       	data : data,
		       	dataType : "json",
		       	success : function(data){
		       		if(data.msg=="success"){
		       			alert("添加成功");
		       			window.location = "<%=basePath%>album/allAlbum";
		       		}else{
		       			alert(data.msg);
		       		}
		      	}
		     			
		 });
		
	});
	
	$('#messageModal').on('open.modal.amui', function(){
// 		  alert('第一个演示弹窗打开了');
		});
	
	$("img[id^='imageDetail']").click(function(){
		$("#modalImage").prop("src",$(this).prop("src"))
// 		alert(11);
		
		 
	}); 
	

	$("a[id^='deleteAlbum']").click(function(){
		var flag = confirm("确定要删除该相册？");
		if(flag){
		
		var val = $(this).prop("id").substring(11);
		var data = "albumId="+val
		console.log("data="+data);
		var url = "<%=basePath%>album/deleteAlbum";
		 $.ajax({
		       	type : "POST",
		       	url : url,
		       	data : data,
		       	dataType : "json",
		       	success : function(data){
		       		if(data.msg=="success"){
		       			alert("删除成功");
		       			window.location = "<%=basePath%>album/allAlbum";
		       		}else{
		       			alert(data.msg);
		       		}
		      	}
		     			
	});
		}
	});
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


