<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.book.pojo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%@taglib uri="/WEB-INF/fn.tld" prefix="fn"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>图书馆后台管理</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="model/userHeader.jsp"%>
<%
	String pageFlag = "false";
	Book book = new Book();
	book.setAuthor("");
	book.setName("");
	book.setPublish("");
	if (request.getAttribute("book") != null) {
		book = (Book) request.getAttribute("book");
		pageFlag = "true";
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
</head>

<body>
	<!-- Left Panel -->
	<%@include file="model/userMenu.jsp"%>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="model/userTitle.jsp"%>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">

			<div class="animated fadeIn">

				<div class="ui-typography">
					<div class="row">
						<div class="col-md-12">


							<div class="card">
								<div class="card-header">
									<strong class="card-title" v-if="headerText">书籍详情</strong>
								</div>

								<div class="card-body">
									<div class="col-lg-8">
										<div class="card">
											<div class="card-header">
												<strong class="card-title">《<%=book.getName()%>》
												</strong>
											</div>
											<div class="card-body">
												<table class="table">
													<tbody>
														<tr>
															<td>作者：<%=book.getAuthor()%></td>
															<td></td>
															<td rowspan="6"><img alt="封面" class="float-right"
																src="<%=basePath%>../book/image/<%=book.getPicurl()%>"
																width="250px"></td>

														</tr>

														<tr>
															<td>出版社:<%=book.getPublish()%></td>
															<td></td>
														</tr>
														<tr>
															<td>图书状态：<%=book.getStatus()%></td>
															<td></td>
														</tr>
														<tr>
															<td>库存数量：<%=book.getTotalcount()%></td>
															<td>入库时间：<%=book.getInputdate() == null ? "暂未入库" : sdf.format(book.getInputdate())%></td>
														</tr>

														<tr>
															<td scope="row">价格：<%=book.getPrice()%></td>
															<td scope="row">借阅次数：<%=book.getBorrowcount()%></td>
														</tr>
														<tr>
															<%
																if (book.getDocurl() == null) {
															%>
															<td>是否可以在线阅读：否</td>
															<%
											} else {
										%>
															<td>是否可以在线阅读：是</td>
															<td>在线阅读次数：<%=book.getReadcount()%></td>
															<%
											}
										%>
														</tr>
														<tr ><td colspan="2"></td></tr>
														<tr>
														<td colspan="2">评论列表：</td>
														</tr>
														<%
														List<HashMap<String,Object>> bookContentList = null;
														if(request.getAttribute("bookContentList")!=null){
															bookContentList = (List<HashMap<String,Object>>)request.getAttribute("bookContentList");
														}
														if(bookContentList==null||bookContentList.size()==0){%>
														<tr>
														<td colspan="2">暂无评论</td>
														</tr>
														<%	
														}else{
															for(int i = 0;i<bookContentList.size();i++){
																
															
														%>
														<tr>
														<td><%=bookContentList.get(i).get("userName") %>: <%=bookContentList.get(i).get("contentVal") %></td>
														<td><%=sdf.format(bookContentList.get(i).get("contentDate")) %></td>
														<%
														if(user.getId()==bookContentList.get(i).get("userId")){
														%>
														<td><a href="" id="deleteBookContent<%=bookContentList.get(i).get("bookContentId")%>">删除</a></td>
														<%} %>
														</tr>
														
														
														<%}} %>
														<tr>
														<td colspan="2"><textarea rows="3" cols="50" id="val" name="val"></textarea></td>
														</tr>
														
														
													</tbody>
												</table>
												<button type="button" id="content"
													class="btn btn-lg btn-info">
													
													<span id="payment-button-amount">评论</span>
												</button>
												<button type="button" id="returnBack"
													class="btn btn-lg btn-info">
													
													<span id="payment-button-amount">返回</span>
												</button>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Animated -->
					<!--             <br/><br/><br/><br/> -->
					<!--             <br/><br/><br/><br/> -->
					<!--             <br/><br/><br/><br/> -->
					<!--             <br/><br/><br/><br/> -->
					<!--             <br/><br/> -->
					<!-- .animated -->
				</div>
			</div>
		</div>

		<!-- /.content -->
		<div class="clearfix"></div>
		<!-- Footer -->
		<footer class="site-footer">
			<div class="footer-inner bg-white">
				<div class="row">
					<div class="col-sm-6">
						Copyright &copy; 2019 Library. </a>
					</div>
					<div class="col-sm-6 text-right">Designed by Hualing</div>
				</div>
			</div>
		</footer>
		<!-- /.site-footer -->
	</div>
	<!-- /#right-panel -->

	<!--Local Stuff-->
	<script>
	
	
    $(document).ready(function() {
    	var pageFlag = "<%=pageFlag%>";

    	var userId = "<%=userId%>";
    	var bookId = "<%=book.getId()%>";
    	
    	$("a[id^='deleteBookContent']").click(function(){
    		
    		var id = $(this).prop("id").substring(17);
    		var url = "<%=basePath%>user/deleteBookContent";
    		
    		if(confirm("确定删除该评论吗？")){
    			 $.ajax({
 			       	type : "POST",
 			       	url : url,
 			       	data : "bookContentId="+id,
 			       	dataType : "json",
 			       	success : function(data){
 			       		if(data.msg=="SUCCESS"){
 			       			alert("删除成功！！");
 			       			window.location = "<%=basePath%>user/bookDetail/<%=book.getId()%>";
 			       		}else{
 			       			alert(data.msg);
 			       		}
 			      	}
 			     			
 			 });
    		}
    		
    	});
    	
    	$("#content").click(function(){
    		var val = $("#val").val();
    		var url = "<%=basePath%>user/addBookContent";
    		var data = "userId="+userId+"&bookId="+bookId+"&val="+val;
    		if(val==""){
    			alert("请输入评论内容！！");
    		}else{
    			
    		
    		 $.ajax({
			       	type : "POST",
			       	url : url,
			       	data : data,
			       	dataType : "json",
			       	success : function(data){
			       		if(data.msg=="SUCCESS"){
			       			alert("评论成功！！");
			       			window.location = "<%=basePath%>user/bookDetail/<%=book.getId()%>";
			       		}else{
			       			alert(data.msg);
			       		}
			      	}
			     			
			 });
    		}
    		
    	})
    	
    	
			if (pageFlag == "false") {
				alert("暂无此书籍！！！");
				window.history.go(-1);
			}
			//返回
			$("#returnBack").click(function() {
				window.history.go(-1);
			});

		});
	</script>
</body>
</html>
