<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>

<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<script>
function validateForm(form){
    if(!form.user_id.value){
        alert("아이디를 입력하세욧");
        return false;
    }
    if(form.user_pw.value === ""){ 
        alert("패스워드를 입력하세욧");
        return false;
    }
    return true;
}
</script>

</head>
<body class="bg-neutral-700 text-white p-8 min-h-screen">
    
    <div class="mb-8 text-white"> 
	    <jsp:include page="../common/Link.jsp"></jsp:include>
    </div>
    
    <div class="max-w-md mx-auto p-8 bg-white rounded-xl shadow-2xl shadow-black/50 border border-neutral-200">
        
        <h2 class="text-3xl font-bold mb-8 text-black border-b-2 border-red-700 pb-2">로그인 페이지</h2>
        
        <span class="block mb-6 text-center text-red-700 font-semibold">
        <%=
            request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg")
        %>
        </span>
        
        <%
        if (session.getAttribute("UserId") == null){
            %>
            
            <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);" class="space-y-6">
                
                <div>
                    <label for="user_id" class="block text-sm font-medium mb-1 text-neutral-800">아이디</label>
                    <input type="text" name="user_id" id="user_id" 
                           class="w-full p-3 border border-neutral-300 rounded-lg bg-neutral-50 text-black focus:ring-red-700 focus:border-red-700" />
                </div>
                
                <div>
                    <label for="user_pw" class="block text-sm font-medium mb-1 text-neutral-800">패스워드</label>
                    <input type="password" name="user_pw" id="user_pw" 
                           class="w-full p-3 border border-neutral-300 rounded-lg bg-neutral-50 text-black focus:ring-red-700 focus:border-red-700" />
                </div>
                
                <input type="submit" value="로그인하기" 
                       class="w-full bg-red-700 text-white font-bold py-3 rounded-lg hover:bg-red-600 transition duration-150 cursor-pointer shadow-lg shadow-black/50 transform hover:scale-[1.01]" />
            </form>
            
        <%
        } else{
        %>	
            <div class="text-center p-6 bg-neutral-100 rounded-lg border border-neutral-300 text-black">
                <p class="text-xl font-bold mb-3"><%= session.getAttribute("UserName")	%> 회원님, 로그인하셨습니다.</p>
                <a href="Logout.jsp" class="text-red-700 hover:text-red-600 underline">[로그아웃]</a>
            </div>
        <%
        }
        %>
    </div>
    
</body>
</html>