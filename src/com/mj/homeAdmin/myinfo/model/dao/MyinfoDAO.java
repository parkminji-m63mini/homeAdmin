package com.mj.homeAdmin.myinfo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

@Repository
public class MyinfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MyinfoDAO() {}

	public String checkPw(MyinfoVo vo) {
		return sqlSession.selectOne("myinfoMapper.checkPw", vo);
	}
}
