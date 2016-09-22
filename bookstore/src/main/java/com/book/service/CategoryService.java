package com.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.dao.CategoryDAOImpl;
import com.book.model.Category;

@Service
@Transactional

public class CategoryService {

	@Autowired
	CategoryDAOImpl categoryDAO;
		public List<Category> list(){
			return categoryDAO.list();
		}
		public void saveOrUpdate(Category category){
			categoryDAO.saveOrUpdate(category);
		}
			
		public void delete(String id) {
			categoryDAO.delete(id);
			
		}
		public Category get(String id){
			return categoryDAO.get(id);
		
        }
		public Category getByName(String name){
			return categoryDAO.getByName(name);
		}
}