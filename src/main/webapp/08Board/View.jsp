<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script> 
<script>
    function deletePost() {
        var confirmed = confirm("정말로 삭제하시겠습니까?");
        if (confirmed) {
            var form = document.writeFrm;
            form.method = "post";
            form.action = "DeleteProcess.jsp"; 
            form.submit();

        }
    }
</script>
</head>
<body class="bg-neutral-700 text-white p-8 min-h-screen">
    
    <div class="mb-8 text-white"> 
        <jsp:include page="../common/Link.jsp"></jsp:include>
    </div>
    
    <h2 class="text-3xl font-bold mb-8 text-white border-b-2 border-red-700 pb-2">회원제 게시판 - 상세 보기(View)</h2>
    
    <form name="writeFrm" class="bg-white text-black rounded-xl shadow-2xl shadow-black/30 border border-neutral-200 mx-auto max-w-4xl overflow-hidden">
        <input type="hidden" name="num" value="<%=num%>" />
        
        <table class="w-full text-black">
            <tbody class="divide-y divide-neutral-200">
                
                <tr class="hover:bg-neutral-50 transition duration-150">
                    <td class="w-[10%] p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center rounded-tl-xl">번호</td>
                    <td class="w-[40%] p-3"><%=dto.getNum()%></td>
                    <td class="w-[10%] p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center">작성자</td>
                    <td class="w-[40%] p-3 rounded-tr-xl"><%=dto.getName()%></td>
                </tr>
                
                <tr class="hover:bg-neutral-50 transition duration-150">
                    <td class="p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center">작성일</td>
                    <td class="p-3"><%=dto.getPostdate()%></td>
                    <td class="p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center">조회수</td>
                    <td class="p-3"><%=dto.getVisitcount()%></td>
                </tr>
                
                <tr class="hover:bg-neutral-50 transition duration-150">
                    <td class="p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center">제목</td>
                    <td colspan="3" class="p-3"><%=dto.getTitle()%></td>
                </tr>
                
                <tr class="h-60">
                    <td class="p-3 font-semibold bg-neutral-100 border-r border-neutral-200 align-top text-center">내용</td>
                    <td colspan="3" class="p-3 align-top whitespace-pre-wrap"><%=dto.getContent().replace("\r\n", "<br/>")%></td>
                </tr>
                
                <tr>
                    <td colspan="4" class="p-4 text-center bg-neutral-100 rounded-b-xl">
                        <div class="flex justify-center space-x-4">
                            <%
                            if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
                            %>
                                <button type="button"
                                    onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';"
                                    class="bg-neutral-800 text-white font-semibold py-2 px-6 rounded-lg hover:bg-red-700 transition duration-150 shadow-md">
                                    수정하기
                                </button>
                                
                                <button type="button" onclick="deletePost();"
                                    class="bg-neutral-800 text-white font-bold py-2 px-8 rounded-lg hover:bg-red-700 transition duration-150 cursor-pointer shadow-lg shadow-black/50">
                                    삭제하기
                                </button> 
                            <%
                            }
                            %>
                            <button type="button" onclick="location.href='List.jsp';"
                                class="bg-neutral-800 text-white font-semibold py-2 px-6 rounded-lg hover:bg-red-700 transition duration-150 shadow-md">
                                목록 보기
                            </button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>