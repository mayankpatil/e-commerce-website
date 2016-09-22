package com.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.dao.SupplierDAOImpl;
import com.book.model.Supplier;

@Service
@Transactional

public class SupplierService {
	
	@Autowired
	SupplierDAOImpl supplierDAO;
	public List<Supplier> list(){
	  return supplierDAO.list();
	 }
	public void saveOrUpdate(Supplier category){
		 supplierDAO.saveOrUpdate(category);
	 }
	public void delete(String id){
		 supplierDAO.delete(id);
	}
	public Supplier get(String id){
		 return supplierDAO.get(id);
	}
	public Supplier getByName(String name) {
		
		return supplierDAO.getByName(name);
	}

}
