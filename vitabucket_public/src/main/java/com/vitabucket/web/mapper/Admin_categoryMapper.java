package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;
import com.vitabucket.web.dto.*;



@Mapper
public interface Admin_categoryMapper {
	
	//상위카테고리 목록
	@Select("SELECT * FROM VITA_MAIN_CATEGORY ORDER BY main_cat_key")
	List<MainCateDTO> cateList();	
	
	//하위카테고리 목록
	@Select("SELECT * FROM VITA_SUB_CATEGORY WHERE MAIN_CAT_KEY=#{main_cat_key} ORDER BY sub_cat_key")
	List<SubCateDTO> cate_sList(int main_cat_key);
		
	//하위카테고리 추가(상위는 추가 안됨)
	int cateAdd(SubCateDTO sc);
	
	//하위카테고리 삭제(상위는 삭제 안됨)
	@Delete("DELETE FROM VITA_SUB_CATEGORY WHERE sub_cat_key = #{sub_cat_key}")
	int cateDel(int sub_cat_key);
	
	
	//상위카테고리 수정
	@Update("UPDATE VITA_MAIN_CATEGORY SET MAIN_CAT_NAME=#{main_cat_name} WHERE MAIN_CAT_KEY=#{main_cat_key}")
	int cateEdit(MainCateDTO mc);
	
	//하위카테고리 수정
	@Update("UPDATE VITA_SUB_CATEGORY SET SUB_CAT_NAME=#{sub_cat_name} WHERE SUB_CAT_KEY=#{sub_cat_key}")
	int cateEdit_s(SubCateDTO sc);
	
	
	
	//상위카테고리 번호 찾기
	@Select("SELECT * FROM VITA_MAIN_CATEGORY WHERE main_cat_key=#{main_cat_key}")
	MainCateDTO getM_key(int main_cat_key);
	
	//하위카테고리 번호 찾기
	@Select("SELECT s.*,m.* FROM VITA_SUB_CATEGORY s INNER JOIN VITA_MAIN_CATEGORY m ON m.main_cat_key = s.main_cat_key WHERE sub_cat_key=#{sub_cat_key}")
	SubCateDTO getS_key(int sub_cat_key);
}
