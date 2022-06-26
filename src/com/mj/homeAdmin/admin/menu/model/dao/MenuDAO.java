package com.mj.homeAdmin.admin.menu.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MenuDAO() {
		// TODO Auto-generated constructor stub
	}
}
