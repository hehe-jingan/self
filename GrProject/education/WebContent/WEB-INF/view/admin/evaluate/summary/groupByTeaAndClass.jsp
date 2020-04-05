<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.education.pojo.Evaluation"%>
<%@page import="com.education.pojo.Teacher"%>
<%@page import="com.education.pojo.Classes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%

// List<Classes> classLists = new ArrayList<Classes>();
// if (request.getAttribute("classLists") != null) {
// 	classLists = (List<Classes>) request.getAttribute("classLists");
// }
// List<Teacher> teaLists = new ArrayList<Teacher>();
// if (request.getAttribute("teaLists") != null) {
// 	teaLists = (List<Teacher>) request.getAttribute("teaLists");
// }
// List<String> yearLists = new ArrayList<String>();
// if (request.getAttribute("yearLists") != null) {
// 	yearLists = (List<String>) request.getAttribute("yearLists");
// }
// List<Course> courseLists = new ArrayList<Course>();
// if (request.getAttribute("courseLists") != null) {
// 	courseLists = (List<Course>) request.getAttribute("courseLists");
// }
	List<Evaluation> list2 = null;
	if (request.getAttribute("evLists") != null) {
		list2 = (List<Evaluation>) request.getAttribute("evLists");
		
	}
%>
<!-- <div class="form-group col-md-10 " > -->
<!-- 								<label for="cc-year" class="control-label mb-1 col-md-2">搜索条件</label>  -->
<!-- 											<label for="cc-year" class="control-label mb-1 col-md-1">年度学期</label>  -->
<!-- 										style="font-size: 15px;" -->
		<div class="form-group col-md-10 " >
								<label for="cc-year" class="control-label mb-1 col-md-2">搜索条件</label> 
<!-- 											<label for="cc-year" class="control-label mb-1 col-md-1">年度学期</label>  -->
<!-- 										style="font-size: 15px;" -->
											<select  data-placeholder="Choose a year" id="chooseYear" name="chooseYear" class="col-md-2" tabindex="1">
												<option value="all">所有学年学期</option>
												<%
												if(yearLists!=null||yearLists.size()!=0){
													for(int i=0;i<yearLists.size();i++){
														String temp = yearLists.get(i);
														if(temp.equals(chooseYear)){
												%>
												<option selected="selected" value="<%=temp %>"><%=temp %></option>
												<%}else{ %>
												<option value="<%=temp %>"><%=temp %></option>
												<%	
												}}}
												%>
												
											</select>
<!-- 											<label for="cc-course" class="control-label mb-1 col-md-1 offset-md-1">课程</label>  -->
											
<!-- 											<label for="cc-course" class="control-label mb-1 col-md-1 offset-md-1">班级</label>  -->
<!-- 											<label for="cc-course" class="control-label mb-1 col-md-1 offset-md-1">教师</label>  -->
											<select data-placeholder="Choose a course" id="chooseTea" name="chooseTea" class=" col-md-2" tabindex="1">
												<option value="0">所有教师</option>
												<%
												if(teaLists!=null||teaLists.size()!=0){
													for(int i=0;i<teaLists.size();i++){
														Teacher temp = teaLists.get(i);
												if(chooseTea.equals(temp.getIndexid())){
												%>
												<option selected="selected" value="<%=temp.getIndexid() %>"><%=temp.getName() %></option>
												<%}else{ %>
												<option value="<%=temp.getIndexid() %>"><%=temp.getName() %></option>
												<%	
												}}}
												%>
											</select>
										</div>								
<table id="bootstrap-data-table2"
	class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>编号</th>
			<th>学年学期</th>
<!-- 			<th>课程名称</th> -->
<!-- 			<th>班级名称</th> -->
			<th>任课教师</th>
			<th>评价人数</th>
<!-- 			<th>评价总分</th> -->
			<th>评价平均分</th>
		</tr>
	</thead>
	<tbody>
		<%
			if (list2 != null) {
				for (int i = 0; i < list2.size(); i++) {
					String year = list2.get(i).getYear();
		%>
		<tr>
			<td><%=i + 1%></td>
			
			<td><%=year.substring(0, 4) + "年度第" + year.substring(4, 6) + "学期"%></td>
<%-- 			<td><%=list2.get(i).getCourse().getName()%></td> --%>
<%-- 			<td><%=list2.get(i).getClName()%></td> --%>
			<td><%=list2.get(i).getTeacher().getName()%></td>
<%-- 			<td><%=year.substring(0, 4) + "年度第" + year.substring(4, 6) + "学期"%></td> --%>
			<td><%=list2.get(i).getEvacount()%></td>
<%-- 			<td><%=list2.get(i).getEvatotal()%></td> --%>
			<td><%=list2.get(i).getEvaavg()%></td>
		</tr>
		<%
			}
			}
		%>
	</tbody>
</table>