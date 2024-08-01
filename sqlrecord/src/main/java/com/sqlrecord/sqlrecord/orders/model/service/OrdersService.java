package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;

import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDTO;
import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDetailDTO;
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

	MemberOrdersDetail getOrdersDetailOneForTracking(String trackingNum);

	int updateMemberOrdersStatus(String string, String trackingNum);

	int insertMemberOrdersEx(MemberOrdersEx memberOrdersEx);

	List<MemberOrdersEx> getOrdersEx(int memberNo);

	
	// 관리자
	int getTotalOrdersCount();
    List<MemberOrdersDTO> getAllMemberOrders(int startValue, int endValue);
    List<MemberOrdersDetailDTO> getMemberOrdersDetails(int memberOrdersNo);
    void acceptOrders(List<Integer> memberOrdersDetailNos);
    void denyOrders(List<Integer> memberOrdersDetailNos);





	
	
}