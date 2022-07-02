package com.mj.homeAdmin.visit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.visit.model.dao.VisitDAO;
import com.mj.homeAdmin.visit.vo.Visit;

@Service
public class VisitServiceImpl 
	implements VisitService
{

	@Autowired
	private VisitDAO dao;
	
	@Autowired
	private CmmnServiceImpl myutil;
	
	public VisitServiceImpl() {
	}

	@Override
	public String findNm(Visit vo) throws Exception {
		
		return dao.findNm(vo);
	}

	@Override // 데이터 insert
	public void insertVisit(Visit vo) throws Exception {
		dao.insertVisit(vo);
	}

	@Override // 방명록 리스트
	public List<Visit> visitList(Visit vo) throws Exception {
		return dao.visitList(vo);
	}

	@Override
	public void delete(Visit vo) throws Exception {
		dao.delete(vo);
	}
	@Override
	public List<Visit> mainVistList(String id) {
		// TODO Auto-generated method stub
		return dao.mainVistList(id);
	}
}
