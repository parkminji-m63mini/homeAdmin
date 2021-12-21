package com.mj.homeAdmin.food.model.service;

import com.mj.homeAdmin.food.vo.Food;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

public interface FoodService {

	public abstract int frFind(Food vo)  throws Exception;

	public abstract void insertType(Food vo) throws Exception;

}
