package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;
import com.vitabucket.web.dto.*;



@Mapper
public interface Admin_settingMapper {
	
	//회사정보
	@Select("SELECT * FROM VITA_VITABUCKET")
	public Vita_Vitabucket basic();
	
	//회사정보저장
	public int settSave(Vita_Vitabucket vv);

	
	//약관저장
	public int terms_settingSave(Vita_Terms vt);
	
	//약관목록
	@Select("SELECT * FROM VITA_TERMS")
	public List<Vita_Terms> terms_list();
	
	//약관번호찾기
	@Select("SELECT * FROM VITA_TERMS WHERE TERMS_KEY=#{terms_key}")
	public Vita_Terms terms_keyFind(int terms_key);
	
	//약관 수정 저장
	@Update("UPDATE VITA_TERMS SET terms_name=#{terms_name},terms_content=#{terms_content},terms_required=#{terms_required} WHERE TERMS_KEY=#{terms_key}")
	public int terms_settingEditSave(Vita_Terms vt);
	
	//약관 삭제
	@Delete("DELETE FROM VITA_TERMS WHERE terms_key = #{terms_key}")
	public int terms_delete(int terms_key);
	
	
}
