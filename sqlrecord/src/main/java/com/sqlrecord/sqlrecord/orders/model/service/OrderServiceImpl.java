package com.sqlrecord.sqlrecord.orders.model.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int insertMemberOrders(MemberOrders memberOrders) {
				
		if(ordersMapper.insertMemberOrders(memberOrders) > 0) {
			return memberOrders.getMemberOrdersNo();
		} else {
			return 0;
		}

	}

	@Override
	public int insertOrdersDetail(List<MemberOrdersDetail> odList) {
		return ordersMapper.insertOrdersDetail(odList);
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
	public MemberOrdersDetail getOrdersDetailOneForTracking(String trackingNum) {
		return ordersMapper.getOrdersDetailOneForTracking(trackingNum);
	}

	@Override
	public int updateMemberOrdersStatus(String string , String trackingNum) {
		
		
		return ordersMapper.updateMemberOrdersStatus(string , trackingNum);
		
		
		
	}

	@Override
	@Transactional
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
	// 전체 주문건수 조회
    public int getTotalOrdersCount() {
        return ordersMapper.getTotalOrdersCount();
    }
	
	// 전체 주문건 조회
    @Override
    public List<MemberOrdersDTO> getAllMemberOrders(int startValue, int endValue) {
        return ordersMapper.getAllMemberOrders(startValue, endValue);
    }
    
    // 전체 주문상세 조회
    @Override
    public List<MemberOrdersDetailDTO> getMemberOrdersDetails(int memberOrdersNo) {
        return ordersMapper.getMemberOrderDetails(memberOrdersNo);
    }

    // 주문수락처리 - '상품준비중' 전환, 송장번호 생성 
    @Override
    public void acceptOrders(List<Integer> memberOrdersDetailNos) {
        for (int detailNo : memberOrdersDetailNos) {
            String trackingNum = generateRandomTrackingNum();
            ordersMapper.insertTrackingNum(trackingNum);
            ordersMapper.updateOrderStatus(detailNo, "상품준비중", trackingNum);
        }
    }

    // 주문거절처리 - '주문취소됨' 전환, 송장번호=NULL
    @Override
    public void denyOrders(List<Integer> memberOrdersDetailNos) {
        for (int detailNo : memberOrdersDetailNos) {
            ordersMapper.updateOrderStatus(detailNo, "주문취소됨", null);
        }
    }
    
    // 랜덤 송장번호 생성(문자열)
    private String generateRandomTrackingNum() {
        int length = 20;
        String characters = "0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(characters.charAt(random.nextInt(characters.length())));
        }
        return sb.toString();
    }
    
    // 선택한 주문상세번호 값 모두 받아오기
	@Override
	public List<Integer> getMemberOrdersDetailNos(int memberOrdersNo) {
		return ordersMapper.getMemberOrdersDetailNos(memberOrdersNo);
	}

	@Override
    public int searchOrderCount(Map<String, String> map) {
        return ordersMapper.searchOrderCount(map);
    }

    @Override
    public List<MemberOrdersDTO> findByConditionAndKeyword(Map<String, String> map, RowBounds rowBounds) {
        return ordersMapper.findByConditionAndKeyword(map, rowBounds);
    }
}