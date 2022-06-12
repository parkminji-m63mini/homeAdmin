package com.mj.homeAdmin.checkList.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateCheckListMaster(checkList vo) {
		// TODO Auto-generated method stub
		// 디테일은 삭제하고 마스터는 제목, 수정날짜 업데이트 
		int deleteDetail = dao.deleteCheckListDetail(vo.getIdx());
		int updateMaster = dao.updateCheckListMaster(vo);
		
		
		return updateMaster;
	}
	
	// 체크리스트 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateCheckListDetail(checkList vo) {
		System.out.println("임플 ::::" + vo.getIdx());
		int insertDetail = dao.updateCheckListDetail(vo);
		
		return insertDetail;
	}

	// 체크리스트 추가
	@Override
	public int insertCheckList(checkList vo) {
		// TODO Auto-generated method stub
		int insertMaster = 0 ; 
		int insertDetail = 0 ;
		//System.out.println("임플 id" + vo.getId());
		insertMaster = dao.insertCheckListMaster(vo);
		
		if (insertMaster > 0 ) {
			//vo.setmIdx(idx);
			insertDetail = dao.insertCheckListDetail(vo);
		}
		
		return insertDetail;
	}

	// 체크리스트 디테일 추가
	@Override
	public int insertCheckListDetail(checkList vo) {
		// TODO Auto-generated method stub
		return dao.insertCheckListDetail(vo);
	}

	// 삭제
	@Override
	public int deleteCheckList(int idx) {
		// TODO Auto-generated method stub
		int result;
		int deleteDetail = dao.deleteCheckListDetail(idx);
		if (deleteDetail > 0) {
			result = dao.deleteCheckListMaster(idx);
		}else {
			result = 0;
		}
		
		return result;
	}

	// 사용여부 변경
	@Override
	public int updateYN(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.updateYN(map);
	}

	
	
	
}
