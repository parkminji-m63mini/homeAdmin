package com.mj.homeAdmin.help.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.help.model.dao.HelpDAO;
import com.mj.homeAdmin.help.vo.Help;

@Service
public class HelpServiceImpl implements HelpService{

	@Autowired
	private HelpDAO dao;
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	public HelpServiceImpl() {
	}

	@Override
	public void submitHelp(Help vo) throws Exception {
		dao.submitHelp(vo);
	}

	@Override
	public List<Help> helpList(Help vo) throws Exception {
		
		
		return dao.helpList(vo);
	}

	@Override
	public int listCnt(Help vo) throws Exception {
		return dao.listCnt(vo);
	}
}
