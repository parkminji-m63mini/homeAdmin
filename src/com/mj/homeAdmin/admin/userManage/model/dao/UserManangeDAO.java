package com.mj.homeAdmin.admin.userManage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.admin.userManage.vo.UserManage;
import com.mj.homeAdmin.notice.vo.Notice;

@Repository
public class UserManangeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserManangeDAO() {
		// TODO Auto-generated constructor stub
	}

	public int listCnt(UserManage vo) {
		return sqlSession.selectOne("UserManageMapper.listCnt", vo);
	}

	public List<UserManage> userList(UserManage vo) {
		return sqlSession.selectList("UserManageMapper.userList", vo);
	}
}
