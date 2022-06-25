package com.mj.homeAdmin.main.model.service;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mj.homeAdmin.main.model.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;
	
	@Override
	public String getHomeImg(String id) {
		// TODO Auto-generated method stub
		return dao.getHomeImg(id);
	}

	
	
}
