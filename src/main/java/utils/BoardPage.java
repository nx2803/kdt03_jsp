package utils;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		
		String pagingStr = "<div class='flex justify-center items-center mt-6 space-x-1'>";
		
		int totalPages = (int) (Math.ceil(((double)totalCount / pageSize)));
		

		String baseClass = " text-center inline-flex min-w-12 justify-center  items-center px-3 py-2 text-2xl font-medium  rounded-xl text-white bg-neutral-900 transition duration-150 hover:bg-red-700 hover:text-white";
		
	
		String currentClass = "z-10 border-2 border-red-700 text-white font-bold  rounded-xl cursor-default";
		
		
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		
		// [시작] 및 [이전] 버튼
		if(pageTemp != 1) {
			// [시작] 버튼
			pagingStr += "<a class='" + baseClass + "' href='" + reqUrl + "?pageNum=1'>&laquo; 처음</a>";
			
			// [이전] 버튼
			pagingStr += "<a class='" + baseClass + "' href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>&lsaquo; 이전</a>";
		}
		
		
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				
				pagingStr += "<span class='" + baseClass + " " + currentClass + "'>" + pageTemp + "</span>";
				
			} else {
				
				pagingStr += "<a class='" + baseClass + "' href='" + reqUrl + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>";
			}
			pageTemp++;
			blockCount++;
			
		}
		
		
		if(pageTemp <= totalPages) {
			
			pagingStr += "<a class='" + baseClass + "' href='" + reqUrl + "?pageNum=" + pageTemp + "'>다음 &rsaquo;</a>";
			
			
			pagingStr += "<a class='" + baseClass + "' href='" + reqUrl + "?pageNum=" + totalPages + "'>끝 &raquo;</a>";
		}
		
		pagingStr += "</div>";
		return pagingStr;
	}
}