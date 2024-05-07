package com.vitabucket.web.svc;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.vitabucket.web.dto.AddressDTO;
import com.vitabucket.web.dto.BattachDTO;
import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.InfoDTO;
import com.vitabucket.web.dto.OrderDetail;
import com.vitabucket.web.dto.TotalOrder;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.dto.Wish;
import com.vitabucket.web.mapper.MyPageMapper;

@Service
public class MyPageSvc {
	
	@Autowired
	private MyPageMapper mpm;
	
	@Autowired
	private BCryptPasswordEncoder enc;
	
	
	//주문내역
	public List<TotalOrder> totalOrderList(int unum) {
		return mpm.totalOrderList(unum);
	}
	
	
	//주문 상세 내역
	public TotalOrder totalOrderDetail(String to_key) {
		return mpm.totalOrderDetail(to_key);
	}
	public List<OrderDetail> orderDetail(String to_key) {
		return mpm.orderDetailList(to_key);
	}
	
	
	//찜목록
	public List<Wish> wishList(int unum) {
		return mpm.wishList(unum);
	}
	public boolean deleteWish(int wish_key) {
		return mpm.deleteWish(wish_key)>0;
	}
	
	
	//작성한 후기
	public List<BoardDTO> reviewList(int unum) {
		List<BoardDTO> list = mpm.reviewList(unum);
		for(BoardDTO b:list) {
			b.setAttachs(mpm.battachList(b.getBoard_key()));
		}
		return list;
	}
	@Transactional(rollbackFor ={Exception.class})
	public boolean editReview(UserVO u, MultipartFile[] files, BoardDTO b) throws Exception {
		String upPath = "D:/git/vitabucket/vitabucket/src/main/webapp/WEB-INF/userImages";
		b.setUnum(u.getUnum());
		int res1 = mpm.editReview(b);
		if(res1==0) throw new Exception();
		List<BattachDTO> aList = bAttachList(files, b,upPath);
		if(aList.size()!=0) {
			for(BattachDTO a : aList) {
				int res2 = mpm.addBattach(a);
				if(res2==0) throw new Exception();
			}
		}
		return true;
	}
	@Transactional
	public boolean deleteReview(int board_key) throws Exception {
		int res1 = mpm.deleteReview(board_key);
		if(res1==0 ) throw new Exception();
		if(mpm.battachList(board_key).size()>0) {
			int res2 = mpm.deleteBattachAll(board_key);
			if(res2==0) throw new Exception();
		}
		return true;
	}
	public boolean deleteRevieImg(int b_attach_key) {
		return mpm.deleteBattach(b_attach_key)>0;
	}
	
	
	//작성가능한 후기
	public List<OrderDetail> unReviewList(int unum) {
		return mpm.unReviewList(unum);
	}
	@Transactional(rollbackFor ={Exception.class})
	public boolean addReview(UserVO u,BoardDTO b, MultipartFile[] files) throws Exception {
		String upPath = "D:/git/vitabucket/vitabucket/src/main/webapp/WEB-INF/userImages";
		b.setUnum(u.getUnum());
		int res1 = mpm.addReviewBoard(b);
		if(res1==0) throw new Exception();
		List<BattachDTO> aList = bAttachList(files, b,upPath);
		if(aList.size()!=0) {
			for(BattachDTO a : aList) {
				int res2 = mpm.addBattach(a);
				if(res2==0) throw new Exception();
			}
		}
		int res3 = mpm.updateReview(b.getOd_key());
		if(res3==0) throw new Exception();
		return true;
	}
	
	
	//개인문의
	public List<BoardDTO> inquiryList(int unum) {
		List<BoardDTO> list = mpm.inquiryList(unum);
		
		for(BoardDTO b:list) {
			b.setAttachs(mpm.battachList(b.getBoard_key()));
			b.setComment(mpm.comment(b.getBoard_key()));
		}
		return list;
	}
	@Transactional
	public boolean deleteInquiry(int board_key) throws Exception {
		int res1 = mpm.deleteInquiry(board_key);
		if(res1==0 ) throw new Exception();
		if(mpm.battachList(board_key).size()>0) {
			int res2 = mpm.deleteBattachAll(board_key);
			if(res2==0) throw new Exception();
		}
		return true;
	}
	
	
	//개인정보수정
	public InfoDTO getUserInfo(int unum) {
		InfoDTO info = mpm.getUserInfo(unum);
		info.setUser_addr(mpm.getUserAddr(unum));
		return info;
	}
	@Transactional(rollbackFor ={Exception.class})
	public boolean editInfo(InfoDTO info,AddressDTO addr) throws Exception {
		int res1=0;
		int res2=0;
		if(!info.getUser_pwd().equals("")) {
			String pwd = enc.encode(info.getUser_pwd());
			info.setUser_pwd(pwd);
			res1 = mpm.editUserInfoWithPwd(info);
		} else {
			res1 = mpm.editUserInfoWithoutPwd(info);
		}
		
		addr.setUnum(info.getUnum());
		addr.setAddr_name(info.getName());
		addr.setAddr_tel(info.getUser_phone());
		addr.setWhole_addr(addr.getAddr()+" "+addr.getAddr_detail()+" ("+addr.getAddr_zipcode()+")");
		
		if(addr.getAddr_key()!=0) {
			res2 = mpm.editUserAddrWithaddr_key(addr);
		} else {
			res2 = mpm.editUserAddrWithoutaddr_key(addr);
		}
		if(res1==0 || res2==0) throw new Exception();
		return true;
	}
	
	
	//첨부파일
	public List<BattachDTO> bAttachList(MultipartFile[] files,BoardDTO b,String upPath) throws IllegalStateException, IOException {
		List<BattachDTO> aList = new ArrayList<BattachDTO>();
		
		for(MultipartFile m : files) {
			if(m.isEmpty()) break;
			UUID u = UUID.randomUUID();
			String fname = m.getOriginalFilename();
			String savedfname = u.toString()+"_"+fname;
			
			BattachDTO a = new BattachDTO();
			a.setBoard_key(b.getBoard_key());
			a.setFname(fname);
			a.setSavedfname(savedfname);
			aList.add(a);
			
			m.transferTo(new File(upPath,a.getSavedfname()));
		}
		return aList;
	}
}
