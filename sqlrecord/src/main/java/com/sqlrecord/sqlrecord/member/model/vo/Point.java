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
public class Point {
	
	private int pointNo;
	private int memberNo;
	private String history;
	private Date changeDate;
	private int pointAmount;
	
	private int total;
	private int totalAll;
}
