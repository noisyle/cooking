package com.noisyle.crowbar.repository;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.noisyle.crowbar.core.base.BaseHibernateRepository;
import com.noisyle.crowbar.model.CuisineCat;

@Repository
public class CuisineCatRepository extends BaseHibernateRepository<CuisineCat, Long> {

	public List<CuisineCat> queryCuisineCatList(String q) {
		if(q!=null && !"".equals(q.trim())){
			Criterion query = Restrictions.ilike("name", q.trim());
			return this.find(query);
		}else{
			return this.getAll();
		}
	}
	
}