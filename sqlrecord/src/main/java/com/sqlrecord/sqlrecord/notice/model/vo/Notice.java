package com.sqlrecord.sqlrecord.notice.model.vo;


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
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeCategory;
	private String noticeContent;
	private String resdate;
	private List<NFile> files;
}
