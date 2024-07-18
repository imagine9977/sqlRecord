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
     private float star;            
     private Date writeDate;      
     private int productNo;       
     private int memberNo;
     private String memberId;
     private String status;
     
}
