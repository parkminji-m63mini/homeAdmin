package com.mj.homeAdmin.admin.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.admin.notice.model.dao.ANoticeDAO;
import com.mj.homeAdmin.admin.notice.vo.ANotice;
import com.mj.homeAdmin.commn.service.CmmnServiceImpl;

@Service
public class ANoticeServiceImpl implements ANoticeSerivce{

	@Autowired
	private ANoticeDAO dao;
	
	@Autowired
    private CmmnServiceImpl myutil;
	
	public ANoticeServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<ANotice> noticeList(ANotice vo) throws Exception {
		return dao.noticeList(vo);
	}
}
