package com.mj.homeAdmin.myinfo.vo;

public class MyinfoVo {

	private String id;
	private String pw;
	private String inputPw; // 사용자가 입력한 평문 비밀번호
	private char gb; // 1 : 일반 사용자 / 9 : 관리자
	private char sex; // 1  : 남 /  2 : 여
	private String addr;
	private String hp;
	private String ltype; // 거주타입
	private String htype; // 집타입
	private String birth;
	private String photo;
	private String nm;
	private String nNm; // 닉네임
	
	// 코드
	private String cd;
	private String cnm;
	private String fcd; // 첫번째 코드
	private String scd; // 두번째 코드
	private int idx;
	
	
	
	
	
	public String getScd() {
		return scd;
	}
	public void setScd(String scd) {
		this.scd = scd;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getCnm() {
		return cnm;
	}
	public void setCnm(String cnm) {
		this.cnm = cnm;
	}
	public String getFcd() {
		return fcd;
	}
	public void setFcd(String fcd) {
		this.fcd = fcd;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getInputPw() {
		return inputPw;
	}
	public void setInputPw(String inputPw) {
		this.inputPw = inputPw;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public char getGb() {
		return gb;
	}
	public void setGb(char gb) {
		this.gb = gb;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getLtype() {
		return ltype;
	}
	public void setLtype(String ltype) {
		this.ltype = ltype;
	}
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getnNm() {
		return nNm;
	}
	public void setnNm(String nNm) {
		this.nNm = nNm;
	}
	
	
	
	
}
