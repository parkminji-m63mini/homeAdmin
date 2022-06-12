package com.mj.homeAdmin.checkList.model.dao;

import java.util.List;
import java.util.Map;

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

	// 체크리스트 마스터 추가
	public int insertCheckListMaster(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("checkListMapper.insertCheckListMaster", vo);
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

	// MAX(IDX) 조회
	public int getIdx(String id) {
		
		return sqlSession.selectOne("checkListMapper.getIdx", id);
	}
	
	// 체크리스트 마스터 수정
	public int updateCheckListMaster(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("checkListMapper.updateCheckListMaster", vo);
	}

	// 체크리스트 디테일 수정
	public int updateCheckListDetail(checkList vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("checkListMapper.updateCheckListDetail", vo);
	}

	// 사용여부 변경
	public int updateYN(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("checkListMapper.updateYN", map);
	}

	

}
