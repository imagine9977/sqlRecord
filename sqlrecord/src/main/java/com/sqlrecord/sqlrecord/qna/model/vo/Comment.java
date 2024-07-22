package com.sqlrecord.sqlrecord.qna.model.vo;

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
public class Comment {
	private int commentNo;
	private int qnaNo;
	private int memberNo;
	private String commentContent;
	private String resdate;
	private String status;
}
