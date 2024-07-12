package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;

public interface OrdersService {

	// 주문건 멤버 정보 넣고 해당 주문건 번호 받기
	int insertMemberOrders(MemberOrders memberOrders , int memberNo);

	int insertOrdersDetail(List<MemberOrdersDetail> odList);

	List<MemberOrdersDetail> getOrdersDetail(int memberNo);
	
	
}
