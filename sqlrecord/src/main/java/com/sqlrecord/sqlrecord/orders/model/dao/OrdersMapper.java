package com.sqlrecord.sqlrecord.orders.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

@Mapper
public interface OrdersMapper {

	int insertMemberOrders(MemberOrders memberOrders);

	int selectOneMemberOrdersNo(int memberNo);

	int insertOrdersDetail(MemberOrdersDetail item);

	List<MemberOrdersDetail> getOrdersDetail(int memberNo);

	MemberOrdersDetail getOrdersDetailOne(int memberOrdersDetailNo);

	List<Product> getProduct();

	List<MemberOrdersDetail> getOrdersDetailAll();

	MemberOrdersDetail getOrdersDetailOneForTracking(int trackingNum);

	int updateMemberOrdersStatus(@Param("string") String string, @Param("trackingNum") int trackingNum);

	int updateMemberOrdersExd(MemberOrdersEx memberOrdersEx);
	
	int insertMemberOrdersEx(MemberOrdersEx memberOrdersEx);

	List<MemberOrdersEx> getOrdersEx(int memberNo);

	
	// 관리자
//	int orderCount();

//	List<MemberOrders> findAllOrders(Map<String, Integer> map);
//
//	int exchangeCount();
//
//	List<MemberOrdersEx> findAllExchanges(Map<String, Integer> map);
//
//	int refundCount();
//
//	List<MemberOrdersEx> findAllRefunds(Map<String, Integer> map);

	List<MemberOrders> getAllMemberOrders(int offset, int pageSize, String type);

	int getTotalOrdersCount(String type);

	List<MemberOrdersDetail> getMemberOrdersDetails(int memberOrdersNo);

	

}