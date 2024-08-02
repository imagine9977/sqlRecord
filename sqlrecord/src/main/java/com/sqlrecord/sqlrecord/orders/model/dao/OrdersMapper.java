package com.sqlrecord.sqlrecord.orders.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDTO;
import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDetailDTO;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

@Mapper
public interface OrdersMapper {

	int insertMemberOrders(MemberOrders memberOrders);

	int selectOneMemberOrdersNo(int memberNo);

	int insertOrdersDetail(List<MemberOrdersDetail> odList);

	List<MemberOrdersDetail> getOrdersDetail(int memberNo);

	MemberOrdersDetail getOrdersDetailOne(int memberOrdersDetailNo);

	List<Product> getProduct();

	List<MemberOrdersDetail> getOrdersDetailAll();

	MemberOrdersDetail getOrdersDetailOneForTracking(String trackingNum);

	int updateMemberOrdersStatus(@Param("string") String string, @Param("trackingNum") String trackingNum);

	int updateMemberOrdersExd(MemberOrdersEx memberOrdersEx);
	
	int insertMemberOrdersEx(MemberOrdersEx memberOrdersEx);

	List<MemberOrdersEx> getOrdersEx(int memberNo);

	
	// 관리자
	int getTotalOrdersCount();
	List<MemberOrdersDTO> getAllMemberOrders(@Param("startValue") int startValue, @Param("endValue") int endValue);
    List<MemberOrdersDetailDTO> getMemberOrderDetails(@Param("memberOrdersNo") int memberOrdersNo);
    void updateOrderStatus(@Param("detailNo") int detailNo,
    					   @Param("status") String status,
    					   @Param("trackingNum") String trackingNum);
    void insertTrackingNum(@Param("trackingNum") String trackingNum);

	List<Integer> getMemberOrdersDetailNos(int memberOrdersNo);
	int searchOrderCount(Map<String, String> map);
    List<MemberOrdersDTO> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds);
}