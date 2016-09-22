package com.book.dao;

import java.util.List;

import com.book.model.Category;

public interface CategoryDAO {
	public void saveOrUpdate(Category category);
	public void delete (String id);
	public Category get(String id);
    public Category getByName(String name);
	public List<Category> list();


}
