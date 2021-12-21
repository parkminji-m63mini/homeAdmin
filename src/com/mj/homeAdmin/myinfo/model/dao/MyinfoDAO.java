package com.mj.homeAdmin.myinfo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.myinfo.vo.MyinfoVo;
import com.sun.org.apache.regexp.internal.recompile;

@Repository
public class MyinfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MyinfoDAO() {}

	public String checkPw(MyinfoVo vo) {
		return sqlSession.selectOne("myinfoMapper.checkPw", vo);
	}

	public void signUp(MyinfoVo vo) {
		sqlSession.insert("myinfoMapper.signUp", vo);
	}

	public List<MyinfoVo> selectUser(MyinfoVo vo) {
		return sqlSession.selectList("myinfoMapper.selectUser", vo);
	}

	public List<MyinfoVo> selectCode(MyinfoVo vo) {
		return sqlSession.selectList("myinfoMapper.selectCode", vo);
	}
}
