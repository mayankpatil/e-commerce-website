package com.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.dao.UserDAOImpl;
import com.book.model.User;




	@Service
	@Transactional

	
	public class UserService {
		@Autowired
		UserDAOImpl userDAO;
			
			public void saveOrUpdate(User user){
			userDAO.saveOrUpdate(user);
			}
				
			

	}

