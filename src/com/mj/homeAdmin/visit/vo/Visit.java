package com.mj.homeAdmin.visit.vo;

import java.sql.Date;

public class Visit {
	
	private int idx;
	private String uId; // 사용자 아이디
	private String uNm; // 사용자 이름
	private String vNm; // 방문자 이름
	private String vId; // 방문자 아이디 (1회용)
	private String pNo; // 프로필 사진 번호
	private String wdt; // 작성일
	private String vdt; // 방문일
	private String cont; // 내용
	private String photo; // 사진 주소
	
	private String key; //검색하는 종류 (제목, 내용...)
	private String word; // 검색 단어
	private String sdt; // 시작일
	private String edt; // 종료일
	private String cSkip; // 줄인 내용
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getvId() {
		return vId;
	}
	public void setvId(String vId) {
		this.vId = vId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getWdt() {
		return wdt;
	}
	public void setWdt(String wdt) {
		this.wdt = wdt;
	}
	public String getVdt() {
		return vdt;
	}
	public void setVdt(String vdt) {
		this.vdt = vdt;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getuNm() {
		return uNm;
	}
	public void setuNm(String uNm) {
		this.uNm = uNm;
	}
	public String getvNm() {
		return vNm;
	}
	public void setvNm(String vNm) {
		this.vNm = vNm;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEdt() {
		return edt;
	}
	public void setEdt(String edt) {
		this.edt = edt;
	}
	public String getcSkip() {
		return cSkip;
	}
	public void setcSkip(String cSkip) {
		this.cSkip = cSkip;
	}
	
	
	
}
