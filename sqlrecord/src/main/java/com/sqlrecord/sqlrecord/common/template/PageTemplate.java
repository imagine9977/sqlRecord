package com.sqlrecord.sqlrecord.common.template;

import com.sqlrecord.sqlrecord.common.vo.PageInfo;

public class PageTemplate {
	public static PageInfo getPageInfo(int listCount, 
			int currentPage, 
			int pageLimit,
			int boardLimit) {
		int maxPage = (int) Math.ceil((double) listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + maxPage - 1;

		if (endPage > maxPage)
			endPage = maxPage;
		return PageInfo.builder().listCount(listCount).currentPage(currentPage).maxPage(maxPage)
				.endPage(endPage).pageLimit(pageLimit).startPage(startPage).boardLimit(boardLimit).build();

	}
}
