package com.sqlrecord.sqlrecord.qna.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
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
