<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body class="bg-neutral-700 text-white p-8 min-h-screen">

	<div class="mb-8 text-white">
		<jsp:include page="../common/Link.jsp"></jsp:include>
	</div>

	<h2
		class="text-3xl font-bold mb-8 text-white border-b-2 border-red-700 pb-2">목록
		보기(List)</h2>

	<form method="get" class="mb-8 flex items-center space-x-3 p-4">
		<div class="flex-grow flex items-center space-x-2">
			<select name="searchField"
				class="border border-neutral-300 rounded-lg p-2 focus:ring-red-700 focus:border-red-700 bg-neutral-50 text-black text-sm">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="searchWord"
				class="border border-neutral-300 rounded-lg p-2 w-72 focus:ring-red-700  bg-neutral-50 text-black text-sm"
				placeholder="검색어를 입력하세요" />
				<input type="submit" value="검색하기"
			class="bg-neutral-900 text-white font-semibold py-2 px-6 rounded-lg hover:bg-red-700 transition duration-150 cursor-pointer shadow-lg" />
		
		</div>
		<button type="button" onclick="location.href='Write.jsp';"
			class="bg-neutral-900 text-white font-bold py-2 px-8 rounded-lg shadow-xl hover:bg-red-700 transition duration-150 transform hover:scale-[1.01]">
			글쓰기</button>
	</form>

	<table
		class="min-w-full bg-white shadow-2xl rounded-xl overflow-hidden">
		<thead>
			<tr
				class="bg-neutral-800 text-white uppercase text-sm leading-normal border-b-2 border-red-700">
				<th class="py-3 px-6 text-center">번호</th>
				<th class="py-3 px-6 text-center">제목</th>
				<th class="py-3 px-6 text-center">작성자</th>
				<th class="py-3 px-6 text-center">조회수</th>
				<th class="py-3 px-6 text-center">작성일</th>
			</tr>
		</thead>
		<tbody class="text-black text-sm font-light">
			<%
			if (boardLists.isEmpty()) {
			%>
			<tr>
				<td colspan="5"
					class="py-5 px-6 text-center bg-neutral-50 italic text-neutral-500">사이트
					망했습니다. (아직 게시글이 없습니다.)</td>
			</tr>
			<%
			} else {
			int virtualNum = 0;
			for (BoardDTO dto : boardLists) {
				virtualNum = totalCount--;
			%>
			<tr
				class="border-t border-neutral-200 hover:bg-neutral-50 transition duration-150">
				<td class="py-3 px-6 whitespace-nowrap text-center"><%=virtualNum%></td>
				<td class="py-3 px-6 text-left"><a
					href="View.jsp?num=<%=dto.getNum()%>"
					class="text-black font-medium hover:text-red-700 transition duration-150"><%=dto.getTitle()%></a>
				</td>
				<td class="py-3 px-6 text-center"><%=dto.getId()%></td>
				<td class="py-3 px-6 text-center"><%=dto.getVisitcount()%></td>
				<td class="py-3 px-6 whitespace-nowrap text-center"><%=dto.getPostdate()%></td>
			</tr>
			<%
			}
			}
			%>
		</tbody>
	</table>


</body>
</html>