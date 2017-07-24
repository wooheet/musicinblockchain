<%@page import="com.fairmusic.dto.followDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%
		ArrayList<followDTO> followinglist = (ArrayList<followDTO>)request.getAttribute("followinglist");
		int size=followinglist.size();
	%>
</head>
<body>
	<h1>팔로잉 리스트 테스트</h1>
	<h3>팔로잉 수 : <%=size %></h3>
	<div align="center">
		<table class="table">
			<thead>
				<tr bgcolor='skyblue'>
					<th>내코드</th>
					<th>팔로잉한 사람의 코드</th>
					<th>팔로우 상태</th>
				</tr>
			</thead>
			<tbody>
				<%
		for (int i = 0; i < size; i++) {
			followDTO record = followinglist.get(i);
					%>
			<tr>
			<td><%=record.getArtist_code() %></td>
			<td><%=record.getArtist_follow_code() %></td>
			<td><%=record.getFollow_good_alive()%></td>
			</tr>
		<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>