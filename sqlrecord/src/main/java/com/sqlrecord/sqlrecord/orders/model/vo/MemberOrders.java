package com.sqlrecord.sqlrecord.orders.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberOrders {
	private int memberOrdersNo;
	private String memberOrdersAddress;
	private String memberOrdersAddress2;
	private String memberOrdersPostcode;
	private String memberOrdersDate;
	private int memberNo;
}
