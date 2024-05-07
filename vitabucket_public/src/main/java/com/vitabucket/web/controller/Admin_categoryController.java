package com.vitabucket.web.controller;

import java.io.IOException;
import java.util.*;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.vitabucket.web.dto.*;
import com.vitabucket.web.svc.*;

import jakarta.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/vitabucket/admin/cate")
public class Admin_categoryController {
	@Autowired
	private Admin_categorySVC svc;
	
	/*카테고리 관리*/
	//상위카테고리 목록
	@GetMapping("")
	public String category(Model m) {
		m.addAttribute("clist", svc.cateList());
		return "admin/first_page/category";
	}
	
	//하위카테고리 목록
	@PostMapping("/c_admin/c_subItem")
	@ResponseBody
	public Map<String,Object> categorySelect(@RequestParam int main_cat_key)
         {
		List<SubCateDTO> cslist=svc.cate_sList(main_cat_key);
		Map<String,Object> map = new HashMap<>();
		map.put("cslist", cslist);
		return map;
	}

	//하위카테고리 추가
	@PostMapping("/c_admin/add")
	@ResponseBody
	public Map<String,Object> categoryAdd(SubCateDTO sc){
		Map<String,Object> map =new HashMap<>();
		map.put("cateAdd",svc.cate(sc));
		return map;
	}
	
	//하위카테고리 삭제
	@PostMapping("/c_admin/deleted")
	@ResponseBody
	public Map<String,Object> categoryDel(int sub_cat_key) {
		Map<String,Object> map = new HashMap<>();
		map.put("cateDel", svc.cateDel(sub_cat_key));
		return map;
	}
	
	//상위카테고리 수정화면
	@GetMapping("/c_admin/edit")
	public String categoryEdit(@RequestParam int main_cat_key,Model m) {
		m.addAttribute("mc",svc.getM_key(main_cat_key));
		return "admin/second_page/category_edit";
	}
	
	//상위카테고리 수정 
	@PostMapping("/c_admin/edit")	
	@ResponseBody
	public Map<String,Object> categoryEdit(MainCateDTO mc) {
		Map<String,Object> map = new HashMap<>();
		map.put("okedit",svc.cateEdit(mc));		
		return map;
	}
	
	//하위카테고리 수정화면
	@GetMapping("/c_admin/edit_s")
	public String categoryEdit_s(@RequestParam int sub_cat_key,Model m) {
		m.addAttribute("sc",svc.getS_key(sub_cat_key));
		return "admin/second_page/category_edit_s";
	}
	
	@PostMapping("/c_admin/edit_s")	
	@ResponseBody
	public Map<String,Object> categoryEdit_s(SubCateDTO sc) {
		Map<String,Object> map = new HashMap<>();
		map.put("okedit",svc.cateEdit_s(sc));		
		return map;
	}
	
	/*-------------------------------------------------------*/

	
}
