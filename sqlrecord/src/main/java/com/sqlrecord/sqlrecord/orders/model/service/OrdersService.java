package com.sqlrecord.sqlrecord.orders.model.service;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;

public interface OrdersService {

	// 주문건 멤버 정보 넣고 해당 주문건 번호 받기
	int insertMemberOrders(MemberOrders memberOrders , int member_no);
	
	
}
