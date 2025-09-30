<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 2</title>
</head>
<body>
	<%
	out.println("<table>");
	out.println("<tr>");
	for (int i = 2; i <= 9; i++) {
		out.println(String.format("<th>" + i + "단</th>"));
		out.println(String.format("<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>"));
	}
	out.println("</tr>");
	out.println("<tr>");
	for (int i = 2; i <= 9; i++) {
		out.println("<td>");
		for (int j = 1; j <= 9; j++) {
			out.println(i + " * " + j + " = " + i * j + "<br />");
		}
		out.println("</td>");
		out.println(String.format("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"));
	}
	out.println("</tr>");
	out.println("</table>");
	%>
</body>
</html>