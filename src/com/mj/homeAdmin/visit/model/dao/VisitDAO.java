package com.mj.homeAdmin.visit.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.visit.vo.Visit;

@Repository
public class VisitDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public VisitDAO() {
	}

	public String findNm(Visit vo) {
		return sqlSession.selectOne("visitMapper.findNm", vo);
		}

	public void insertVisit(Visit vo) {
		sqlSession.insert("visitMapper.insertVisit", vo);
	}

	public List<Visit> visitList(Visit vo) {
		return sqlSession.selectList("visitMapper.visitList", vo);
	}

	public void delete(Visit vo) {
		sqlSession.delete("visitMapper.delete", vo);
	}

}
