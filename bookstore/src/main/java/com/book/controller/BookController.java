package com.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.book.service.CategoryService;
import com.book.service.ProductService;
import com.book.service.Sub_CategoryService;

@Controller
public class BookController {
	
	@Autowired	(required=true)
	private Sub_CategoryService sub_categoryService;
	
	@Autowired(required=true)
	private CategoryService categoryService;
	
	@Autowired	(required=true)
	private ProductService productService;
	
	
	@RequestMapping("/")
	public String getHome(Model model) {
		
		model.addAttribute("categoryList",this.categoryService.list());
		model.addAttribute("sub_categoryList",this.sub_categoryService.list());
		model.addAttribute("productList",this.productService.list());
		return "home";
	}

}
