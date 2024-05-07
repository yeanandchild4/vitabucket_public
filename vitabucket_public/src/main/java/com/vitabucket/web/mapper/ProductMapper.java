package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.BattachDTO;
import com.vitabucket.web.dto.CommentDTO;
import com.vitabucket.web.dto.MainCateDTO;
import com.vitabucket.web.dto.ProductDTO;
import com.vitabucket.web.dto.Product_ImgDTO;
import com.vitabucket.web.dto.SubCateDTO;
import com.vitabucket.web.dto.UserVO;

@Mapper
public interface ProductMapper {
	// all product
	List<ProductDTO> getAllPdList();
	List<ProductDTO> getAllPd_bestList();
	List<ProductDTO> getAllPd_lowestList();
	List<ProductDTO> getAllPd_highestList();
	
	// best product
	List<ProductDTO> getBestPdList();
	List<ProductDTO> getBestPd_bestList();
	List<ProductDTO> getBestPd_lowestList();
	List<ProductDTO> getBestPd_highestList();
	
	// search product
	List<ProductDTO> getSearchPdList(String search);
	List<ProductDTO> getSearchPd_bestList(String search);
	List<ProductDTO> getSearchPd_lowestList(String search);
	List<ProductDTO> getSearchPd_highestList(String search);
	
	// category
	MainCateDTO getMainCate(int main);
	SubCateDTO getSubCate(int sub);
	List<SubCateDTO> getSubCate_(int main);
	List<MainCateDTO> mainCates();
	
	// maincate product
	List<ProductDTO> getMainCatePdList(int main);
	List<ProductDTO> getMainCatePd_bestList(int main);
	List<ProductDTO> getMainCatePd_lowestList(int main);
	List<ProductDTO> getMainCatePd_highestList(int main);
	
	// subcate product
	List<ProductDTO> getSubCatePdList(int sub);
	List<ProductDTO> getSubCatePd_bestList(int sub);
	List<ProductDTO> getSubCatePd_lowestList(int sub);
	List<ProductDTO> getSubCatePd_highestList(int sub);
	
	// product detail
	ProductDTO getPdDetail(int pro_key);
	int hitUp(int pro_key);
	List<BoardDTO> getBoard(int pro_key);
	int addInquiry(BoardDTO board);
	List<BattachDTO> getAttach(int board_key);
	
	//user
	UserVO getCustomer(int unum);
	
	//comment
	CommentDTO getComment(int board_key);
	boolean comm_result(int board_key);
	
	//wish
	boolean checkWish(@Param("unum")int unum, @Param("pro_key") int pro_key);
	int addWish(@Param("unum")int unum, @Param("pro_key") int pro_key);
	int delWish(@Param("unum")int unum, @Param("pro_key") int pro_key);
	
	// getImg
	Product_ImgDTO getImg(int pro_key);
	
}