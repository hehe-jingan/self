<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%

List<Evaluation> listT = null;
if (request.getAttribute("listT") != null) {
	listT = (List<Evaluation>) request.getAttribute("listT");
}
%>
<table id="bootstrap-data-table"
	class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>编号</th>
			<th>任课教师</th>
<!-- 			<th>课程名称</th> -->
<!-- 			<th>学年学期</th> -->
			<th>评价人数</th>
			<th>评价总分</th>
			<th>评价平均分</th>
		</tr>
	</thead>
	<tbody>
		<%
			if (listT != null) {
				for (int i = 0; i < listT.size(); i++) {
					String year = listT.get(i).getYear();
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=listT.get(i).getTeacher().getName()%></td>
<%-- 			<td><%=listT.get(i).getCourse().getName()%></td> --%>
<%-- 			<td><%=year.substring(0, 4) + "年度第" + year.substring(4, 6) + "学期"%></td> --%>
			<td><%=listT.get(i).getEvacount()%></td>
			<td><%=listT.get(i).getEvatotal()%></td>
			<td><%=listT.get(i).getEvaavg()%></td>
		</tr>
		<%
			}
			}
		%>
	</tbody>
</table>