<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>

<style>
/* 전체 페이지 배경 및 중앙 정렬 */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f6f9; /* 연한 회색 배경 */
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh; /* 화면 전체 높이 사용 */
    margin: 0;
}

/* 로그인 컨테이너: 카드 형태 */
.login-container {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
    width: 100%;
    max-width: 380px;
    text-align: center;
}

/* 제목 스타일 */
h2 {
    color: #334e68;
    font-size: 24px;
    margin-bottom: 30px;
    font-weight: bold;
}

/* 오류 메시지 스타일 */
.error-message {
    color: #d9534f;
    font-weight: bold;
    display: block;
    margin-bottom: 20px;
}

/* 폼 요소 그룹핑 */
.form-group {
    margin-bottom: 20px;
    text-align: left;
}

/* 입력 필드 레이블 */
.form-group label {
    display: block;
    color: #5a6e7f;
    font-size: 14px;
    margin-bottom: 8px;
}

/* 입력 필드 (아이디, 패스워드) */
input[type="text"], 
input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #c8d3dd;
    border-radius: 8px;
    box-sizing: border-box; /* 패딩이 너비에 포함되도록 */
    transition: border-color 0.3s, box-shadow 0.3s;
    font-size: 16px;
}

input[type="text"]:focus, 
input[type="password"]:focus {
    border-color: #4c7cff; /* 포커스 시 색상 변경 */
    box-shadow: 0 0 0 3px rgba(76, 124, 255, 0.2); /* 부드러운 포커스 효과 */
    outline: none;
}

/* 제출 버튼 스타일 */
input[type="submit"] {
    width: 100%;
    background-color: #4c7cff; /* 파란색 버튼 */
    color: white;
    padding: 14px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s, box-shadow 0.3s;
}

input[type="submit"]:hover {
    background-color: #3b60f5;
    box-shadow: 0 6px 10px rgba(76, 124, 255, 0.3);
}

/* 로그인 성공 시 메시지 스타일 */
.welcome-message {
    color: #334e68;
    font-size: 18px;
    line-height: 1.6;
}

/* 로그아웃 링크 스타일 */
.logout-link {
    color: #4c7cff;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s;
    margin-top: 10px;
    display: inline-block;
}

.logout-link:hover {
    color: #3b60f5;
    text-decoration: underline;
}
</style>

<script>
function validateForm(form){
    if(!form.user_id.value){
        alert("아이디를 입력하세욧");
        return false; // ⭐ 필수: 폼 제출 중단
    }
    // "==" 대신 !form.user_pw.value (빈 문자열 검사 포함)를 사용하는 것이 일반적입니다.
    if(form.user_pw.value === ""){ 
        alert("패스워드를 입력하세욧");
        return false; // ⭐ 필수: 폼 제출 중단
    }
    return true; // 모든 검사 통과 시 폼 제출 허용
}
</script>

</head>
<body>
    
    <div class="login-container">
        
        <h2>로그인 페이지</h2>
        
        <span class="error-message">
        <%=
            request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg")
        %>
        </span>
        
        <%
        if (session.getAttribute("UserId") == null){
            %>
            
            <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
                <div class="form-group">
                    <label for="user_id">아이디</label>
                    <input type="text" name="user_id" id="user_id" />
                </div>
                <div class="form-group">
                    <label for="user_pw">패스워드</label>
                    <input type="password" name="user_pw" id="user_pw" />
                </div>
                <input type="submit" value="로그인하기" />
            </form>
        <%
        } else{
        %>	
            <div class="welcome-message">
                <%= session.getAttribute("UserName")	%> 회원님, 로그인하셨습니다.<br />
                <a href="Logout.jsp" class="logout-link">[로그아웃]</a>
            </div>
        <%
        }
        %>
    </div>
    
</body>
</html>