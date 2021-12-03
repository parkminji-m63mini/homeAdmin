package com.mj.homeAdmin.food.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.model.dao.FoodDAO;

@Service
public class FoodServiceImpl implements FoodService{
	@Autowired
    private FoodDAO dao;
    
	@Autowired
    private CmmnServiceImpl myutil;
	
	public FoodServiceImpl() {
		
	}

}
