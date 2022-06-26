package com.mj.homeAdmin.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.help.vo.Help;
import com.mj.homeAdmin.notice.model.dao.NoticeDAO;
import com.mj.homeAdmin.notice.vo.Notice;

@Service
public class NoticeServiceImpl
implements NoticeService {

	
	@Autowired
	private NoticeDAO dao;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	
	public NoticeServiceImpl() {
	}


	@Override
	public int listCnt(Notice vo) throws Exception {
		return dao.listCnt(vo);
	}


	@Override
	public List<Notice> NoticeList(Notice vo) throws Exception {
		return dao.NoticeList(vo);
	}
}
