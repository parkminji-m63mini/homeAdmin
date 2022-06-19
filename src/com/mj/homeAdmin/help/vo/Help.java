package com.mj.homeAdmin.help.vo;

public class Help {

	private int idx;
	private String uId; // 유저 아이디
	private String type; // 문의 타입
	private String title; // 제목
	private String cont; // 질문
	private String answer; // 답변
	private String counId; // 상담사 아이디
	private String wdt; // 생성일
	private String edt; // 수정일
	private String adt; // 답변일
	private String sta; // 답변상태  // 0:답변 대기 1:답변완료
	private String cnm; //
	
	private int limit; // 페이지당 보여지는 리스트 수
	
	private int startPage;
	 private int cntPerPage;
	 private int rn; // 랭크, 순번
	 
	//https://gangnam-americano.tistory.com/18
	 
	 
	 
	public int getIdx() {
		return idx;
	}
	public String getAdt() {
		return adt;
	}
	public void setAdt(String adt) {
		this.adt = adt;
	}
	public String getCnm() {
		return cnm;
	}
	public void setCnm(String cnm) {
		this.cnm = cnm;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
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
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getCounId() {
		return counId;
	}
	public void setCounId(String counId) {
		this.counId = counId;
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
	public String getSta() {
		return sta;
	}
	public void setSta(String sta) {
		this.sta = sta;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	
	
	
}
