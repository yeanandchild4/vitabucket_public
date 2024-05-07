package com.vitabucket.web.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import org.springframework.web.multipart.MultipartFile;

import com.vitabucket.web.dto.*;

import lombok.extern.slf4j.Slf4j;


@Mapper
public interface Admin_productMapper {
	
	//검색
	List<ProductDTO> pSearch(HashMap<String,String> map);
	
	//상품+상품이미지+하위카테고리 연결
	public List<ProductDTO> pro_cate_all();
	
	//상품이미지 불러오기
	@Select("SELECT * FROM vita_product_img WHERE pro_key=#{pro_key}")
	public Product_ImgDTO pro_img(int pro_key);	
	
	//상품등록
	public int pro_added(ProductDTO p);
	
	//상품이미지등록
	public int pro_added_img(Product_ImgDTO imgs);
	
	//상품 상세정보 번호찾기
	public ProductDTO get_proNum(int pro_key);
	                             
	//상품 이미지 찾기
	@Select("SELECT * FROM vita_product_img WHERE pro_img_key=#{pro_img_key}")
	public Product_ImgDTO pro_img_find(int pro_img_key);
	
	//상품 수정
	public int pro_update(ProductDTO p);	
	
	//상품삭제
	@Delete("DELETE FROM VITA_PRODUCT WHERE pro_key = #{pro_key}")
	public int pro_del(int pro_key);
	
	//상품이미지삭제
	@Delete("DELETE FROM VITA_PRODUCT_IMG WHERE pro_img_key = #{pro_img_key}")
	public int pro_del_img(int pro_img_key);
	

}
