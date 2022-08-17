package com.shoekream.www.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shoekream.www.domain.PagingVO.PagingVO;

import com.shoekream.www.domain.filterVO.FilterDTO;
import com.shoekream.www.domain.productVO.ProductDTO;
import com.shoekream.www.domain.productVO.ProductVO;

import com.shoekream.www.handler.PagingHandler;
import com.shoekream.www.service.filterService.FilterBrandService;
import com.shoekream.www.service.filterService.FilterCategoryService;
import com.shoekream.www.service.productService.ProductService;



import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/product/*")
@Controller
public class ProductController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ProductService psv;
	@Inject
	private FilterCategoryService categoryService;
	
	@Inject
	private FilterBrandService brandService;
	
	@GetMapping("/listPage")
	public void list(Model model, PagingVO pgvo) {
		
	}

	@ResponseBody
	@GetMapping(value = "list", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ProductDTO> searchList(Model model, PagingVO pgvo) {
		ProductDTO productDTO = new ProductDTO(new PagingHandler(pgvo, psv.getTotalCount(pgvo)), psv.getList(pgvo));
		return new ResponseEntity<ProductDTO>(productDTO, HttpStatus.OK);
	}
	@GetMapping("/register")
	public void registerPage(Model model) {
		FilterDTO filterDTO = new FilterDTO();
		filterDTO.setObjectList1(brandService.getBrandList());
        filterDTO.setObjectList2(categoryService.getCategoryList());
		model.addAttribute("FilterDTO", filterDTO);
	}
	@PostMapping("/register")
	public String register(ProductVO productVO, @RequestParam(name = "fileAttached") MultipartFile[] files) {
		try {
			return "redirect:/items/detail?pno="+psv.register(productVO, files);
		}catch (Exception e) {
			System.err.println(e.getMessage());
			return "0";
		}
	}
//	@GetMapping("/originalList")
//	public void originalList(Model model, PagingVO pgvo) {
//		List<Map<String, String>> map = psv.getList(pgvo);
//		PagingHandler pgn = new PagingHandler(pgvo, psv.getTotalCount(pgvo));
//		model.addAttribute("map", map);
//		model.addAttribute("pgn", pgn);
//	}
}
