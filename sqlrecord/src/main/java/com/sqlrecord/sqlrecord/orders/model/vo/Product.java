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
	private int productNo;
	private String productName;
	private int productPrice;
	private String productStatus;
	private String productDate;
	private int tagNo;
	private String productDetail;
	private String productCate;
	private String color;
	private ProductPhotos productPhotos;

}
