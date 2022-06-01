package com.mj.homeAdmin.checkList.vo;

public class checkList {

	
	private String id; // 사용자 아이디
	private int idx;
	private String listName; // 체크리스트 이름
	private String wdt;
	private String edt; 
	
	private int dIdx; // 디테일인덱스
	private String content; // 체크리스트 내용
	private String dWdt; // 디테일 작성일
	private String dEdt; // 디테일 수정일
	private String checkYN; // 체크유무
	private String[] contentL;
	
	public String[] getContentL() {
		return contentL;
	}
	public void setContentL(String[] contentL) {
		this.contentL = contentL;
	}
	
	
	
	public String getCheckYN() {
		return checkYN;
	}
	public void setCheckYN(String checkYN) {
		this.checkYN = checkYN;
	}
	public String getId() {
		return id;
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
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
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
	public int getdIdx() {
		return dIdx;
	}
	public void setdIdx(int dIdx) {
		this.dIdx = dIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getdWdt() {
		return dWdt;
	}
	public void setdWdt(String dWdt) {
		this.dWdt = dWdt;
	}
	public String getdEdt() {
		return dEdt;
	}
	public void setdEdt(String dEdt) {
		this.dEdt = dEdt;
	}

	
}
