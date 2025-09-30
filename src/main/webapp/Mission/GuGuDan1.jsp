<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 1</title>
</head>
<body>
	<%
		for (int i = 2; i <= 9; i++) {
			out.println("<tr>");
			out.println(String.format("<td><h2>" + i + "단</h2></td>"));
			for (int j = 1; j <= 9; j++) {
				out.println(i + " * " + j + " = " + i * j + "<br />");
			}
			out.println("</tr>");
		}

	%>
</body>
</html>