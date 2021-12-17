package com.mj.homeAdmin.myinfo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.myinfo.model.dao.MyinfoDAO;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Service
public class MyinfoServiceImpl implements MyinfoService {

	@Autowired
	private MyinfoDAO dao;
	
	public MyinfoServiceImpl(){	}

	public String checkPw(MyinfoVo vo)   throws Exception{
		String chkPw = dao.checkPw(vo);
		return chkPw;
	}
}
