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
	private int orders_no;
	private String orders_address;
	private String orders_address2;
	private String orders_postcode;
	private String orders_date;
	private int member_no;
}
