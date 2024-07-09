package com.sqlrecord.sqlrecord.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
	
	private int memberNo;
    private String memberId;
    private String memberPw;
    private String name;
    private String email;
    private String tell;
    private String addr1;
    private String addr2;
    private String postcode;
    private String birth;
    private int point;
    private char status;
    private Date resDate;
}
