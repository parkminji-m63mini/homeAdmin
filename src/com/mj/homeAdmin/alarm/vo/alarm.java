package com.mj.homeAdmin.alarm.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class alarm {
	private String id;
	private int idx;
	private String alarmName;
	private String alarmCycle;
	private String alarmTime;
	private String memo;
	private Date wdt;
	private Date edt;
	private String useYN;
	private char[] cycle;
	
	public char[] getCycle() {
		return cycle;
	}
	public void setCycle(char[] cycle) {
		this.cycle = cycle;
	}
	public String getId() {
		return id;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getAlarmName() {
		return alarmName;
	}
	public void setAlarmName(String alarmName) {
		this.alarmName = alarmName;
	}
	public String getAlarmCycle() {
		return alarmCycle;
	}
	public void setAlarmCycle(String alarmCycle) {
		this.alarmCycle = alarmCycle;
	}
	public String getAlarmTime() {
		return alarmTime;
	}
	public void setAlarmTime(String alarmTime) {
		this.alarmTime = alarmTime;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getWdt() {
		return wdt;
	}
	public void setWdt(Date wdt) {
		this.wdt = wdt;
	}
	public Date getEdt() {
		return edt;
	}
	public void setEdt(Date edt) {
		this.edt = edt;
	}
	
}
