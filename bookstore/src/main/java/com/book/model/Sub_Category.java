package com.book.model;

import java.util.Set;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.web.multipart.MultipartFile;

@Entity

public class Sub_Category {
	
	
	
	
	@Id
    String id;
	String name;
	String cat_id;
	String desc;
	//MultipartFile image;
	
	
	@ManyToOne
	@JoinColumn(name="cat_id", insertable=false, updatable=false, nullable=false)
	
	private Category category;
	@ElementCollection(targetClass=Product.class)
	@OneToMany(mappedBy="sub_category",fetch=FetchType.EAGER)
	private Set<Product> products;
	
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	
	

	public void setId(String id) {
		this.id = id;
	}

	public String getCat_id() {
		return cat_id;
	}

	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	//public MultipartFile getImage() {
		//return image;
	//}

    //	public void setImage(MultipartFile image) {
	//	this.image = image;
	//}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	public String toString()
	{
		
		return "{id : '" + id + "'," + "name : '" +name + "'," + "desc :'" + desc + "'}";
	}
}
	

