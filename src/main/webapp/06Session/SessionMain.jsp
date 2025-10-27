<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	long creationTime = session.getCreationTime();
	String creationTimesStr = dateFormat.format(new Date(creationTime));

	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = dateFormat.format(new Date(lastTime));
	%>

	<ul>
		<li>세션 유지 시간 : <%=session.getMaxInactiveInterval()%></li>
		<li>세션 아이디 : <%=session.getId()%></li>
		<li>최초 요청 시각 : <%= creationTimesStr %></li>
		<li>마지막 요청 시각 : <%=lastTimeStr %></li>

	</ul>
</body>
</html>