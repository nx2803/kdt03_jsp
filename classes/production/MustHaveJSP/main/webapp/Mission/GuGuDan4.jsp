<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단4</title>
</head>
<body>
<%
	int d = 3;
	try {
		String dd = request.getParameter("dan");
		if (dd != null && !dd.trim().isEmpty()) {
		    d = Integer.parseInt(dd);
		}
		if (d < 1) d = 2; 
		int f = 2;
		int bb = 9 / d;
		for(int k = 0; k < bb; k++){
			out.println("<table>");
			out.println("<tr>");
			for (int i = f; i <= f+d-1; i++) {
				if(i==10){
					break;
				}
				out.println(String.format("<th>" + i + "단</th>"));
				out.println(String.format("<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>"));
			}
			
			out.println("</tr>");
			out.println("<tr>");
			for (int i = f; i <= f+d-1; i++) {
				if(i==10){
					break;
				}
				out.println("<td>");
				for (int j = 1; j <= 9; j++) {
					out.println(i + " * " + j + " = " + i * j + "<br />");
				}
				out.println("</td>");
				out.println(String.format("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"));
			}
			out.println("</tr>");
			out.println("</table>");
			f+=d;
		}
			out.println("<table>");
			out.println("<tr>");
			for (int i = f; i <= 9; i++) {
				out.println(String.format("<th>" + i + "단</th>"));
				out.println(String.format("<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>"));
				if(i==10){
					break;
				}
			}
			
			out.println("</tr>");
			out.println("<tr>");
			for (int i = f; i <= 9; i++) {
				if(i==10){
					break;
				}
				out.println("<td>");
				for (int j = 1; j <= 9; j++) {
					out.println(i + " * " + j + " = " + i * j + "<br />");
				}
				
				out.println("</td>");
				out.println(String.format("<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>"));
			}
			out.println("</tr>");
			out.println("</table>");			
	} catch (Exception e) {
		out.println("예외 발생 : 잘못된 단수.");
	}
	%>
</body>
</html>