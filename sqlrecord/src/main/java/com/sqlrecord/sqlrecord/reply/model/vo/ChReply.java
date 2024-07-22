package com.sqlrecord.sqlrecord.reply.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ChReply {
	
	private int chReplyNo;
	private String chContent;
	private int replyNo;
	private int memberNo;
	private Date writeDate;
	private int depth;
	private String memberId;
}
