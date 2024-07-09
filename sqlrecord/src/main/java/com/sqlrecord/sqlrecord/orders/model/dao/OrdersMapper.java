package com.sqlrecord.sqlrecord.orders.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;

@Mapper
public interface OrdersMapper {

	int insertMemberOrders(MemberOrders memberOrders);

}
