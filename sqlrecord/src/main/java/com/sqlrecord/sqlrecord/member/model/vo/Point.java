package com.sqlrecord.sqlrecord.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Point {

	private int pointNo;
	private int memberNo;
	private String history;
	private Date changeDate;
	private int pointAmount;
}
