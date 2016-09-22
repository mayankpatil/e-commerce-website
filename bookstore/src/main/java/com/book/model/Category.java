package com.book.model;

import java.util.Set;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	String id;
	String name;
	String desc;
	
	
	
	@ElementCollection(targetClass=Sub_Category.class)
	@OneToMany(mappedBy="category",fetch=FetchType.EAGER)
	private Set<Sub_Category> sub_Categories;
	
	
    public Set<Sub_Category> getSub_Categories() {
		return sub_Categories;
	}
	public void setSub_Categories(Set<Sub_Category> sub_Categories) {
		this.sub_Categories = sub_Categories;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String toString()
	{
		
		return "{id : '" + id + "'," + "name : '" +name + "'," + "desc :'" + desc + "'}";
	}
}
