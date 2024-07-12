package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.orders.model.dao.OrdersMapper;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrdersService {

	
	private final OrdersMapper ordersMapper;
	
	@Override
	public int insertMemberOrders(MemberOrders memberOrders , int memberNo) {
				
		if(ordersMapper.insertMemberOrders(memberOrders) > 0) {
			return ordersMapper.selectOneMemberOrdersNo(memberNo);
		} else {
			return 0;
		}

	}

	@Override
	public int insertOrdersDetail(List<MemberOrdersDetail> odList) {
		
		int success = 0;
		for(MemberOrdersDetail item : odList) {
			ordersMapper.insertOrdersDetail(item);
			success += 1;
		}
		
		
		return success;
	}

	@Override
	public List<MemberOrdersDetail> getOrdersDetail(int memberNo) {
		return ordersMapper.getOrdersDetail(memberNo);
	}
	
	
	
	
}
