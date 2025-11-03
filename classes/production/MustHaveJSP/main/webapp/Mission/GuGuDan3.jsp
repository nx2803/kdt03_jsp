<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 3</title>
</head>
<body>
	<%
	try {
		int d = Integer.parseInt(request.getParameter("dan"));
		out.println(String.format("<th><h2>" + d + "단</h2></th>"));
		for (int j = 1; j <= 9; j++) {
			out.println(d + " * " + j + " = " + d * j + "<br />");
		}
	} catch (Exception e) {
		out.println("예외 발생 : 잘못된 단수.");
	}
	%>
</body>
</html>