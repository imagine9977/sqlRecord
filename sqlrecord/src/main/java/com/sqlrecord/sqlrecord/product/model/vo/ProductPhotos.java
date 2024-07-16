package com.sqlrecord.sqlrecord.product.model.vo;

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
public class ProductPhotos {

	private int productPhotosNo;	// 상품사진번호(시퀀스 : product_photos_seq)
	private int productPhotosPath;	// 상품사진번호(시퀀스 : product_photos_seq)
	private int productNo;	// 상품사진번호(시퀀스 : product_seq)
}
