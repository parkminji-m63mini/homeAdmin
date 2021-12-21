package com.mj.homeAdmin.food.model.dao;

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

	public void insertType(Food vo) {
		 sqlSession.insert("foodMapper.insertType", vo);
	}
}
