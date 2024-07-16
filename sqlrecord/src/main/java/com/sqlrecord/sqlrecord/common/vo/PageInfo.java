package com.sqlrecord.sqlrecord.common.vo;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@ToString
@Builder
public class PageInfo {
	
	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	private int listCount; 
	private int currentPage;
	private int pageLimit;
	private  int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
}
