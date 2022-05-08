package com.mj.homeAdmin.HomeInfo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.HomeInfo.vo.HomeInfo;

@Repository
public class HomeInfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public HomeInfoDAO() {
		
		 
		
	}
	
	// 집정보 입력
	public void insertHomeInfo(HomeInfo vo) {
		
		sqlSession.selectOne("homeInfoMapper.insertHomeInfo", vo);
	}
	
	// 집정보 조회
	public HomeInfo selectHomeInfo(String id){
		return sqlSession.selectOne("homeInfoMapper.selectHomeInfo", id);
	}

	// 집정보 수정
	public int updateHomeInfo(HomeInfo vo) {
		
		return sqlSession.update("homeInfoMapper.updateHomeInfo", vo);
	}

	

	
	
}
