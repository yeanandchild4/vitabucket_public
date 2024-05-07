package com.vitabucket.web.controller;

import java.io.IOException;
import java.util.*;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.svc.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/vitabucket/admin/memb")
public class Admin_memberController {
	@Autowired
	private Admin_memberSVC svc;
		
	//회원관리
	@GetMapping("")
	public String member(Model m) {
		m.addAttribute("mlist",svc.memberList());
		return "admin/first_page/membership";
	}
	
	//회원검색
	@PostMapping("")
	public String search(@RequestParam HashMap<String,String> map, Model m){
		m.addAttribute("mlist",svc.search(map));
		return "admin/first_page/membership";
	}	
	
	//회원정보 상세
	@GetMapping("/detail/{unum}")
	public String memb_detail(@PathVariable("unum") int unum,Model m) {
		m.addAttribute("m",svc.memb_detail(unum));
		return "admin/second_page/member_detail";
	}
	
	//회원삭제
	@PostMapping("/dele/{unum}")
	@ResponseBody
	public Map<String,Object> pro_del(@PathVariable("unum") int unum) {
		Map<String,Object> map =new HashMap<>();
		map.put("memDel",svc.mem_del(unum));
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
	    cell.setCellValue("회원번호");
	    cell = row.createCell(1);
	    cell.setCellValue("회원명");
	    cell = row.createCell(2);
	    cell.setCellValue("아이디");
	    cell = row.createCell(3);
	    cell.setCellValue("이메일");
	    cell = row.createCell(4);
	    cell.setCellValue("연락처");
	    cell = row.createCell(5);
	    cell.setCellValue("소셜매체");

	    // 회원 목록 가져오기
	    List<UserVO> mli = svc.memberList();

	    // 바디 생성
	    for (int i = 0; i < mli.size(); i++) {
	        UserVO u = mli.get(i);
	        row = sheet.createRow(rowNum++);
	        cell = row.createCell(0);
	        cell.setCellValue(u.getUnum());
	        cell = row.createCell(1);
	        cell.setCellValue(u.getName());
	        
	        cell = row.createCell(2);
	        if(u.getUser_id()==null) {
	        	cell.setCellValue(u.getUser_email());
	        }else {
	        	cell.setCellValue(u.getUser_id());
	        	cell = row.createCell(3);
	        	cell.setCellValue(u.getUser_email());
	        }
	        
	        cell = row.createCell(4);
	        cell.setCellValue(u.getUser_phone());
	        cell = row.createCell(5);
	        cell.setCellValue(u.getProvider());
	    }

	    // Excel 파일을 바이트 배열로 변환
	    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	    wb.write(outputStream);
	    wb.close();
	    byte[] excelBytes = outputStream.toByteArray();

	    // HTTP 응답에 필요한 헤더 설정
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	    headers.setContentDispositionFormData("attachment", "memberList.xlsx");
	    headers.setContentLength(excelBytes.length);

	    // ResponseEntity를 사용하여 바이트 배열 및 헤더 반환
	    return new ResponseEntity<>(excelBytes, headers, HttpStatus.OK);
	}

	
}
