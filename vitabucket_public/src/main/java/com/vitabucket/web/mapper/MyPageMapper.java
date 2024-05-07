package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import com.vitabucket.web.dto.AddressDTO;
import com.vitabucket.web.dto.BattachDTO;
import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.CommentDTO;
import com.vitabucket.web.dto.InfoDTO;
import com.vitabucket.web.dto.OrderDetail;
import com.vitabucket.web.dto.TotalOrder;
import com.vitabucket.web.dto.Wish;

@Mapper
public interface MyPageMapper {
	
	//주문내역
	public List<TotalOrder> totalOrderList(int unum);
	
	//주문 상세 내역
	public TotalOrder totalOrderDetail(String to_key);
	public List<OrderDetail> orderDetailList(String to_key);
	
	//찜목록
	public List<Wish> wishList(int unum);
	public int deleteWish(int wish_key);
	
	//작성한 후기
	public List<BoardDTO> reviewList(int unum);
	public int editReview(BoardDTO b);
	public int deleteReview(int board_key);
	
	//작성가능한 후기
	public List<OrderDetail> unReviewList(int unum);
	public int addReviewBoard(BoardDTO b);
	public int updateReview(int pro_key);
	
	//개인문의
	public List<BoardDTO> inquiryList(int unum);
	public int deleteInquiry(int board_key);
	public CommentDTO comment(int board_key);
	
	//개인정보수정
	public InfoDTO getUserInfo(int unum);
	public AddressDTO getUserAddr(int unum);
	public int editUserInfoWithPwd(InfoDTO info);
	public int editUserInfoWithoutPwd(InfoDTO info);
	public int editUserAddrWithaddr_key(AddressDTO addr);
	public int editUserAddrWithoutaddr_key(AddressDTO addr);
	
	//첨부파일
	public List<BattachDTO> battachList(int board_key);
	public int addBattach(BattachDTO a);
	public int deleteBattachAll(int board_key);
	public int deleteBattach(int b_attach_key);	
}
