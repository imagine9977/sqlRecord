package com.sqlrecord.sqlrecord.orders.model.dto;

import java.util.List;

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
public class ProductDTO {

	private int productNo;
    private String productName;
    private int productPrice;
    private String productStatus;
    private String productCate;
    private List<ProductPhotosDTO> productPhotosList;
}
