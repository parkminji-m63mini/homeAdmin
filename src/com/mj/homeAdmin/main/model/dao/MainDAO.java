package com.mj.homeAdmin.main.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {

	@Autowired
	private SqlSession sqlSession;

	public String getHomeImg(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MainDAO.getHomeImg", id);
	}
	
	
}
