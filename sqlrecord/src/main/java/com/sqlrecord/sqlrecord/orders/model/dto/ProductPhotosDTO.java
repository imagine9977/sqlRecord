package com.sqlrecord.sqlrecord.orders.model.dto;

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
public class ProductPhotosDTO {

	private int productPhotosNo;
    private String productPhotosName;
    private String productPhotosPath;
}
