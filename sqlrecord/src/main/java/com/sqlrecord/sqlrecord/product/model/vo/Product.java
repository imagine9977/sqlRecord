package com.sqlrecord.sqlrecord.product.model.vo;

import java.util.Date;
import java.util.List;

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
public class Product {

	private int productNo;			// 상품번호
	private String productName;		// 상품명
	private int productPrice;		// 상품가격
	private String productStatus;	// 상품상태(상품준비중,배송시작,배송중,배송완료)
	private Date productDate;		// 상품등록날짜
	private int tagNo;				// 태그번호(장르 1-9)
	private String productDetail;	// 상품설명
	private String productCate;		// 상품카테고리(turntables,speakers,radios,vynyl)
	
	private List<ProductPhotos> productPhotosList;	// 상품사진리스트
}
