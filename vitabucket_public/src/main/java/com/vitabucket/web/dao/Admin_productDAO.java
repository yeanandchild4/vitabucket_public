package com.vitabucket.web.dao;

import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.vitabucket.web.dto.*;
import com.vitabucket.web.mapper.*;

@Repository
public class Admin_productDAO {
	@Autowired
	Admin_productMapper mapper;
	
	//검색
	public List<ProductDTO> search(HashMap<String,String> map){
		return mapper.pSearch(map);
	}
	
	/*상품목록
	public List<ProductDTO> prodList(){
		return mapper.prodList();
	}*/
		
	//상품+하위카테고리 연결
	public List<ProductDTO> pro_cate_all(){
		return mapper.pro_cate_all();
	};
	
	//상품이미지 불러오기
	public Product_ImgDTO pro_img(int pro_key) {
		return mapper.pro_img(pro_key);
	};
	
	//상품정보
	public int pro_added(ProductDTO p) {
		return mapper.pro_added(p);
	}
	
	// 이미지 저장
	public int pro_added_img(Product_ImgDTO imgs) {
		return mapper.pro_added_img(imgs);
	}
	        
	
	//상품 상세(번호찾기)
	public ProductDTO get_proNum(int pro_key) {
		return mapper.get_proNum(pro_key);
	}
	
	//상품 이미지 찾기
	public Product_ImgDTO pro_img_find(int pro_img_key){
		return mapper.pro_img_find(pro_img_key);
	}
	
	//상품수정
	public int pro_update(ProductDTO p) {
		return mapper.pro_update(p);
	}
	
	
	//상품삭제
	public int pro_del(int pro_key) {
		return mapper.pro_del(pro_key);		
	}
	
	//상품이미지삭제
	public int pro_del_img(int pro_key) {
		return mapper.pro_del_img(pro_key);
	}

	
}

