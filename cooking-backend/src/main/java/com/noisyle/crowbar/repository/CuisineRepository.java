package com.noisyle.crowbar.repository;

import org.springframework.stereotype.Repository;

import com.noisyle.crowbar.core.base.BaseHibernateRepository;
import com.noisyle.crowbar.model.Cuisine;

@Repository
public class CuisineRepository extends BaseHibernateRepository<Cuisine, Long> {

}