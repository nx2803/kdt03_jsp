<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<meta charset="UTF-8">
<title>게시물 등록</title>
<script>
function validateForm(form){
    if(!form.title.value){
        alert("제목을 입력하세욧");
        form.title.focus();
        return false;
    }
    if(!form.content.value){ 
        alert("내용을 입력하세욧");
        form.content.focus();
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
    
    <div class="max-w-4xl mx-auto p-8 bg-white rounded-xl shadow-2xl shadow-black/30 border border-neutral-200">
        
        <h2 class="text-3xl font-bold mb-8 text-black border-b-2 border-red-700 pb-2">게시물 등록</h2>
        
        <form action="WriteProcess.jsp" method="post" name="writeFrm" onsubmit="return validateForm(this);">
            
            <div class="mb-6">
                <label for="title" class="block text-base font-semibold mb-2 text-neutral-800">제목</label>
                <input type="text" name="title" id="title"
                       class="w-full p-3 border border-neutral-300 rounded-lg bg-neutral-50 text-black focus:ring-red-700 focus:border-red-700" />
            </div>
            
            <% 
            String userId = (String)session.getAttribute("UserId"); 
            if(userId != null) {
            %>
            <div class="mb-6">
                <label class="block text-base font-semibold mb-2 text-neutral-800">작성자</label>
                <input type="text" value="<%=userId%>" readonly
                       class="w-full p-3 border border-neutral-300 rounded-lg bg-neutral-100 text-neutral-600 cursor-not-allowed" />
            </div>
            <% } %>

            <div class="mb-8">
                <label for="content" class="block text-base font-semibold mb-2 text-neutral-800">내용</label>
                <textarea name="content" id="content" rows="15" 
                          class="w-full p-3 border border-neutral-300 rounded-lg bg-neutral-50 text-black focus:ring-red-700 focus:border-red-700 resize-y"></textarea>
            </div>
            
            <div class="flex justify-end space-x-4">
                
                <button type="button" onclick="location.href='List.jsp';"
                    class="bg-neutral-300 text-black font-semibold py-2 px-6 rounded-lg hover:bg-neutral-400 transition duration-150 shadow-md">
                    취소
                </button>
                
                <input type="submit" value="등록 완료" 
                       class="bg-red-700 text-white font-bold py-2 px-8 rounded-lg hover:bg-red-600 transition duration-150 cursor-pointer shadow-lg shadow-black/50 transform hover:scale-[1.01]" />
            </div>
        </form>
    </div>
    
</body>
</html>