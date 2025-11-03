<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
	<%
	int n1 = Integer.valueOf(request.getParameter("num1"));
	int n2 = Integer.valueOf(request.getParameter("num2"));
	String s = String.valueOf(n1 + n2);
	%>
	<h2>4. 넘넘섬</h2>
	
		sum : <input type="text" name="sum" value="<%= s %>" readonly="readonly"/><br /> 
		<input type="button" value="돌아가기" onclick="history.back()"/><br /> 
	
</body>
</html>