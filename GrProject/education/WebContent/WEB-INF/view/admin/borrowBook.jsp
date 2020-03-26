<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.book.pojo.Book"%>
<%@page import="com.book.pojo.User"%>
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
<%@include file="model/adminHeader.jsp"%>
<%
 String pageFlag = "false";
 Book book = new Book();
 book.setAuthor("");
 book.setName("");
 book.setPublish("");
 if(request.getAttribute("book")!=null){
	 book = (Book)request.getAttribute("book");
	 pageFlag = "true";
 }
 List<User> userList = null;
 if(request.getAttribute("userLists")!=null){
	 userList = (List<User>)request.getAttribute("userLists");
 }
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
String certNo = request.getParameter("certNo");
System.out.println("certNo="+request.getParameter("certNo"));
 %>
</head>

<body>
	<!-- Left Panel -->
	<%@include file="model/adminMenu.jsp"%>
	<!-- /#left-panel -->
	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<%@include file="model/adminTitle.jsp"%>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">

			<div class="animated fadeIn">

				<div class="ui-typography">
					<div class="row">
						<div class="col-md-12">


							<div class="card">
								<div class="card-header">
									<strong class="card-title" v-if="headerText">书籍借阅</strong>
								</div>

								<div class="card-body">

									<div class="typo-headers">
										<div class="col-lg-6 off-lg-3">
											<div class="card">
												<div class="card-header">
													<strong class="card-title">书籍信息</strong>
												</div>
												<div class="card-body">
													<table class="table">
														<tbody>
															<tr>
																<th scope="row">书名：《<%=book.getName() %>》
																</th>
																<td>作者：<%=book.getAuthor() %></td>
																<td>出版社:<%=book.getPublish() %></td>
																<td rowspan="4"><img alt="封面" class="float-right"
																	src="<%=basePath %>../book/image/<%=book.getPicurl()%>"
																	width="100px"></td>
															</tr>
															<tr>
																<th scope="row">价格：<%=book.getPrice() %></th>
																<td>库存数量：<%=book.getTotalcount() %></td>
																<td>入库时间：<%=book.getInputdate()==null?"暂未入库":sdf.format(book.getInputdate()) %></td>
															</tr>
															<tr>
																<th scope="row">借阅次数：<%=book.getBorrowcount() %></th>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">借阅信息</strong>
                            </div>
                            <div class="card-body">
                            <form  id="form5">
                                <table class="table">
                                  <tbody>
                                    <tr>
                                        <td scope="row">借书卡号: 
                                        
                                        <select data-placeholder="输入图书卡号" id="certNo" name="certNo" multiple class="standardSelect" tabindex="5">
                        <option value="" label="default"></option>
                        <optgroup label="选择借书卡号">
                         <% if(userList!=null){
                  	for(int i = 0;i<userList.size();i++){
                  %>
                  <option value="<%=userList.get(i).getCertno() %>"><%=userList.get(i).getCertno() %></option>
                    <%}
                  	} %>
                          
                      </optgroup>
                  </select>
                                    </tr>
                                    <tr>
                                        <td scope="row">借阅天数：<input type="number"  id="days" name="days" value="" placeholder="输入整数天数" class="" aria-required="true" aria-invalid="false" ></td>
                                    </tr>
                                </tbody>
                                </form>
                            </table>
                            <button type="button" id="borrow"
												class="btn btn-lg btn-success">
												<span id="payment-button-amount">借阅</span>
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
		    <link rel="stylesheet" href="<%=basePath %>static/back/assets/css/lib/chosen/chosen.min.css">
    <script src="<%=basePath %>static/back/assets/js/lib/chosen/chosen.jquery.min.js"></script>
		<script>
    $(document).ready(function() {
    	
    	var pageFlag = "<%=pageFlag%>";
    	var certNo = "<%=certNo%>";
    	
    	if(certNo!=""){
    		$("#certNo").val(certNo);
    	}
    	
    	$("#borrow").click(function(){
    		
    		var day = $("#days").val();
    		var certNo = $("#certNo").val();
    		
    		if(certNo==null||certNo==""){
    			alert("请选择借书卡！！");
    		}else if(certNo.length>1){
    			alert("请选择一张借书卡！！");
    		}else if(day==""){
    			alert("请输入借书天数！！")
    		}else if(day.indexOf(".")>-1){
    			alert("请输入整数天数！！");
    		}else if(day > 30){
    			alert("最多可借30天！！！");
    		}else{
    			
    			var url = "<%=basePath%>admin/bookBorrow";
    			var data = "day="+day+"&certNo="+certNo+"&bookId="+<%=book.getId()%>;
    			console.log("data="+data);
    			$.ajax({
   			       	type : "POST",
   			       	url : url,
   			       	data : data,
   			       	dataType : "json",
   			       	success : function(data){
   			       		if(data.msg=="SUCCESS"){
   			       			alert("借阅成功！！");
   			       		if(certNo!=""){
   			       		window.location = "<%=basePath%>admin/onlineBookList";
   			     	}else{
   			       			window.location = "<%=basePath%>admin/borrowBookList";
   			     	}
   			       		}else{
   			       			alert(data.msg);
   			       		}
   			      	}
   			     			
   			 });
    			
    			
    			
    		}
    		 
     		
    	});
    	
    		   	  
    	    	jQuery(".standardSelect").chosen({
    	            disable_search_threshold: 10,
    	            no_results_text: "Oops, nothing found!",
    	            width: "200px"
    	        });
    	    	
    	
    	if(pageFlag == "false"){
    		alert("暂无此书籍！！！");
    		window.history.go(-1);
    	}
    	 //返回
      	 $("#returnBack").click(function(){
      		window.history.go(-1);
      	 });
    	
    	
    });
    </script>
</body>
</html>
