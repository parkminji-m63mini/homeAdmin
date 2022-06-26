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
	private String fullPhoto; // 파일 삭제시 쓰는 주소
	private String nm;
	private String nNm; // 닉네임
	private String email; // 이메일
	private int born; // 생년
	private String sta; // 직업 상태
	
	
	
	// sns 연동 정보
	private String snsInfo; // 연동 sns 정보
	private String tokens; // sns 토큰
	private String profile; // sns 연동시 프로필 사진 주소
	
	// 코드
	private String cd;
	private String cnm;
	private String fcd; // 첫번째 코드
	private String scd; // 두번째 코드
	private String mcd; // 매칭하는 코드
	private int idx;
	
	
	
	
	
	public String getMcd() {
		return mcd;
	}
	public void setMcd(String mcd) {
		this.mcd = mcd;
	}
	public int getBorn() {
		return born;
	}
	public void setBorn(int born) {
		this.born = born;
	}
	public String getSta() {
		return sta;
	}
	public void setSta(String sta) {
		this.sta = sta;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSnsInfo() {
		return snsInfo;
	}
	public void setSnsInfo(String snsInfo) {
		this.snsInfo = snsInfo;
	}
	public String getTokens() {
		return tokens;
	}
	public void setTokens(String Tokens) {
		this.tokens = tokens;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
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
	public String getFullPhoto() {
		return fullPhoto;
	}
	public void setFullPhoto(String fullPhoto) {
		this.fullPhoto = fullPhoto;
	}
	
	
	
	
}
