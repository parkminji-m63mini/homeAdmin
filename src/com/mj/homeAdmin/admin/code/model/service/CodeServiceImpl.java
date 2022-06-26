package com.mj.homeAdmin.admin.code.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.admin.code.model.dao.CodeDAO;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Service
public class CodeServiceImpl implements CodeSerivce{

	@Autowired
	private CodeDAO dao;
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	public CodeServiceImpl() {
		// TODO Auto-generated constructor stub
	}
}
