package com.mj.homeAdmin.alarm.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mj.homeAdmin.alarm.model.dao.alarmDAO;
import com.mj.homeAdmin.alarm.vo.alarm;

@Service
public class alarmServiceImpl implements alarmService {

	@Autowired
	private alarmDAO dao;
	
	public alarmServiceImpl() {
		
	}
	// 입력
	@Override
	public int insertAlarm(alarm vo) {
		
		return dao.insertAlarm(vo);
	}
	
	// 알람 리스트 조회
	@Override
	public List<alarm> selectAlarmList(String id) {
		// TODO Auto-generated method stub
		return dao.selectAlarmList(id);
	}
	
	// 수정화면 조회
	@Override
	public alarm selectAlarmOne(int idx) {
		// TODO Auto-generated method stub
		return dao.selectAlarmOnd(idx);
	}
	
	// 수정
	@Override
	public int updateAlarm(alarm vo) {
		// TODO Auto-generated method stub
		return dao.updateAlarm(vo);
	}
	
	// 사용여부 수정
	@Override
	public int updateYN(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.updateYN(map);
	}
	
	// 삭제
	@Override
	public int deleteAlarm(int idx) {
		// TODO Auto-generated method stub
		return dao.deleteAlarm(idx);
	}
}
