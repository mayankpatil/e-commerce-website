package com.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.book.model.Category;
import com.book.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired(required=true)
	private CategoryService categoryService;
	
	
	
	/*@RequestMapping(value = "/onLoad", method = RequestMethod.GET)
	public String onLoad(Model model) {
		System.out.println("onLoad");
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList", this.categoryService.list());
		return "/Home";
	}*/
	
	
	@RequestMapping(value = "/categories",method = RequestMethod.GET)
	public String listCategories(Model model) {
		model.addAttribute("category", new Category());
		model.addAttribute("categoryList", this.categoryService.list());
		return "category";
	}
	
	@RequestMapping(value= "/category/add")
	public String addCategory(@ModelAttribute("category") Category category){
		
	
			categoryService.saveOrUpdate(category);
		
		return "redirect:/categories";
		
	}
	@RequestMapping("category/remove/{id}")
    public String deleteCategory(@PathVariable("id") String id,ModelMap model) throws Exception{
		
       try {
		categoryService.delete(id);
		model.addAttribute("message","Successfully Added");
	} catch (Exception e) {
		model.addAttribute("message",e.getMessage());
		e.printStackTrace();
	}
       //redirectAttrs.addFlashAttribute(arg0, arg1)
        return "redirect:/categories";
    }
 
    @RequestMapping("category/edit/{id}")
    public String editCategory(@PathVariable("id") String id, Model model){
    	System.out.println("editCategory");
        model.addAttribute("category", this.categoryService.get(id));
        model.addAttribute("listCategories", this.categoryService.list());
        return "category";
    }



}
