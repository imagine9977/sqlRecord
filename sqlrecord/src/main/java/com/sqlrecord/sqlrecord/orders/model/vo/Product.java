package com.sqlrecord.sqlrecord.orders.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_status;
	private String product_date;
	private String product_photo1;
	private String product_photo2;
	private String product_photo3;
	private int tag_no;
	private String product_detail;
}
