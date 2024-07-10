package com.sqlrecord.sqlrecord.orders.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.OrdersDetail;

@Mapper
public interface OrdersMapper {

	int insertMemberOrders(MemberOrders memberOrders);

	int selectOneMemberOrdersNo(int member_no);

	int insertOrdersDetail(OrdersDetail item);

	List<OrdersDetail> getOrdersDetail(int memberNo);

}
