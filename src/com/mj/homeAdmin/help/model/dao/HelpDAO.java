package com.mj.homeAdmin.help.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.help.vo.Help;

@Repository
public class HelpDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public HelpDAO() {
	}

	public void submitHelp(Help vo) {
		sqlSession.insert("helpMapper.submitHelp", vo);
	}

	public List<Help> helpList(Help vo) {
		return sqlSession.selectList("helpMapper.helpList", vo);
	}

	public int listCnt(Help vo) {
		return sqlSession.selectOne("helpMapper.listCnt", vo);
	}

	public List<Help> helpView(Help vo) {
		return sqlSession.selectList("helpMapper.helpView", vo);
	}
}
