package com.sqlrecord.sqlrecord.orders.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;

@Mapper
public interface OrdersMapper {

	int insertMemberOrders(MemberOrders memberOrders);

	int selectOneMemberOrdersNo(int memberNo);

	int insertOrdersDetail(MemberOrdersDetail item);

	List<MemberOrdersDetail> getOrdersDetail(int memberNo);

}
