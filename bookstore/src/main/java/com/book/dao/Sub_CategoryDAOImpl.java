package com.book.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.book.model.Category;
import com.book.model.Sub_Category;

public class Sub_CategoryDAOImpl implements Sub_CategoryDAO{
	public Sub_CategoryDAOImpl(){
		
	}
	@Autowired
	private SessionFactory sessionFactory;
	public Sub_CategoryDAOImpl(SessionFactory sessionFactory){
		super();
		this.sessionFactory = sessionFactory;
	}

	public void saveOrUpdate(Sub_Category sub_Category) {

       sessionFactory.getCurrentSession().saveOrUpdate(sub_Category);
		
	}

	public void delete(String id) {
		Sub_Category sub_CategoryToDelete = new Sub_Category();
		sub_CategoryToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(sub_CategoryToDelete);
	}

	public Sub_Category get(String id) {
		String hql = "from Sub_Category where id=" + "'"+ id +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		List<Sub_Category> listSub_Category = (List<Sub_Category>) query.list();
		
		if (listSub_Category != null && !listSub_Category.isEmpty()) {
			return listSub_Category.get(0);
		}
		    return null;
	}
	public Sub_Category getByName(String name){
		String hql = "from Sub_Category where name=" + "'" + name +"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		List<Sub_Category> listSub_Category = (List<Sub_Category>) query.list();
		
		if (listSub_Category != null && !listSub_Category.isEmpty()) {
			return listSub_Category.get(0);
		}
		   return null;
		
	}
	public List<Sub_Category> list() {
		
		@SuppressWarnings("unchecked")
		List<Sub_Category> listSub_Category = (List<Sub_Category>) 
		          sessionFactory.getCurrentSession()
				.createCriteria(Sub_Category.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		
		return listSub_Category;
	}

}
