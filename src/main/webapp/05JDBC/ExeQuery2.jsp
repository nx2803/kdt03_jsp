<%@page import="common.JDBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.cj.jdbc.JdbcConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
<style>
    table {
        width: 30%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #181818;
        color: white;
    }

</style>
</head>
<body>
	<h2>회원 목록 조회 테스트(executeQuery() 사용)</h2>
	<table>
	<thead>
            <tr>
                <th>id</th>
                <th>pass</th>
                <th>name</th>
                <th>regidate</th>
            </tr>
        </thead>
        <tbody>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT id, pass, name, regidate FROM member";
	jdbc.stmt = jdbc.con.createStatement();
	
	jdbc.rs=jdbc.stmt.executeQuery(sql);
	
	while (jdbc.rs.next()){
		String id = jdbc.rs.getString(1);
		String pw = jdbc.rs.getString(2);
		String name = jdbc.rs.getString("name");
		java.sql.Date regidate = jdbc.rs.getDate("regidate");
		
		out.println("<tr>");
        out.println("<td>" + id + "</td>");
        out.println("<td>" + pw + "</td>");
        out.println("<td>" + name + "</td>");
        out.println("<td>" + regidate + "</td>");
        out.println("</tr>");
		
	}
	
	jdbc.close();
	%>
	</tbody>
	</table>
	
</body>
</html>