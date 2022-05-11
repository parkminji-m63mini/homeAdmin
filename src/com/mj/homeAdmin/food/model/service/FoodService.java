package com.mj.homeAdmin.food.model.service;

import java.util.List;

import com.mj.homeAdmin.food.vo.Food;
import com.mj.homeAdmin.myinfo.vo.MyinfoVo;

public interface FoodService {

	public abstract String frFind(Food vo)  throws Exception;

	public abstract void insertType(Food vo) throws Exception;

	public abstract List<Food> selectFr(Food vo)throws Exception;

	public abstract int frJidx(Food vo)throws Exception;

	public abstract void fr01Insert(Food vo)throws Exception;
	
	public abstract void fr01InsertOne(Food vo)throws Exception;
	
	public abstract void fr01Update(Food vo)throws Exception;

	public abstract void fr01delete(Food vo)throws Exception;

	public abstract String dtNullRp(String dt) throws Exception;

	public abstract void updateChk(Food vo) throws Exception;

}
