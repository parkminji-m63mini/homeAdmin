package com.mj.homeAdmin.food.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mj.homeAdmin.food.vo.Food;

@Repository
public class FoodDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

    public FoodDAO()
    {
    }

	public String frFind(Food vo) {
		return sqlSession.selectOne("foodMapper.frFind", vo);
	}

	public int insertType(Food vo) {
		return sqlSession.insert("foodMapper.insertType", vo);
	}

	public List<Food> selectFr(Food vo) {
		return sqlSession.selectList("foodMapper.selectFr", vo);
	}

	public int frJidx(Food vo) {
		return sqlSession.selectOne("foodMapper.frJidx", vo);
	}

	public void fr01Insert(Food vo) {
		 sqlSession.insert("foodMapper.fr01Insert", vo);
	}

	public void fr01Insert2(Food vo) {
		 sqlSession.insert("foodMapper.fr01Insert2", vo);
	}

	public void fr01Update(Food vo) {
		 sqlSession.update("foodMapper.fr01Update", vo);
	}
	public void fr01Update2(Food vo) {
		 sqlSession.update("foodMapper.fr01Update2", vo);
	}

	public void fr01delete(Food vo) {
		sqlSession.delete("foodMapper.fr01delete", vo);
		
	}

	public void updateChk(Food vo) {
		 sqlSession.update("foodMapper.updateChk", vo);
	}
}
