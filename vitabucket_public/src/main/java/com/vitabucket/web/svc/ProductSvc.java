package com.vitabucket.web.svc;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vitabucket.web.dto.BattachDTO;
import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.MainCateDTO;
import com.vitabucket.web.dto.ProductDTO;
import com.vitabucket.web.dto.Product_ImgDTO;
import com.vitabucket.web.dto.SubCateDTO;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.ProductMapper;

@Service
public class ProductSvc {
	@Autowired
	ProductMapper dao;
	
	/* 전체 상품 목록 */
	// 전체 상품 목록 요청
	public PageInfo<ProductDTO> getAllList(int page){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = new PageInfo<>(getList(dao.getAllPdList()));
		return pinfo;
	}
	// 전체 상품 목록 정렬 요청
	public PageInfo<ProductDTO> getAllSortList(String sort, int page){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = null;
		if(sort.equals("best")) pinfo = new PageInfo<>(getList(dao.getAllPd_bestList()));
		else if(sort.equals("lowest")) pinfo = new PageInfo<>(getList(dao.getAllPd_lowestList()));
		else pinfo = new PageInfo<>(getList(dao.getAllPd_highestList()));
		return pinfo;
	}
	
	
	/* 베스트 상품 목록 */
	public PageInfo<ProductDTO> getBestList(int page){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = new PageInfo<>(getList(dao.getBestPdList()));
		return pinfo;
	}
	
	/* 메인페이지에 표기될 베스트 상품*/
	public List<ProductDTO> getBestList(){
		List<ProductDTO> list=getList(dao.getBestPdList());
		return list;
	}
	
	public PageInfo<ProductDTO> getBestSortList(String sort, int page){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = null;
		if(sort.equals("best")) pinfo = new PageInfo<>(getList(dao.getBestPd_bestList()));
		else if(sort.equals("lowest")) pinfo = new PageInfo<>(getList(dao.getBestPd_lowestList()));
		else pinfo = new PageInfo<>(getList(dao.getBestPd_highestList()));
		return pinfo;
	}
	
	/* 검색 상품 목록 */
	public PageInfo<ProductDTO> getSearchList(int page, String search){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = new PageInfo<>(getList(dao.getSearchPdList(search)));
		return pinfo;
	}
	
	public PageInfo<ProductDTO> getSearchSortList(String sort, int page, String search){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = null;
		if(sort.equals("best")) pinfo = new PageInfo<>(getList(dao.getSearchPd_bestList(search)));
		else if(sort.equals("lowest")) pinfo = new PageInfo<>(getList(dao.getSearchPd_lowestList(search)));
		else pinfo = new PageInfo<>(getList(dao.getSearchPd_highestList(search)));
		return pinfo;
	}

	/* 카테고리 */
	public MainCateDTO getMainCate(int main) {
		return dao.getMainCate(main);
	}
	public SubCateDTO getSubCate(int sub) {
		return dao.getSubCate(sub);
	}
	public List<SubCateDTO> getSubCate_(int main) {
		return dao.getSubCate_(main);
	}
	public List<MainCateDTO> mainCates() {
		List<MainCateDTO> main = dao.mainCates();
		
		for(MainCateDTO m : main) {
			m.setSub(getSubCate_(m.getMain_cat_key()));
		}
		return main;
	}
	public List<SubCateDTO> subCates(String search){
		List<ProductDTO> plist = dao.getSearchPdList(search);
		Set<Integer> scKeys = new HashSet<>();
		for(ProductDTO p : plist) {
			scKeys.add(p.getSub_cat_key());
		}
		
		List<SubCateDTO> scList = new ArrayList<>();
		Iterator<Integer> ite = scKeys.iterator();
		while(ite.hasNext()) {
			scList.add(getSubCate(ite.next()));
		}
		return scList;
	}
	

