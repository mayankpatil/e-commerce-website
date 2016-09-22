package com.book.dao;

import java.util.List;

import com.book.model.Product;

public interface ProductDAO {
  public void saveOrUpdate(Product product);
  public void delete(String id);
  public Product get(String id);
  public Product getByName(String name);
  public List<Product> list();
}
