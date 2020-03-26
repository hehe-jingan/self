<%@page import="com.book.pojo.Content"%>
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
<%@include file="model/adminHeader.jsp"%>
<%
	String pageFlag = "false";
	Content content = new Content();
	if (request.getAttribute("content") != null) {
		content = (Content) request.getAttribute("content");
		pageFlag = "true";
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
									<strong class="card-title" v-if="headerText">留言详情</strong>
								</div>

								<div class="card-body">
									<div class="col-lg-8">
										<div class="card">
											<div class="card-header">
<%-- 												<strong class="card-title">《<%=content.getName()%>》 --%>
<!-- 												</strong> -->
											</div>
											<div class="card-body">
												<table class="table">
													<tbody>
														<tr>
															<td>姓名：<%=content.getName()%></td>
														</tr>

														<tr>
															<td>邮箱:<%=content.getMail()%></td>
														</tr>
														<tr>
															<td>标题：<%=content.getTitle()%></td>
														</tr>
														<tr>
															<td>留言内容：<%=content.getMessage()%></td>
														<tr>
															<td>留言时间：<%=content.getInputdate() == null ? "" : sdf.format(content.getInputdate())%></td>
														</tr>

													</tbody>
												</table>
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

			if (pageFlag == "false") {
				alert("暂无此留言！！！");
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
