package com.sqlrecord.sqlrecord.qna.model.vo;

import java.util.List;

public class Qna {
	private int qnaNo;
	private String qnaTitle;
	private String secret;
	private String qnaCategory;
	private String qnaContent;
	private String createDate;
	private String solved;
	private int count;
	private String changeDate;
	private String delStatus;
	private int memberNo;
	private List<QnaFile> files;
	private List<Comment> comments;
	
}