	/* 카테고리 별 상품 목록 */
	//메인 카테고리 정렬
	public PageInfo<ProductDTO> getMainCateList(int page, int main){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = new PageInfo<>(getList(dao.getMainCatePdList(main)));
		return pinfo;
	}
	public PageInfo<ProductDTO> getMainCateSortList(String sort, int page, int main){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = null;
		if(sort.equals("best")) pinfo = new PageInfo<>(getList(dao.getMainCatePd_bestList(main)));
		else if(sort.equals("lowest")) pinfo = new PageInfo<>(getList(dao.getMainCatePd_lowestList(main)));
		else pinfo = new PageInfo<>(getList(dao.getMainCatePd_highestList(main)));
		return pinfo;
	}
	

	//서브 카테고리 정렬
	public PageInfo<ProductDTO> getSubCateList(int page, int sub){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = new PageInfo<>(getList(dao.getSubCatePdList(sub)));
		return pinfo;
	}
	
	public PageInfo<ProductDTO> getSubCateSortList(String sort, int page, int sub){
		PageHelper.startPage(page, 9);
		PageInfo<ProductDTO> pinfo = null;
		if(sort.equals("best")) pinfo = new PageInfo<>(getList(dao.getSubCatePd_bestList(sub)));
		else if(sort.equals("lowest")) pinfo = new PageInfo<>(getList(dao.getSubCatePd_lowestList(sub)));
		else pinfo = new PageInfo<>(getList(dao.getSubCatePd_highestList(sub)));
		return pinfo;
	}

	
	/* 상품 상세 */
	public ProductDTO getPdDetail(int pro_key) {
		ProductDTO pd = dao.getPdDetail(pro_key);
		pd.setImgs(getImg(pro_key));
		return pd;
	}
	// 상품 상세 확인 시 조회수 올리기
	public void hitUp(int pro_key) {
		dao.hitUp(pro_key);
	}
	
	// 리뷰, 문의 따로 클라이언트에 보내주기 위해서 type으로 나눠놓음
	public List<BoardDTO> getBoard(String type, int pro_key){
		List<BoardDTO> r_board = new ArrayList<>();
		
		// board 리스트에서 type에 맞춰 리스트에 저장
		for(BoardDTO b : dao.getBoard(pro_key)) {
			if(b.getBoard_type().equals(type)) {
				r_board.add(b);
			}
		}
		
		// user name, comm_result 따로 저장
		for(BoardDTO b : r_board) {
			b.setName(dao.getCustomer(b.getUnum()).getName());
			b.setAnswer_complete(dao.comm_result(b.getBoard_key()));
			b.setComment(dao.getComment(b.getBoard_key()));
			b.setAttachs(dao.getAttach(b.getBoard_key()));
		}
		return r_board;
	}
	
	public boolean inquiryAdd(UserVO user, BoardDTO board) {
		// 작성일 format
		Date utilDate = new Date();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String fmtDate = dateFormat.format(utilDate);
		
		java.sql.Date posted = java.sql.Date.valueOf(fmtDate);
		
		//board 세팅
		board.setUnum(user.getUnum());
		board.setBoard_posted(posted);
		
		return dao.addInquiry(board)>0;
	}
	
	
	/* 찜하기 기능 */
	public boolean wishAdd(UserVO user, int pro_key) {
		if(dao.checkWish(user.getUnum(), pro_key)) return false;
		return dao.addWish(user.getUnum(), pro_key)>0;
	}
	
	public boolean delWish(UserVO user, int pro_key) {
		return dao.delWish(user.getUnum(), pro_key)>0;
	}
	
	public boolean checkWish(UserVO user, int pro_key) {
		if(user==null) return false;
		return dao.checkWish(user.getUnum(), pro_key);
	}

	/* 상품 이미지 */
	public Product_ImgDTO getImg(int pro_key) {
		return dao.getImg(pro_key);
	}
	// 각 상품마다 이미지 추가하는 메소드
	public List<ProductDTO> getList(List<ProductDTO> list) {
		for(ProductDTO pd : list) {
			pd.setImgs(getImg(pd.getPro_key()));
		}
		return list;
	}
	
	public List<BattachDTO> getBattachs(int board_key){
		return dao.getAttach(board_key);
	}
	
}