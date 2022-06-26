package com.mj.homeAdmin.admin.code.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CodeDAO() {
		// TODO Auto-generated constructor stub
	}
}
