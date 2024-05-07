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
import org.springframework.web.multipart.MultipartFile;

import com.vitabucket.web.dto.*;
import com.vitabucket.web.svc.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/vitabucket/admin/prod")
public class Admin_productController {
	@Autowired
	private Admin_productSVC svc;
	
	@Autowired
	private Admin_categorySVC caSvc;
	
	
	//상품목록
	@GetMapping("")
	public String product(Model m) {
		//카테고리 상/하 불러오기
		m.addAttribute("clist",caSvc.cateList());		
		//상품+상품이미지+하위카테고리 연결
		m.addAttribute("plist",svc.pro_cate_all());	
		return "admin/first_page/product";
	}	
	
	//하위카테고리 목록
	@PostMapping("/catelist")
	@ResponseBody
	public Map<String,Object> catelist(@RequestParam int main_cat_key)
         {
		List<SubCateDTO> cslist=caSvc.cate_sList(main_cat_key);
		Map<String,Object> map = new HashMap<>();
		map.put("cslist", cslist);
		return map;
	}

	//상품검색
	@PostMapping("")
	public String search(@RequestParam HashMap<String,String> map, Model m){
		m.addAttribute("plist",svc.search(map));
		
		//카테고리 상/하 불러오기
		m.addAttribute("clist",caSvc.cateList());	
		return "admin/first_page/product";
	}	
	
	//상품추가 페이지
	@GetMapping("/add")
	public String pro_add(Model m) {
		//카테고리 상/하 불러오기
		m.addAttribute("clist",caSvc.cateList());
		return "admin/second_page/product_add";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Object> pro_added(@RequestParam("main_img")MultipartFile main_img,@RequestParam("img1")MultipartFile img1
			,@RequestParam("img2")MultipartFile img2,@RequestParam("img3")MultipartFile img3,@RequestParam("img4")MultipartFile img4,
	    HttpServletRequest request, ProductDTO p) {	
			
	        Map<String, Object> map = new HashMap<>();
	        
	        map.put("proAdded", svc.pro_added(main_img,img1, img2, img3, img4,p));
	        return map;
	}

	//상품상세페이지
	@GetMapping("/detail/{pro_key}")
	public String pro_detail(@PathVariable("pro_key") int pro_key,Model m) {
		m.addAttribute("p",svc.get_proNum(pro_key));	
		return "admin/second_page/product_detail";
	}

	
	//상품수정 페이지
	@GetMapping("/edit/{pro_key}")
	public String pro_edit(@PathVariable("pro_key") int pro_key,Model m) {
		//카테고리 상/하 불러오기
		m.addAttribute("clist",caSvc.cateList());
		
		//해당 상품의 카테고리 불러오기		
		m.addAttribute("p",svc.get_proNum(pro_key));			
		return "admin/third_page/product_edit";
	}
	
	//상품수정 저장
	@PostMapping("/edit/{pro_key}")
	@ResponseBody
	public Map<String, Object> pro_edit(@RequestParam("main_img")MultipartFile main_img,@RequestParam("img1")MultipartFile img1
			,@RequestParam("img2")MultipartFile img2,@RequestParam("img3")MultipartFile img3,@RequestParam("img4")MultipartFile img4,
	    HttpServletRequest request, ProductDTO p, int pro_img_key) {	
			
		
	        Map<String, Object> map = new HashMap<>();
	        
	        map.put("proUpdated", svc.pro_updated(main_img,img1, img2, img3, img4,p,pro_img_key));
	        return map;
	}
	
	
	//상품삭제
	@PostMapping("/dele/{pro_key}")
	@ResponseBody
	public Map<String,Object> pro_del(@PathVariable("pro_key") int pro_key) {
		Map<String,Object> map =new HashMap<>();
		map.put("proDel",svc.pro_del(pro_key));
		return map;
	}	

	
	//상품 선택삭제
	@PostMapping("/dele_sele")
	@ResponseBody
	public Map<String,Object> pro_selec_del(@RequestParam("check_key") List<Integer> prokeys) {
		
		Map<String,Object> map =new HashMap<>();
		map.put("pro_selec_del",svc.pro_selec_del(prokeys));
		return map;
	}
	
	
	//엑셀 다운로드
	@GetMapping("/excel/download")
	public ResponseEntity<byte[]> excel(HttpServletResponse response) throws IOException {
	    XSSFWorkbook wb = new XSSFWorkbook();
	    XSSFSheet sheet = wb.createSheet("첫번째 시트");
	    Row row = null;
	    Cell cell = null;
	    int rowNum = 0;

	    // 헤더 생성
	    row = sheet.createRow(rowNum++);
	    cell = row.createCell(0);
	    cell.setCellValue("상품번호");
	    cell = row.createCell(1);
	    cell.setCellValue("상품명");
	    cell = row.createCell(2);
	    cell.setCellValue("상품카테고리");
	    cell = row.createCell(3);
	    cell.setCellValue("상품가격");
	    cell = row.createCell(4);
	    cell.setCellValue("상품재고");
	    cell = row.createCell(5);
	    cell.setCellValue("조회수");
	    // 카테고리 목록 가져오기
	    List<ProductDTO> pli = svc.pro_cate_all();
	    
	    // 바디 생성
	    for (int i = 0; i < pli.size(); i++) {
	    	ProductDTO p = pli.get(i);
	        row = sheet.createRow(rowNum++);
	        cell = row.createCell(0);
	        cell.setCellValue(p.getPro_key());
	        cell = row.createCell(1);
	        cell.setCellValue(p.getPro_name());  
	        cell = row.createCell(2);
	        cell.setCellValue(p.getMain_cat_name()+"-"+p.getSub_cat_name());
	        cell = row.createCell(3);
	        cell.setCellValue(p.getPro_price());
	        cell = row.createCell(4);
	        cell.setCellValue(p.getPro_stock());
	        cell = row.createCell(5);
	        cell.setCellValue(p.getPro_hit());
	    }

	    // Excel 파일을 바이트 배열로 변환
	    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	    wb.write(outputStream);
	    wb.close();
	    byte[] excelBytes = outputStream.toByteArray();

	    // HTTP 응답에 필요한 헤더 설정
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    headers.setContentDispositionFormData("attachment", "productList.xlsx");
	    headers.setContentLength(excelBytes.length);

	    // ResponseEntity를 사용하여 바이트 배열 및 헤더 반환
	    return new ResponseEntity<>(excelBytes, headers, HttpStatus.OK);
	}

	
	
	
}
