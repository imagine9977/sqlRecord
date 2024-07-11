package com.sqlrecord.sqlrecord.orders.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class OrdersDetail {
	
           

	private int orders_detail_no;                        
	private int orders_detail_amount;        
	private int orders_detail_price;        
	private String orders_detail_exchanged;  
	private int tracking_num;  
	private String orders_detail_status;
  private Product product;               
	private MemberOrders memberOrders; 
}
