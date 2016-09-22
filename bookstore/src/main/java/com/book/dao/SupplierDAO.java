package com.book.dao;

import java.util.List;

import com.book.model.Sub_Category;
import com.book.model.Supplier;

public interface SupplierDAO {

	public void saveOrUpdate(Supplier supplier);
	public void delete (String id);
	public Supplier get(String id);
	public Supplier getByName(String name);
	public List<Supplier> list();
}
