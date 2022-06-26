package com.mj.homeAdmin.admin.help.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.admin.help.vo.AHelp;

@Repository
public class AHelpDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AHelpDAO() {
		// TODO Auto-generated constructor stub
	}

	public List<AHelp> helpList(AHelp vo) {
		return sqlSession.selectList("AhelpMapper.helpList", vo);
	}

	public AHelp viewList(AHelp vo) {
		return sqlSession.selectOne("AhelpMapper.viewList", vo);
	}
}
