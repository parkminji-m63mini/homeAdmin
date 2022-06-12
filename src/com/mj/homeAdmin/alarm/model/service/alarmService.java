package com.mj.homeAdmin.alarm.model.service;

import java.util.List;
import java.util.Map;

import com.mj.homeAdmin.alarm.vo.alarm;

public interface alarmService {

	// 입력
	int insertAlarm(alarm vo);

	// 알람리스트 조회
	List<alarm> selectAlarmList(String id);

	// 수정화면 조회
	alarm selectAlarmOne(int idx);

	// 수정
	int updateAlarm(alarm vo);

	
	// 사용여부 수정
	int updateYN(Map<String, Object> map);

	// 삭제
	int deleteAlarm(int idx);

}
