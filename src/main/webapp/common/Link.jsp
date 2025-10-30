<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="w-full">
	<div class="max-w-7xl mx-auto flex justify-center items-center space-x-6 px-4 py-2">
		
		<% if (session.getAttribute("UserId")==null) { %>
			<a href = "../06Session/LoginForm.jsp" 
               class="py-1 px-3 text-white font-semibold rounded-lg bg-neutral-900  hover:bg-red-700 transition duration-150">
                로그인
            </a>
		<% } else { %>
			<a href = "../06Session/Logout.jsp" 
               class="py-1 px-3 text-white font-semibold rounded-lg bg-neutral-900 hover:bg-red-700 transition duration-150">
                로그아웃
            </a>
		<% } %>
			
		<a href = "../08Board/List.jsp" 
           class="py-1 px-3 text-white font-semibold rounded-lg bg-neutral-900 hover:bg-red-700 transition duration-150">
            게시판(페이징X)
        </a>
			
		<a href = "../09PagingBoard/List.jsp" 
           class="py-1 px-3 text-white font-semibold rounded-lg bg-neutral-900 hover:bg-red-700  transition duration-150">
            게시판(페이징O)
        </a>
			
	</div>
</div>