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
import com.book.model.Supplier;
import com.book.service.CategoryService;
import com.book.service.SupplierService;

@Controller
public class SupplierController {
	@Autowired(required=true)
	private SupplierService supplierService;
	
	@RequestMapping(value = "/suppliers",method = RequestMethod.GET)
	public String listSuppliers(Model model) {
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("supplierList", this.supplierService.list());
		return "supplier";

}
	@RequestMapping(value= "/supplier/add")
	public String addSupplier(@ModelAttribute("supplier") Supplier supplier){
		
		supplierService.saveOrUpdate(supplier);
		
		return "redirect:/suppliers";
		
	}
	@RequestMapping("supplier/remove/{id}")
    public String deleteSupplier(@PathVariable("id") String id,ModelMap model) throws Exception{
		
       try {
    	   supplierService.delete(id);
		model.addAttribute("message","Successfully Added");
	} catch (Exception e) {
		model.addAttribute("message",e.getMessage());
		e.printStackTrace();
	}
       //redirectAttrs.addFlashAttribute(arg0, arg1)
        return "redirect:/categories";
    }
 
    @RequestMapping("supplier/edit/{id}")
    public String editSupplier(@PathVariable("id") String id, Model model){
    	System.out.println("editSupplier");
        model.addAttribute("supplier", this.supplierService.get(id));
        model.addAttribute("listSuppliers", this.supplierService.list());
        return "supplier";
    }
}

