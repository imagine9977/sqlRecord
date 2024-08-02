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
public class MemberOrdersDetailDTO {
	private int memberOrdersDetailNo;
    private int memberOrdersDetailAmount;
    private int memberOrdersDetailPrice;
    private String memberOrdersDetailStatus;
    private ProductDTO product;
    
    private String trackingNum;
}