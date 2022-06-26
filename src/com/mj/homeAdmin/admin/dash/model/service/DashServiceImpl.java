package com.mj.homeAdmin.admin.dash.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.admin.dash.model.dao.DashDAO;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Service
public class DashServiceImpl implements DashService{

	@Autowired
	private DashDAO dao;
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	public DashServiceImpl() {
		// TODO Auto-generated constructor stub
	}
}
