// FilmNote/src/main/java/movie.bean.MoviePaging.java
package movie.bean;

import lombok.Data;

@Data
public class MoviePaging {

	private int currentPage; // 현재 페이지
	private int pageBlock; // [이전] [1] [2] [3] [다음]
	private int pageSize; // 1페이지당 글 개수
	private int totalA; // 총 글 수
	private StringBuffer pagingHTML;
	
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize - 1) / pageSize;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalP) endPage = totalP;
		
		if (startPage != 1)
				pagingHTML.append("<span id='paging' onclick='moviePaging(" + (startPage - 1) + ")'>이전</span>");
		
		for (int i = startPage; i<=endPage; i++ ) {
			if ( i == currentPage)
				pagingHTML.append("<span id='currentPaging' onclick='moviePaging(" + i + ")'>" + i + "</span>");
			else
				pagingHTML.append("<span id='paging' onclick='moviePaging(" + i + ")'>" + i + "</span>");
		}
		
		if (endPage < totalP)
			pagingHTML.append("<span id='paging' onclick='moviePaging(" + (endPage + 1) + ")'>다음</span>");
	}
}