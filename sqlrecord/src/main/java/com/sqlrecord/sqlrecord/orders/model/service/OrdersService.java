package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

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
	// 모든 주문건 출력
    List<MemberOrdersDTO> getAllMemberOrders(int startValue, int endValue);
    // 모든 주문상세 출력
    List<MemberOrdersDetailDTO> getMemberOrdersDetails(int memberOrdersNo);
    // 선택한 주문상세값의 리스트를 가져오기
    List<Integer> getMemberOrdersDetailNos(int memberOrdersNo);
    // 주문수락
    void acceptOrders(List<Integer> memberOrdersDetailNos);
    // 주문거절
    void denyOrders(List<Integer> memberOrdersDetailNos);
    // 검색 조회수
    int searchOrderCount(Map<String, String> map);
    // 검색내용조회
    List<MemberOrdersDTO> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds);




	
	
}