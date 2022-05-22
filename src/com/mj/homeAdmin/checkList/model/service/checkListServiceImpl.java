package com.mj.homeAdmin.checkList.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.checkList.model.dao.checkListDAO;
import com.mj.homeAdmin.checkList.vo.checkList;

@Service
public class checkListServiceImpl implements checkListService {

	@Autowired
	private checkListDAO dao;
	
	public checkListServiceImpl() {
		
	}

	// 체크리스트 조회
	@Override
	public List<checkList> selectCheckList(String id) throws Exception {
		 
		return dao.selectCheckList(id);
	}

	// 체크리스트 디테일 조회
	@Override
	public List<checkList> selectCheckListDetail(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCheckListDetail(id);
	}

	// 체크리스트 수정 조회
	@Override
	public List<checkList> checkListDetailView(checkList vo) {
		// TODO Auto-generated method stub
		return dao.checkListDetailView(vo);
	}

	// 체크리스트 수정
	@Override
	public int checkListUpdate(checkList vo) {
		// TODO Auto-generated method stub
		return dao.checkListUpdate(vo);
	}

	// 체크리스트 추가
	@Override
	public int insertCheckList(checkList vo) {
		// TODO Auto-generated method stub
		
		
		return dao.insertCheckList(vo);
	}

	// 체크리스트 디테일 추가
	@Override
	public int insertCheckListDetail(checkList vo) {
		// TODO Auto-generated method stub
		return dao.insertCheckListDetail(vo);
	}
	
	
}
