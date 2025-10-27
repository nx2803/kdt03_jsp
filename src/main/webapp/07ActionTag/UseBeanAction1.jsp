<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h3>액션 태그로 폼값 한 번에 받기</h3>
	<jsp:useBean id="member" class="membership.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="member" />
	
	<ul>
		<li>id : <jsp:getProperty name="member" property="id" /></li>
		<li>비번 : <jsp:getProperty name="member" property="pass" /></li>
		<li>이름 : <jsp:getProperty name="member" property="name" /></li>
		<li>일자 : <jsp:getProperty name="member" property="regidate" /></li>
	</ul>
</body>
</html>