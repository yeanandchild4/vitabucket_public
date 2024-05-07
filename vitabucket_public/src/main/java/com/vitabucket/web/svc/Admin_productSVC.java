package com.vitabucket.web.svc;

import java.io.File;
import java.util.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.vitabucket.web.dao.*;
import com.vitabucket.web.dto.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Admin_productSVC {
	@Autowired
	private Admin_productDAO dao;
	
	private final String savePath = "D:/git/vitabucket/vitabucket/src/main/webapp/images/product/";
	
	//검색
	public List<ProductDTO> search(HashMap<String,String> map){
		List<ProductDTO> plist = new ArrayList<>();
		
		List<ProductDTO> p = dao.search(map);
		
		for(ProductDTO pro : p) {
			int proKey = pro.getPro_key();
			Product_ImgDTO p_img = dao.pro_img(proKey);
			pro.setImgs(p_img);
			plist.add(pro);
		}
		return plist;
	}
	
	/*상품목록
	public List<ProductDTO> prodList(){
		return dao.prodList();
	}*/

	
	//상품+상품이미지+하위카테고리 연결 목록
	public List<ProductDTO> pro_cate_all(){
		List<ProductDTO> plist = new ArrayList<>();
		
		List<ProductDTO> p = dao.pro_cate_all();
		
		for(ProductDTO pro : p) {
			int proKey = pro.getPro_key();
			Product_ImgDTO p_img = dao.pro_img(proKey);
			pro.setImgs(p_img);
			plist.add(pro);
		}
		return plist;
	};
	
	
	//상품등록
	@Transactional
	public boolean pro_added(MultipartFile main_img,MultipartFile img1,MultipartFile img2,MultipartFile img3,MultipartFile img4, ProductDTO p) {
	    try {        
	                Product_ImgDTO imgs = new Product_ImgDTO();
	                String postfix = UUID.randomUUID().toString();
	                
	                String main_img_name = main_img.getOriginalFilename();
	                String img1_name = img1.getOriginalFilename();
	                String img2_name = img2.getOriginalFilename();	            
	                
	                String[] main_name = main_img_name.split("\\.");
	                String[] name1 = img1_name.split("\\.");
	                String[] name2 = img2_name.split("\\.");	    
	                
	                String smain_name = main_name[0] + "_" + postfix + "." + main_name[1];
	                String simg_name1 = name1[0] + "_" + postfix + "." + name1[1];
	                String simg_name2 = name2[0] + "_" + postfix + "." + name2[1];      
	                
	                File main_file = new File(savePath + smain_name);
	                File file1 = new File(savePath + simg_name1);
	                File file2 = new File(savePath + simg_name2);	               
	                
	                main_img.transferTo(main_file);
	                img1.transferTo(file1);
	                img2.transferTo(file2);	                

	                
	                imgs.setMain_img(smain_name); // 원본 파일명을 주 이미지로 설정
	                imgs.setImg1(simg_name1);	                	            
	                imgs.setImg2(simg_name2);	          
	                
	                
	                if (!img3.isEmpty()) {
	                    String img3_name = img3.getOriginalFilename();
	                    String[] name3 = img3_name.split("\\.");
	                    String simg_name3 = name3[0] + "_" + postfix + "." + name3[1];
	                    File file3 = new File(savePath + simg_name3);
	                    img3.transferTo(file3);
	                    imgs.setImg3(simg_name3);
	                }else if(!img4.isEmpty()) {
	                    String img4_name = img4.getOriginalFilename();
	                    String[] name4 = img4_name.split("\\.");
	                    String simg_name4 = name4[0] + "_" + postfix + "." + name4[1];
	                    File file4 = new File(savePath + simg_name4);
	                    img4.transferTo(file4);
	                    imgs.setImg4(simg_name4);
	                }
	                // 상품 정보 및 이미지 정보 저장
                int pro = dao.pro_added(p);
                if (pro > 0) {
                    int proKey = p.getPro_key(); 
                    imgs.setPro_key(proKey);
                    int pro_img= dao.pro_added_img(imgs);
                    return pro_img > 0;
                }
            return false;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	//상품 번호찾기
	public ProductDTO get_proNum(int pro_key) {		
		ProductDTO pd = dao.get_proNum(pro_key);
		pd.setImgs(dao.pro_img(pro_key));
		return pd;
	}
	
	//상품수정저장
	@Transactional
	public boolean pro_updated(MultipartFile main_img,MultipartFile img1,MultipartFile img2,MultipartFile img3,MultipartFile img4, ProductDTO p,int pro_img_key) {
	    try {        
	                Product_ImgDTO imgs = new Product_ImgDTO();
	                String postfix = UUID.randomUUID().toString();
	                
	                String main_img_name = main_img.getOriginalFilename();
	                String img1_name = img1.getOriginalFilename();
	                String img2_name = img2.getOriginalFilename();	            
	                
	                String[] main_name = main_img_name.split("\\.");
	                String[] name1 = img1_name.split("\\.");
	                String[] name2 = img2_name.split("\\.");	    
	                
	                String smain_name = main_name[0] + "_" + postfix + "." + main_name[1];
	                String simg_name1 = name1[0] + "_" + postfix + "." + name1[1];
	                String simg_name2 = name2[0] + "_" + postfix + "." + name2[1];      
	                
	                File main_file = new File(savePath + smain_name);
	                File file1 = new File(savePath + simg_name1);
	                File file2 = new File(savePath + simg_name2);	               
	                
	                main_img.transferTo(main_file);
	                img1.transferTo(file1);
	                img2.transferTo(file2);	                

	                
	                imgs.setMain_img(smain_name); // 원본 파일명을 주 이미지로 설정
	                imgs.setImg1(simg_name1);	                	            
	                imgs.setImg2(simg_name2);	          
	                
	                
	                if (!img3.isEmpty()) {
	                    String img3_name = img3.getOriginalFilename();
	                    String[] name3 = img3_name.split("\\.");
	                    String simg_name3 = name3[0] + "_" + postfix + "." + name3[1];
	                    File file3 = new File(savePath + simg_name3);
	                    img3.transferTo(file3);
	                    imgs.setImg3(simg_name3);
	                }else if(!img4.isEmpty()) {
	                    String img4_name = img4.getOriginalFilename();
	                    String[] name4 = img4_name.split("\\.");
	                    String simg_name4 = name4[0] + "_" + postfix + "." + name4[1];
	                    File file4 = new File(savePath + simg_name4);
	                    img4.transferTo(file4);
	                    imgs.setImg4(simg_name4);
	                }
	                
	                //이미지 삭제  
                    Product_ImgDTO p_img = dao.pro_img_find(pro_img_key); // 단일 이미지 정보 가져오기
            	    String[] imgPaths = {p_img.getMain_img(), p_img.getImg1(), p_img.getImg2(), p_img.getImg3(), p_img.getImg4()};
            	    for(String imgPath : imgPaths) {
            	        if (imgPath != null && !imgPath.isEmpty()) {
            	            File f = new File(savePath, imgPath);
            	            log.info("삭제:" + f.getPath());
            	            if (f.exists()) {
            	                if (!f.delete()) {
            	                    throw new RuntimeException("기존파일 삭제 오류");
            	                }
            	            }
            	        }
            	    }                
                    dao.pro_del_img(pro_img_key);
                    
		            // 상품 정보 및 이미지 정보 저장
	                int pro = dao.pro_update(p);
	                
	                //pro_key 넣어주기
	                imgs.setPro_key(p.getPro_key());	                
		            //이미지 새로 저장                    
                    int add_img = dao.pro_added_img(imgs);     
	                
                    return  add_img> 0 && pro>0;     
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	//상품삭제 && 상품이미지삭제
	@Transactional
	public boolean pro_del(int pro_key) {	    
	    // 상품 정보 및 이미지 정보 가져오기
	    ProductDTO p = dao.get_proNum(pro_key);    

	    // 이미지 파일 경로 가져오기
		Product_ImgDTO p_img = dao.pro_img(pro_key); // 단일 이미지 정보 가져오기
	    String[] imgPaths = {p_img.getMain_img(), p_img.getImg1(), p_img.getImg2(), p_img.getImg3(), p_img.getImg4()};
	    for(String imgPath : imgPaths) {
	        if (imgPath != null && !imgPath.isEmpty()) {
	            File f = new File(savePath, imgPath);
	            log.info("삭제:" + f.getPath());
	            if (f.exists()) {
	                if (!f.delete()) {
	                    throw new RuntimeException("기존파일 삭제 오류");
	                }
	            }
	        }
	    }
	    return dao.pro_del(pro_key) > 0;
	}
	

	// 상품목록 선택삭제
	@Transactional(rollbackFor = {Exception.class})
	public boolean pro_selec_del(List<Integer> prokeys) {
	    boolean success = true; // 삭제 성공 여부를 저장할 변수를 초기화합니다.

	    // 각 상품의 키에 대해 반복합니다.
	    for (int pro_key : prokeys) {
	        // 상품 정보 및 이미지 정보 가져오기
	        ProductDTO p = dao.get_proNum(pro_key);    

	        // 이미지 파일 경로 가져오기
	        Product_ImgDTO p_img = dao.pro_img(pro_key); // 단일 이미지 정보 가져오기
	        String[] imgPaths = {p_img.getMain_img(), p_img.getImg1(), p_img.getImg2(), p_img.getImg3(), p_img.getImg4()};
	        
	        // 각 이미지 파일에 대해 반복하여 삭제합니다.
	        for(String imgPath : imgPaths) {
	            if (imgPath != null && !imgPath.isEmpty()) {
	                File f = new File(savePath, imgPath);
	                log.info("삭제:" + f.getPath());
	                if (f.exists()) {
	                    if (!f.delete()) {
	                        // 파일 삭제 실패 시 예외를 던집니다.
	                        throw new RuntimeException("기존파일 삭제 오류");
	                    }
	                }
	            }
	        }
	        
	        // 상품을 삭제하고 그 결과를 success 변수에 추가합니다.
	        success &= dao.pro_del(pro_key) > 0;
	    }

	    // 모든 상품 삭제가 성공했는지 여부를 반환합니다.
	    return success;
	}

	
	
	
	
}



