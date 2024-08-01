package com.sqlrecord.sqlrecord.tracking.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TrackingInfo {
	private int trackingInfoNum;
	private String trackingInfoWhere;
	private String trackingInfoDate;
	private String trackingNum;
}