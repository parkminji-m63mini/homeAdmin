package com.mj.homeAdmin.admin.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.admin.notice.vo.ANotice;

@Repository
public class ANoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ANoticeDAO() {
		// TODO Auto-generated constructor stub
	}

	public List<ANotice> noticeList(ANotice vo) {
		return sqlSession.selectList("AnoticeMapper.noticeList", vo);
	}
}
