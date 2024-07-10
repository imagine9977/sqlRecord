package com.sqlrecord.sqlrecord.orders.model.service;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.orders.model.dao.OrdersMapper;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrdersService {

	
	private final OrdersMapper ordersMapper;
	
	@Override
	public int insertMemberOrders(MemberOrders memberOrders , int member_no) {
				
		if(ordersMapper.insertMemberOrders(memberOrders) > 0) {
			return ordersMapper.selectOneMemberOrdersNo(member_no);
		} else {
			return 0;
		}

	}
	
	
	
}
