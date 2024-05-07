package com.vitabucket.web.svc;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vitabucket.web.dao.Admin_settingDAO;
import com.vitabucket.web.dto.Vita_Terms;
import com.vitabucket.web.dto.Vita_Vitabucket;

@Service
public class Admin_settingSVC {
	@Autowired
	private Admin_settingDAO dao;

	//회사정보
	public Vita_Vitabucket bagic(){
		return dao.basic();
	}
	
	//회사정보저장
	public boolean settSave(Vita_Vitabucket vv){
		return dao.settSave(vv)>0;
	}

	//약관 저장
	public boolean terms_settingSave(Vita_Terms vt){
		return dao.terms_settingSave(vt)>0;
	}
	
	//약관목록
	public List<Vita_Terms> terms_list(){
		return dao.terms_list();
	}

	//약관번호찾기
	public Vita_Terms terms_keyFind(int terms_key){
		return dao.terms_keyFind(terms_key);
 	}
	
	//약관 수정 저장
	public boolean terms_settingEditSave(Vita_Terms vt){
		return dao.terms_settingEditSave(vt)>0;
	}
	
	//약관 삭제
	public boolean terms_delete(int terms_key) {
		return dao.terms_delete(terms_key)>0;
	}
	
}
