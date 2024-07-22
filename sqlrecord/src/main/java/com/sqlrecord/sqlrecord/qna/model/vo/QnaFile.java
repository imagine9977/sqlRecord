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
public class QnaFile {
	private int qnafileNo;
    private String originalName;
    private String changedName;
    private int qnaNo;
}
