package com.vitabucket.web.svc;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitabucket.web.dao.*;
import com.vitabucket.web.dto.*;

@Service
public class Admin_categorySVC {
	@Autowired
	private Admin_categoryDAO dao;

	public List<MainCateDTO> cateList() {
		return dao.cateList();
	}
	
	public List<SubCateDTO> cate_sList(int main_cat_key) {
		return dao.cate_sList(main_cat_key);
	}
	
	public boolean cate(SubCateDTO sc) {
		return dao.cate(sc)>0;
	}
	
	public boolean cateDel(int sub_cat_key){
		return dao.cateDel(sub_cat_key)>0;
	}
	
	public boolean cateEdit(MainCateDTO mc) {
		return dao.cateEdit(mc)>0;
	}
	public boolean cateEdit_s(SubCateDTO sc) {
		return dao.cateEdit_s(sc)>0;
	}
	
	//상위카테고리 번호로 찾기
	public MainCateDTO getM_key(int main_cat_key) {
		return dao.getM_key(main_cat_key);
	}
	
	//하위카테고리 번호로 찾기
	public SubCateDTO getS_key(int sub_cat_key) {
		return dao.getS_key(sub_cat_key);
	}

}
