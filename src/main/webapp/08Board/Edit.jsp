<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
String sessionId = session.getAttribute("UserId").toString();
if (!sessionId.equals(dto.getId())) {
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다", out);
	return;
}

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<script type="text/javascript">
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body class="bg-neutral-700 text-white p-8 min-h-screen">

	<div class="mb-8 text-white">
		<jsp:include page="../common/Link.jsp"></jsp:include>
	</div>

	<h2
		class="text-3xl font-bold mb-8 text-white border-b-2 border-red-700 pb-2">회원제
		게시판 - 수정하기(Edit)</h2>

	<div
		class="max-w-4xl mx-auto p-8 bg-white rounded-xl shadow-2xl shadow-black/30 border border-neutral-200 overflow-hidden">

		<form name="writeFrm" method="post" action="EditProcess.jsp"
			onsubmit="return validateForm(this);" class="text-black">

			<input type="hidden" name="num" value="<%=dto.getNum()%>" />

			<table class="w-full">
				<tbody class="divide-y divide-neutral-200">

					<tr>
						<td
							class="w-[15%] p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center">제목</td>
						<td class="p-3"><input type="text" name="title"
							value="<%=dto.getTitle()%>"
							class="w-full p-2 border border-neutral-300 rounded-lg bg-neutral-50 text-black focus:ring-red-700 focus:border-red-700" />
						</td>
					</tr>

					<tr>
						<td
							class="w-[15%] p-3 font-semibold bg-neutral-100 border-r border-neutral-200 text-center align-top">내용</td>
						<td class="p-3"><textarea name="content"
								style="height: 550px;"
								class="w-full p-2 border border-neutral-300 rounded-lg bg-neutral-50 text-black focus:ring-red-700 focus:border-red-700 resize-y"><%=dto.getContent()%></textarea>
						</td>
					</tr>

					<tr>
						<td colspan="2" class="p-4 text-center bg-neutral-100">
							<div class="flex justify-center space-x-4">

								<button type="submit"
									class="bg-neutral-800 text-white font-bold py-2 px-8 rounded-lg hover:bg-red-700 transition duration-150 cursor-pointer shadow-lg shadow-black/50 transform hover:scale-[1.01]">
									작성완료</button>

								<button type="reset"
									class="bg-neutral-800 text-white font-semibold py-2 px-6 rounded-lg hover:bg-red-700 transition duration-150 shadow-md">
									다시 입력</button>

								<button type="button" onclick="location.href='List.jsp';"
									class="bg-neutral-800 text-white font-semibold py-2 px-6 rounded-lg hover:bg-red-700 transition duration-150 shadow-md">
									목록 보기</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>