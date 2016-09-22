package com.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.book.dao.Sub_CategoryDAOImpl;
import com.book.model.Sub_Category;


@Service
@Transactional

public class Sub_CategoryService {
	
	@Autowired
	Sub_CategoryDAOImpl sub_CategoryDAO;
	public List<Sub_Category> list(){
		return sub_CategoryDAO.list();
	}
	public void saveOrUpdate(Sub_Category category){
		sub_CategoryDAO.saveOrUpdate(category);
	}
		
	public void delete(String id) {
		sub_CategoryDAO.delete(id);
		
	}
	public Sub_Category get(String id){
		return sub_CategoryDAO.get(id);
	
    }
	public Sub_Category getByName(String name){
		return sub_CategoryDAO.getByName(name);
	}
}

