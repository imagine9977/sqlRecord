package com.sqlrecord.sqlrecord.orders.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
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

}
