package com.mj.homeAdmin.admin.dash.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public DashDAO() {
		// TODO Auto-generated constructor stub
	}

}
