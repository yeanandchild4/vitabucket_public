package com.vitabucket.web.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitabucket.web.dto.MainCateDTO;
import com.vitabucket.web.dto.MainCateDTO;
import com.vitabucket.web.dto.SubCateDTO;
import com.vitabucket.web.mapper.Admin_categoryMapper;

@Repository
public class Admin_categoryDAO {
	@Autowired
	Admin_categoryMapper mapper;
	
	public List<MainCateDTO> cateList() {
		List<MainCateDTO>clist = mapper.cateList();
		for(MainCateDTO m : clist) {
			List<SubCateDTO> slist = mapper.cate_sList(m.getMain_cat_key());
			m.setSub(slist);
		}		
		return clist; 
	}
	
	public List<SubCateDTO> cate_sList(int main_cat_key){
		return mapper.cate_sList(main_cat_key);
	}
	
	public int cate(SubCateDTO sc) {
		return mapper.cateAdd(sc);
	}
	
	public int cateDel(int sub_cat_key){
		return mapper.cateDel(sub_cat_key);
	}
	
	public int cateEdit(MainCateDTO mc) {		
		return mapper.cateEdit(mc);
	}
	
	public int cateEdit_s(SubCateDTO sc) {		
		return mapper.cateEdit_s(sc);
	}

	//상위카테고리 번호로 찾기
	public MainCateDTO getM_key(int main_cat_key) {
		return mapper.getM_key(main_cat_key);
	}
	//하위카테고리 번호로 찾기
	public SubCateDTO getS_key(int sub_cat_key) {
		return mapper.getS_key(sub_cat_key);
	}
}

