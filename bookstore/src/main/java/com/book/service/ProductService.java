package com.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.dao.ProductDAOImpl;
import com.book.model.Product;

@Service
@Transactional

public class ProductService {

	@Autowired
	ProductDAOImpl ProductDAO;
		public List<Product> list(){
			return ProductDAO.list();
		}
		public void saveOrUpdate(Product product){
			ProductDAO.saveOrUpdate(product);
		}
			
		public void delete(String id) {
			ProductDAO.delete(id);
			
		}
		public Product get(String id){
			return ProductDAO.get(id);
		
        }
		public Product getByName(String name){
			return ProductDAO.getByName(name);
		}
}