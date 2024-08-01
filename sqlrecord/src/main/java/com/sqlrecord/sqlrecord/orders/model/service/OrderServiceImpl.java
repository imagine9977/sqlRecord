package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqlrecord.sqlrecord.orders.model.dao.OrdersMapper;
import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDTO;
import com.sqlrecord.sqlrecord.orders.model.dto.MemberOrdersDetailDTO;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrders;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersEx;
import com.sqlrecord.sqlrecord.product.model.vo.Product;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrdersService {

	@Autowired
	private final OrdersMapper ordersMapper;
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
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
	
	
	

	@Override
	public MemberOrdersDetail getOrdersDetailOne(int memberOrdersDetailNo) {
		return ordersMapper.getOrdersDetailOne(memberOrdersDetailNo);
	}

	@Override
	public List<Product> getProduct() {
		return ordersMapper.getProduct();
	}

	@Override
	public List<MemberOrdersDetail> getOrdersDetailAll() {
		return ordersMapper.getOrdersDetailAll();
	}

	@Override
	public MemberOrdersDetail getOrdersDetailOneForTracking(int trackingNum) {
		return ordersMapper.getOrdersDetailOneForTracking(trackingNum);
	}

	@Override
	public int updateMemberOrdersStatus(String string , int trackingNum) {
		return ordersMapper.updateMemberOrdersStatus(string , trackingNum);
	}

	@Override
	public int insertMemberOrdersEx(MemberOrdersEx memberOrdersEx) {
		
		if(ordersMapper.updateMemberOrdersExd(memberOrdersEx) > 0) {
			return ordersMapper.insertMemberOrdersEx(memberOrdersEx);
		} else {
			return 0;
		}
	}

	@Override
	public List<MemberOrdersEx> getOrdersEx(int memberNo) {
		return ordersMapper.getOrdersEx(memberNo);
	}


	
	//관리자
	@Override
    public int getTotalOrdersCount() {
        return ordersMapper.getTotalOrdersCount();
    }

    @Override
    public List<MemberOrdersDTO> getAllMemberOrders(int startValue, int endValue) {
        return ordersMapper.getAllMemberOrders(startValue, endValue);
    }

    @Override
    public List<MemberOrdersDetailDTO> getMemberOrdersDetails(int memberOrdersNo) {
        return ordersMapper.getMemberOrderDetails(memberOrdersNo);
    }

    @Override
    public void acceptOrders(List<Integer> memberOrdersDetailNos) {
        for (int detailNo : memberOrdersDetailNos) {
            ordersMapper.updateOrderStatus(detailNo, "상품준비중");
        }
    }

    @Override
    public void denyOrders(List<Integer> memberOrdersDetailNos) {
        for (int detailNo : memberOrdersDetailNos) {
            ordersMapper.updateOrderStatus(detailNo, "주문취소됨");
        }
    }

}