package com.vitabucket.web.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.vitabucket.web.dto.ProductDTO;
import com.vitabucket.web.dto.Product_ImgDTO;
import com.vitabucket.web.dto.Vita_Vitabucket;

@Mapper
public interface VitaMapper {
	
	Vita_Vitabucket getVita();
	List<Product_ImgDTO> getBest(List<ProductDTO> list);

}
