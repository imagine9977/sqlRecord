package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.orders.model.dao.OrdersMapper;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.OrdersDetail;

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

	@Override
	public int insertOrdersDetail(List<OrdersDetail> odList) {
		
		int success = 0;
		for(OrdersDetail item : odList) {
			ordersMapper.insertOrdersDetail(item);
			success += 1;
		}
		
		
		return success;
	}

	@Override
	public List<OrdersDetail> getOrdersDetail(int memberNo) {
		return ordersMapper.getOrdersDetail(memberNo);
	}
	
	
	
	
}
