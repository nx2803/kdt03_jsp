<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 인덱스</title>
</head>
<body>
<form action="GuGuDanProc.jsp" method="post">

        <input type="radio" id="1" name="gugudan" value="GuGuDan1.jsp" checked>
        <label for="male">Type1: 세로</label><br>

        <input type="radio" id="2" name="gugudan" value="GuGuDan2.jsp">
        <label for="female">Type2: 가로</label><br>
        
        <input type="radio" id="3" name="gugudan" value="GuGuDan3.jsp">
        <label for="other">Type3: 하나만 출력</label><br>
        
        <input type="radio" id="4" name="gugudan" value="GuGuDan4.jsp">
        <label for="other">Type4: 여러개씩 묶어서 출력</label><br>
        <input type="text" name="num" value= > 단수/열수<br>
    	<button type="submit">선택</button>
</form>
</body>
</html>