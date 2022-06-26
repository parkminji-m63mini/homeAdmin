package com.mj.homeAdmin.admin.help.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.admin.help.model.dao.AHelpDAO;
import com.mj.homeAdmin.admin.help.vo.AHelp;
import com.mj.homeAdmin.admin.userManage.vo.UserManage;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.help.vo.Help;

@Service
public class AHelpServiceImpl implements AHelpService{

	@Autowired
	private AHelpDAO dao;
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	public AHelpServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<AHelp> helpList(AHelp vo) throws Exception {
		return dao.helpList(vo);
	}

	@Override
	public AHelp viewList(AHelp vo) throws Exception {
		return dao.viewList(vo);
	}
}
