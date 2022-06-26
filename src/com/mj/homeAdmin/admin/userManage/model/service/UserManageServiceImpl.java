package com.mj.homeAdmin.admin.userManage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.admin.userManage.model.dao.UserManangeDAO;
import com.mj.homeAdmin.admin.userManage.vo.UserManage;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.notice.vo.Notice;

@Service
public class UserManageServiceImpl implements UserManageSerivce{

	@Autowired
	private UserManangeDAO dao;
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	
	public UserManageServiceImpl() {
		// TODO Auto-generated constructor stub
	}


	@Override
	public int listCnt(UserManage vo) throws Exception {
		return dao.listCnt(vo);
	}


	@Override
	public List<UserManage> userList(UserManage vo) {
		return dao.userList(vo);
	}
}
