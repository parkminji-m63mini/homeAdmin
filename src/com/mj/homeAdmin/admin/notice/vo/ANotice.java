package com.mj.homeAdmin.admin.notice.vo;

public class ANotice {

	private int idx;
	private String uId; // 작성 아이디
	private String wdt; // 생성일
	private String edt; // 수정일
	private String title; // 제목
	private String cont; // 내용
	private String sump; // 썸네일 위치
	private String nNm; //
	
	private int startPage;
	 private int cntPerPage;
	 private int rn; // 랭크, 순번
	

	 
	 
	public String getnNm() {
		return nNm;
	}
	public void setnNm(String nNm) {
		this.nNm = nNm;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
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
	public String getWdt() {
		return wdt;
	}
	public void setWdt(String wdt) {
		this.wdt = wdt;
	}
	public String getEdt() {
		return edt;
	}
	public void setEdt(String edt) {
		this.edt = edt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getSump() {
		return sump;
	}
	public void setSump(String sump) {
		this.sump = sump;
	}
	
	
}
