package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.vitabucket.web.dto.AddressDTO;
import com.vitabucket.web.dto.CartDTO;
import com.vitabucket.web.dto.OrderDetail;
import com.vitabucket.web.dto.TotalOrder;
import com.vitabucket.web.dto.UserVO;

@Mapper
public interface CartMapper {
	
//장바구니
	//장바구니 목록
	public List<CartDTO> cartList(int unum);
	public AddressDTO cartAddr(int unum);
	public int getPro_Total(int cart_key);
	
	//장바구니 수량 수정
	public int modifyCnt(CartDTO cart);
	public CartDTO getCart(int cart_key);
	
	//장바구니 삭제
	public int deleteCart(int cart_key);
	
	//찜상품
	public int addCart(CartDTO cart);
	public int addCartCnt(CartDTO cart);
	public int deleteWish(CartDTO cart);
	
	
//구매
	//구매페이지
	public List<OrderDetail> getOrderDetailList(String to_key);
	
	
	//사전검증
	public int postPrepare(TotalOrder to);
	public int insertOrderDetail(Map<String, Object> map);
	
	
	//사후검증
	public TotalOrder getTotalOrder(String to_key);
	
	
	//결제 후 DB 저장
	public OrderDetail getMainOrderDetail(String to_key);
	public int saveTO(TotalOrder to);
	public AddressDTO getAddress(int addr_key);
	public int getTo_Pro_cnt(String to_key);
	
	//구매 오류 시 사전검증 시 DB에 저장된 내역 삭제
	public int deleteTO(String to_key);
	public int deleteOD(String to_key);
	
	
//제품상세
	public int insertCart(CartDTO cart);
	public int updateCnt(CartDTO cart);
}
