package com.vitabucket.web.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitabucket.web.dto.*;
import com.vitabucket.web.mapper.*;

@Repository
public class Admin_settingDAO {
	@Autowired
	Admin_settingMapper mapper;
	
	//회사정보
	public Vita_Vitabucket basic() {
		return mapper.basic();
	}
	
	//회사정보 저장
	public int settSave(Vita_Vitabucket vv){
		return mapper.settSave(vv);
	}

	//약관저장
	public int terms_settingSave(Vita_Terms vt){
		return mapper.terms_settingSave(vt);
	}
	
	//약관목록
	public List<Vita_Terms> terms_list(){
		return mapper.terms_list();
	}
	
	//약관 번호찾기
	public Vita_Terms terms_keyFind(int terms_key){
		return mapper.terms_keyFind(terms_key);
	}
		
	//약관 수정 저장
	public int terms_settingEditSave(Vita_Terms vt){
		return mapper.terms_settingEditSave(vt);
	}
	
	//약관 삭제
	public int terms_delete(int terms_key) {
		return mapper.terms_delete(terms_key);
	}
}

