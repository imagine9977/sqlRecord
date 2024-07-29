package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;
import java.util.Map;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

public interface OrdersService {

	// 주문건 멤버 정보 넣고 해당 주문건 번호 받기
	int insertMemberOrders(MemberOrders memberOrders , int memberNo);

	int insertOrdersDetail(List<MemberOrdersDetail> odList);

	List<MemberOrdersDetail> getOrdersDetail(int memberNo);

	MemberOrdersDetail getOrdersDetailOne(int memberOrdersDetailNo);

	List<Product> getProduct();

	List<MemberOrdersDetail> getOrdersDetailAll();

	MemberOrdersDetail getOrdersDetailOneForTracking(int trackingNum);

	int updateMemberOrdersStatus(String string, int trackingNum);

	int insertMemberOrdersEx(MemberOrdersEx memberOrdersEx);

	List<MemberOrdersEx> getOrdersEx(int memberNo);

	// 관리자
//	// 주문건 수
//	int orderCount();
//	// 전체 주문건 리스트 조회
//	List<MemberOrders> findAllOrders(Map<String, Integer> map);
//	// 교환요청건수
//	int exchangeCount();
//	// 전체 교환건 조회
//	List<MemberOrdersEx> findAllExchanges(Map<String, Integer> map);
//	// 환불 요청 건수
//	int refundCount();
//	// 전체 환불건 조회
//	List<MemberOrdersEx> findAllRefunds(Map<String, Integer> map);

	Map<String, Object> getAllMemberOrders(int page, String type);

	List<MemberOrdersDetail> getMemberOrderDetails(int memberOrdersNo);


	
	
}