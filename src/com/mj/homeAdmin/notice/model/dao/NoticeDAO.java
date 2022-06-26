package com.mj.homeAdmin.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.notice.vo.Notice;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDAO() {
	}

	public int listCnt(Notice vo) {
		return sqlSession.selectOne("NoticeMapper.listCnt", vo);
	}

	public List<Notice> NoticeList(Notice vo) {
		return sqlSession.selectList("NoticeMapper.NoticeList", vo);
	}

}
