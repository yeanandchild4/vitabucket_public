package com.vitabucket.web.svc;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.request.PrepareData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.vitabucket.web.dto.AddressDTO;
import com.vitabucket.web.dto.CartDTO;
import com.vitabucket.web.dto.OrderDetail;
import com.vitabucket.web.dto.TotalOrder;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.CartMapper;

@Service
public class CartSvc {
	
	private IamportClient api;
	
	@Autowired
	private CartMapper cm;
	
	public CartSvc(@Value("${iamport.api-key}") String api_key,
			@Value("${iamport.api-secret}") String api_secret) {
		this.api = new IamportClient(api_key, 
				api_secret);
	}

//장바구니
	//장바구니 목록
	public List<CartDTO> cartList(int unum) {
		return cm.cartList(unum);
	}
	//주소
	public AddressDTO cartAddr(int unum) {
		return cm.cartAddr(unum);
	}
	//장바구니 총가격 계산
	public int cartTotal(List<Integer> cart_keys) {
		int total=0;
		for(int key : cart_keys) {
			total += cm.getPro_Total(key);
		}
		return total;
	}
	//장바구니 상품 하나의 총 가격 계산
	public int pTotal(int cart_key) {
		return cm.getPro_Total(cart_key);
	}
	//장바구니 수량 수정
	public boolean modifyCnt(CartDTO cart) {
		int res = cm.modifyCnt(cart);
		return res>0;
	}
	
	//장바구니에서 선택삭제
	@Transactional(rollbackFor ={Exception.class})
	public boolean deleteCart(List<Integer> cart_keys) throws Exception {
		for(int cart_key : cart_keys) {
			int res = cm.deleteCart(cart_key);
			if(res==0) throw new Exception();
		}
		return true;
	}
	
	//장바구니에서 한 상품 삭제
	@Transactional(rollbackFor ={Exception.class})
	public boolean deleteP(int cart_key) throws Exception {
		return cm.deleteCart(cart_key)>0;
	}
	
	//찜목록
	//장바구니 추가(wish)
	@Transactional (rollbackFor ={Exception.class})
	public boolean addCart(CartDTO cart, UserVO user) throws Exception {
		cart.setUnum(user.getUnum());
		
		int res1=0;
		List<CartDTO> cList = cartList(user.getUnum());
		if(cList.contains(cart)) res1 = cm.addCartCnt(cart); 
		else res1 = cm.addCart(cart);
		if(res1==0) throw new Exception();
		
		int res2 = cm.deleteWish(cart);
		if(res2==0) throw new Exception();
		
		return true;
	}
	
	
	
//구매
	//구매 선택한 제품 목록
	public List<CartDTO> checkoutList(List<Integer> cart_keys) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		for(int k : cart_keys) {
			list.add(cm.getCart(k));
		}
		return list;
	}
	//구매 사전검증
	@Transactional(rollbackFor ={Exception.class})
	public boolean postPrepare(TotalOrder to,List<Integer> cart_keys) throws Exception {
        PrepareData prepareData = new PrepareData(to.getTo_key(),to.getTo_total());
        api.postPrepare(prepareData);  // 사전 등록 API 
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("to_key", to.getTo_key());
        int res1 = cm.postPrepare(to); 
        if(res1==0) return false;
        for(int key : cart_keys) {
        	map.put("cart_key", key);
        	int res2 = cm.insertOrderDetail(map);
        	if(res2==0) throw new Exception();
        }
        return true;
    }
	//구매 후 사후검증
	public Payment validatePayment(TotalOrder to) throws IamportResponseException, Exception {
		TotalOrder dbTo = cm.getTotalOrder(to.getTo_key());
		if(dbTo==null) throw new Exception();
        BigDecimal preAmount = dbTo.getTo_total();// DB에 저장된 결제요청 금액
        
        IamportResponse<Payment> iamportResponse = api.paymentByImpUid(to.getImp_uid());
        BigDecimal paidAmount = iamportResponse.getResponse().getAmount(); // 사용자가 실제 결제한 금액

        if (!preAmount.equals(paidAmount)) {
            CancelData cancelData = cancelPayment(iamportResponse);
            api.cancelPaymentByImpUid(cancelData);
            cm.deleteTO(to.getTo_key());
            cm.deleteOD(to.getTo_key());
        }
        return iamportResponse.getResponse();
    }
	//결제취소
	public CancelData cancelPayment(IamportResponse<Payment> response) {
        return new CancelData(response.getResponse().getImpUid(), true);
    }
	
	//결제 후 DB 저장
	@Transactional(rollbackFor ={Exception.class})
	public Payment save_order(TotalOrder to,List<Integer> cart_keys) throws IamportResponseException, Exception {
		TotalOrder dbTo = cm.getTotalOrder(to.getTo_key());
		IamportResponse<Payment> iamportResponse = api.paymentByImpUid(to.getImp_uid());
		
		if(dbTo.getUnum()!=to.getUnum()) {
			CancelData cancelData = cancelPayment(iamportResponse);
            api.cancelPaymentByImpUid(cancelData);
            cm.deleteTO(to.getTo_key());
            cm.deleteOD(to.getTo_key());
		} else {
			AddressDTO addr = cm.getAddress(to.getTo_addr_key());
			OrderDetail od = cm.getMainOrderDetail(to.getTo_key());
			int to_pro_cnt = cm.getTo_Pro_cnt(to.getTo_key());
			
			dbTo.setTo_date(new Timestamp(iamportResponse.getResponse().getPaidAt().getTime()));
			dbTo.setTo_status(iamportResponse.getResponse().getStatus());
			dbTo.setTo_payment(iamportResponse.getResponse().getCardName());
			dbTo.setTo_name(addr.getAddr_name());
			dbTo.setTo_zipcode(addr.getAddr_zipcode());
			dbTo.setTo_addr(addr.getAddr());
			dbTo.setTo_addr_detail(addr.getAddr_detail());
			dbTo.setTo_tel(addr.getAddr_tel());
			dbTo.setTo_req(to.getTo_req());
			dbTo.setTo_pro_cnt(to_pro_cnt);
			dbTo.setTo_pro_img(od.getMain_img());
			dbTo.setTo_pro_name(od.getPro_name());
			
			cm.saveTO(dbTo);
			deleteCart(cart_keys);
		}
		return iamportResponse.getResponse();
	}
	//구매 오류 시 사전검증 시 DB에 저장된 내역 삭제
	@Transactional(rollbackFor ={Exception.class})
	public boolean deleteTotalOrder(String to_key) throws Exception {
		int res1 = cm.deleteTO(to_key);
		int res2 = cm.deleteOD(to_key);
		if(res1==0||res2==0) throw new Exception();
		else return true;
	}
	
//제품상세
	//장바구니 추가(제품상세)
		public boolean insertCart(CartDTO cart, UserVO user) {
			// 장바구니에 들어갈 유저key 세팅
			cart.setUnum(user.getUnum());
			
			// 중복 검사
	  		List<CartDTO> clist = cm.cartList(cart.getUnum());
	 		if(clist!=null) {
	 			for(CartDTO c : clist) {
	 				if(c.getPro_key()==cart.getPro_key()) {
	 					return cm.updateCnt(cart)>0;
	 				}
	 			}
	 		}
	 		return cm.insertCart(cart)>0;
		}
}
