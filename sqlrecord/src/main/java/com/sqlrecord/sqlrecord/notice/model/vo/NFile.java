package com.sqlrecord.sqlrecord.notice.model.vo;

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
public class NFile {
	private int nfileNo;
    private String originalName;
    private String changedName;
    private int noticeNo;
}
