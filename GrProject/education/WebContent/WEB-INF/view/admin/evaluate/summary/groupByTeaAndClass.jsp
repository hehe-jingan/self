<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/fmt.tld" prefix="fmt"%>
<%

	List<Evaluation> list2 = null;
	if (request.getAttribute("list2") != null) {
		list2 = (List<Evaluation>) request.getAttribute("list2");
	}
%>
<table id="bootstrap-data-table2"
	class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>编号</th>
			<th>任课教师</th>
			<th>班级名称</th>
<!-- 			<th>学年学期</th> -->
			<th>评价人数</th>
			<th>评价总分</th>
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
			<td><%=list2.get(i).getTeacher().getName()%></td>
			<td><%=list2.get(i).getClName()%></td>
<%-- 			<td><%=year.substring(0, 4) + "年度第" + year.substring(4, 6) + "学期"%></td> --%>
			<td><%=list2.get(i).getEvacount()%></td>
			<td><%=list2.get(i).getEvatotal()%></td>
			<td><%=list2.get(i).getEvaavg()%></td>
		</tr>
		<%
			}
			}
		%>
	</tbody>
</table>