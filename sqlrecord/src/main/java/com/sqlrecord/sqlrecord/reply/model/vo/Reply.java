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
public class Reply {

	 private int replyNo;       
     private int depth;           
     private String content;      
     private int star;            
     private Date writeDate;      
     private int productNo;       
     private int memberNo;      
}
