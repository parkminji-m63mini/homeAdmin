package com.mj.homeAdmin.admin.menu.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.admin.menu.model.dao.MenuDAO;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Service
public class MenuServiceImpl implements MenuSerivce{

	
	@Autowired
	private MenuDAO dao;
	
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	public MenuServiceImpl() {
		// TODO Auto-generated constructor stub
	}
}
