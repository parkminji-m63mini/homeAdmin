package com.mj.homeAdmin.checkList.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.checkList.vo.checkList;

@Repository
public class checkListDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public checkListDAO() {
		
	}

	//체크리스트 조회
	public List<checkList> selectCheckList(String id) {
		
		return sqlSession.selectList("checkListMapper.selectCheckList", id);
	}

	//체크리스트 디테일 조회
	public List<checkList> selectCheckListDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkListMapper.selectCheckListDetail", id);
	}

	// 체크리스트 수정 조회
	public List<checkList> checkListDetailView(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("checkListMapper.checkListDetailView", vo);
	}

	// 체크리스트 수정
	public int checkListUpdate(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("checkListMapper.checkListUpdate", vo);
	}

	// 체크리스트 추가
	public int insertCheckList(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("checkListMapper.insertCheckList", vo);
	}

	
	// 체크리스트 디테일 추가
	public int insertCheckListDetail(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("checkListMapper.insertCheckListDetail", vo);
	}

	// 체크리스트 디테일 삭제
	public int deleteCheckListDetail(int idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("checkListMapper.deleteCheckListDetail", idx);
	}

	// 체크리스트 마스터 삭제
	public int deleteCheckListMaster(int idx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("checkListMapper.deleteCheckListMaster", idx);
	}

	// 체크리스트 수정
	public int updateCheckList(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("checkListMapper.updateCheckList", vo);
	}

}
