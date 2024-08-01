package com.sqlrecord.sqlrecord.reply.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ReplyFile {
	
	private int fileNo;
	private String originName;
	private String changeName;
	private int replyNo;
	private int memberNo;

}
