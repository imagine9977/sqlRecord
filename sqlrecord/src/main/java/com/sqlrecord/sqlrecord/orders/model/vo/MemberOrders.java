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
	private int member_orders_no;
	private String member_orders_address;
	private String member_orders_address2;
	private String member_orders_postcode;
	private String member_orders_date;
	private int member_no;
}
