package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

public interface OrdersService {

	// 주문건 멤버 정보 넣고 해당 주문건 번호 받기
	int insertMemberOrders(MemberOrders memberOrders);

	int insertOrdersDetail(List<MemberOrdersDetail> odList);

	List<MemberOrdersDetail> getOrdersDetail(int memberNo);

	MemberOrdersDetail getOrdersDetailOne(int memberOrdersDetailNo);

	List<Product> getProduct();

	List<MemberOrdersDetail> getOrdersDetailAll();

	MemberOrdersDetail getOrdersDetailOneForTracking(int trackingNum);

	int updateMemberOrdersStatus(String string, int trackingNum);

	int insertMemberOrdersEx(MemberOrdersEx memberOrdersEx);

	List<MemberOrdersEx> getOrdersEx(int memberNo);
	
	
}
