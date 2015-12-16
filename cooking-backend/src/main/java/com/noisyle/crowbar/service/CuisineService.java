package com.noisyle.crowbar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.noisyle.crowbar.model.CuisineCat;
import com.noisyle.crowbar.repository.CuisineCatRepository;
import com.noisyle.crowbar.repository.CuisineRepository;

@Service
@Transactional
public class CuisineService {

    @Autowired
    private CuisineCatRepository cuisineCatRepository;
    @Autowired
    private CuisineRepository cuisineRepository;
    
	public List<CuisineCat> queryCuisineCatList(String q) {
		return cuisineCatRepository.queryCuisineCatList(q);
	}    
    public void saveCuisineCat(CuisineCat cat) {
    	cuisineCatRepository.save(cat);
    }
    
    public void deleteCuisineCat(Long id) {
    	cuisineCatRepository.delete(id);
    }
	
}
