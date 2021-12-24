package com.mj.homeAdmin.food.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.commn.service.CmmnServiceImpl;
import com.mj.homeAdmin.food.model.dao.FoodDAO;
import com.mj.homeAdmin.food.vo.Food;

@Service
public class FoodServiceImpl implements FoodService{
	@Autowired
    private FoodDAO dao;
    
	@Autowired
    private CmmnServiceImpl myutil;
	
	public FoodServiceImpl() {
		
	}

	@Override
	public String frFind(Food vo) throws Exception {
		
		
		String chk = dao.frFind(vo);

//		int result = 0;
//		if(chk !=null) {
//			result = 1;
//		}else {
//		}
//		System.out.println(result +" result 출력 ");
		
		return chk;
	}

	@Override
	public void insertType(Food vo) throws Exception {
		dao.insertType(vo);
	}

	@Override
	public List<Food> selectFr(Food vo) throws Exception {
		
		List<Food> arrList = dao.selectFr(vo);
		
		
		return arrList;
	}

	@Override
	public int frJidx(Food vo) throws Exception {
		return dao.frJidx(vo);
	}

}
