package com.sqlrecord.sqlrecord.orders.model.dto;

import java.math.BigDecimal;
import java.util.Date;

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
public class MemberOrdersDTO {
	private int memberOrdersNo;
    private String addr1;
    private String addr2;
    private String postcode;
    private Date orderDate;
    private String memberId;
    private String productCate;
    private int productNo;
    private String productName;
    private String productStatus;
    private BigDecimal totalPrice;
    private int detailsCount;

}