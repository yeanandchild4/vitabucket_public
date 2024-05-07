package com.vitabucket.web.controller;

import java.io.InputStream;
import java.util.*;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.*;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.PrincipalDetails;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.svc.ProductSvc;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductSvc svc;
	@Autowired
	ResourceLoader resourceloader;
	
	/* 전체 상품 페이지 */
	@GetMapping("all")
	public String all_product(Model m) {
		m.addAttribute("path", "/product/all");
		m.addAttribute("pd_list", svc.getAllList(1));
		m.addAttribute("mainCat", svc.mainCates());
		return "ProductPage/List/all_Product";
	}
	
	@PostMapping("all") // 페이지 안보이도록 post 방식으로 넣기 ( url: /product/all )
	public String all_product(@RequestParam(value="sort", required = false) String sort, 
			@RequestParam("page") int page, Model m) {
		m.addAttribute("mainCat", svc.mainCates());
		if(sort==null) {
			m.addAttribute("path", "/product/all");
			m.addAttribute("pd_list", svc.getAllList(page));
		}else {
			if(sort.equals("best")) m.addAttribute("sort", "best");
			else if(sort.equals("lowest")) m.addAttribute("sort", "lowest");
			else m.addAttribute("sort", "highest");
			m.addAttribute("pd_list", svc.getAllSortList(sort, page));
		}
		return "ProductPage/List/all_Product";
	}

	
	@GetMapping("best")
	public String best_product(Model m) {
		m.addAttribute("path", "/product/best");
		m.addAttribute("pd_list", svc.getBestList(1));
		m.addAttribute("mainCat", svc.mainCates());
		return "ProductPage/List/best_Product";
	}
	
	@PostMapping("best")
	public String best_product(@RequestParam(value="sort", required = false) String sort, 
			@RequestParam("page") int page, Model m) {
		m.addAttribute("mainCat", svc.mainCates());
		if(sort==null) {
			m.addAttribute("path", "/product/best");
			m.addAttribute("pd_list", svc.getBestList(page));
		}else {
			if(sort.equals("best")) m.addAttribute("sort", "best");
			else if(sort.equals("lowest")) m.addAttribute("sort", "lowest");
			else m.addAttribute("sort", "highest");
			m.addAttribute("pd_list", svc.getBestSortList(sort, page));
		}
		return "ProductPage/List/best_Product";
	}
	
	@GetMapping("maincate{main}")
	public String mainCate_product(@PathVariable("main") int main, Model m) {
		m.addAttribute("path", "/product/cate");
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("main_cate", svc.getMainCate(main));
		m.addAttribute("sub_cate", svc.getSubCate_(main));
		m.addAttribute("pd_list", svc.getMainCateList(1, main));
		return "ProductPage/List/category_Product";
	}
	
	@PostMapping("maincate{main}")
	public String mainCate_product(@PathVariable("main") int main, 
			@RequestParam(value="sort", required = false) String sort, 
			@RequestParam("page") int page, Model m) {
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("main_cate", svc.getMainCate(main));
		m.addAttribute("sub_cate", svc.getSubCate_(main));
		if(sort==null) {
			m.addAttribute("path", "/product/cate");
			m.addAttribute("pd_list", svc.getMainCateList(page, main));
		}else {
			m.addAttribute("path", "/product/main");
			if(sort.equals("best")) m.addAttribute("sort", "best");
			else if(sort.equals("lowest")) m.addAttribute("sort", "lowest");
			else m.addAttribute("sort", "highest");
			m.addAttribute("pd_list", svc.getMainCateSortList(sort, page, main));
		}
		return "ProductPage/List/category_Product";
	}
	
	@GetMapping("subcate{sub}")
	public String subCate_product(@PathVariable("sub") int sub, Model m) {
		int main = svc.getSubCate(sub).getMain_cat_key();
		m.addAttribute("path", "/product/subcate");
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("main_cate", svc.getMainCate(main));
		m.addAttribute("sub_cate", svc.getSubCate_(main));
		m.addAttribute("sub_cat_key", sub);
		m.addAttribute("pd_list", svc.getSubCateList(1, sub));
		return "ProductPage/List/category_Product";
	}
	
	@PostMapping("subcate{sub}")
	public String subCate_product(@PathVariable("sub") int sub, 
			@RequestParam(value="sort", required = false) String sort, 
			@RequestParam("page") int page, Model m) {
		int main = svc.getSubCate(sub).getMain_cat_key();
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("main_cate", svc.getMainCate(main));
		m.addAttribute("sub_cate", svc.getSubCate_(main));
		m.addAttribute("sub_cat_key", sub);
		if(sort==null) {
			m.addAttribute("path", "/product/subcate");
			m.addAttribute("pd_list", svc.getSubCateList(page, sub));
		}else {
			if(sort.equals("best")) m.addAttribute("sort", "best");
			else if(sort.equals("lowest")) m.addAttribute("sort", "lowest");
			else m.addAttribute("sort", "highest");
			m.addAttribute("pd_list", svc.getSubCateSortList(sort, page, sub));
		}
		return "ProductPage/List/category_Product";
	}
	
	
	@GetMapping("search/{search}")
	public String search_product(@PathVariable(value="search", required = false) String search, Model m) {
		if(search==null) {
			m.addAttribute("path", "/product/all");
			m.addAttribute("pd_list", svc.getAllList(1));
			m.addAttribute("mainCat", svc.mainCates());
			return "ProductPage/List/all_Product";
		}
		
		m.addAttribute("search", search);
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("path", "/product/search");
		m.addAttribute("pd_list", svc.getSearchList(1, search));
		m.addAttribute("sc_list", svc.subCates(search));
		return "ProductPage/List/search_Product";
	}
	
	@PostMapping("search/{search}")
	public String search_product(@PathVariable("search") String search,
			Model m, @RequestParam(value="sort", required = false) String sort, 
			@RequestParam("page") int page) {
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("sc_list", svc.subCates(search));
		if(sort==null) {
			m.addAttribute("path", "/product/search");
			m.addAttribute("pd_list", svc.getSearchList(page, search));
		}else {
			if(sort.equals("best")) m.addAttribute("sort", "best");
			else if(sort.equals("lowest")) m.addAttribute("sort", "lowest");
			else m.addAttribute("sort", "highest");
			m.addAttribute("pd_list", svc.getSearchSortList(sort, page, search));
		}
		return "ProductPage/List/search_Product";
	}
	
	@GetMapping("detail/{pro_key}")
	public String detail(@PathVariable int pro_key, Model m, @AuthenticationPrincipal PrincipalDetails user) {
		svc.hitUp(pro_key);
		UserVO u = null;
		if(user==null) {
			u = null;
		}else u = user.getUser();
		
		m.addAttribute("user_wish", svc.checkWish(u, pro_key));
		m.addAttribute("path", "/product/detail");
		m.addAttribute("mainCat", svc.mainCates());
		m.addAttribute("pd", svc.getPdDetail(pro_key)); 
		m.addAttribute("pd_mainCat", svc.getMainCate(svc.getSubCate(svc.getPdDetail(pro_key).getSub_cat_key()).getMain_cat_key())); 
		m.addAttribute("pd_subCat", svc.getSubCate(svc.getPdDetail(pro_key).getSub_cat_key())); 
		m.addAttribute("pd", svc.getPdDetail(pro_key)); 
		m.addAttribute("review", svc.getBoard("review", pro_key));
		m.addAttribute("inquiry", svc.getBoard("inquiry", pro_key));
		return "ProductPage/pd_Detail";
	}
	
	@PostMapping("addwish")
	@ResponseBody
	public Map<String, Object> addWish(@AuthenticationPrincipal PrincipalDetails user, int pro_key){
		Map<String, Object> map = new HashMap<String, Object>();
		if(user==null) {
			map.put("login", false);
			return map;
		}
		map.put("login", true);
		map.put("ok", svc.wishAdd(user.getUser(), pro_key));
		return map;
	}
	
	@PostMapping("delwish")
	@ResponseBody
	public Map<String, Object> delWish(@AuthenticationPrincipal PrincipalDetails user, int pro_key){
		Map<String, Object> map = new HashMap<String, Object>();
		if(user==null) {
			map.put("login", false);
			return map;
		}
		map.put("login", true);
		map.put("ok", svc.delWish(user.getUser(), pro_key));
		return map;
	}	
	
	@PostMapping("addinquiry")
	@ResponseBody
	public Map<String, Object> addInquiry(@AuthenticationPrincipal PrincipalDetails user, BoardDTO board){
		Map<String, Object> map = new HashMap<String, Object>();
		if(user==null) {
			map.put("login", false);
			return map;
		}
		map.put("login", true);
		if(board.getBoard_title()=="" || board.getBoard_content()=="") {
			map.put("ok", false);
			return map;
		}
		map.put("ok", svc.inquiryAdd(user.getUser(), board));
		return map;
	}
	
	
	@GetMapping("/img/src/{savename}")
	@ResponseBody
	public byte[] img(@PathVariable("savename") String savename){

		try {
			Resource resource = resourceloader.getResource("WEB-INF/userImages/"+savename);
			InputStream in = resource.getInputStream();
			return IOUtils.toByteArray(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	}
}