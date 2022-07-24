package com.mj.homeAdmin.food.vo;

import java.util.List;

public class Food {
	
	private String uId;
	private String tp; // 냉장고 타입
	private String wdt;
	private int jidx; // FOOD 테이블 IDX 와 연동
	private int idx;
	private String area; // 위치
	private String edt; //데이터 수정일
	private String fnm; // 식재료 이름
	private String bdt; // 구매날짜
	private String fdt; // 유통기한
	private String fdt2; // 유통기한 (가공해서 가져옴)
	private String vm; // 용량이나 개수
	private String price; // 가격
	private char sort; //정렬 순서
	private char chk; // 1 : 사용완료 / 0 : 남아있음
	private String dataChk; // 식재료 데이터가 있는지 없는지   NO / YES
	
	private String cd;
	private String mode; // 0 = 사용 완료 x , 1 = 사용완료 o
	
	private String[] fnmL;
	private String[] priceL;
	private String[] bdtL;
	private String[] fdtL;
	private String[] vmL;
	private String[] fAreaL;
	private String[] idxL;
	private String[] chkL;

	
	
	
	public String getFdt2() {
		return fdt2;
	}
	public void setFdt2(String fdt2) {
		this.fdt2 = fdt2;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String[] getIdxL() {
		return idxL;
	}
	public void setIdxL(String[] idxL) {
		this.idxL = idxL;
	}
	public String[] getChkL() {
		return chkL;
	}
	public void setChkL(String[] chkL) {
		this.chkL = chkL;
	}
	public String[] getfAreaL() {
		return fAreaL;
	}
	public void setfAreaL(String[] fAreaL) {
		this.fAreaL = fAreaL;
	}
	public String[] getPriceL() {
		return priceL;
	}
	public void setPriceL(String[] priceL) {
		this.priceL = priceL;
	}
	public String[] getBdtL() {
		return bdtL;
	}
	public void setBdtL(String[] bdtL) {
		this.bdtL = bdtL;
	}
	public String[] getFdtL() {
		return fdtL;
	}
	public void setFdtL(String[] fdtL) {
		this.fdtL = fdtL;
	}
	public String[] getVmL() {
		return vmL;
	}
	public void setVmL(String[] vmL) {
		this.vmL = vmL;
	}
	public String[] getFnmL() {
		return fnmL;
	}
	public void setFnmL(String[] fnmL) {
		this.fnmL = fnmL;
	}
	public String getDataChk() {
		return dataChk;
	}
	public void setDataChk(String dataChk) {
		this.dataChk = dataChk;
	}
	
	
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getTp() {
		return tp;
	}
	public void setTp(String tp) {
		this.tp = tp;
	}
	public String getWdt() {
		return wdt;
	}
	public void setWdt(String wdt) {
		this.wdt = wdt;
	}
	public int getJidx() {
		return jidx;
	}
	public void setJidx(int jidx) {
		this.jidx = jidx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getEdt() {
		return edt;
	}
	public void setEdt(String edt) {
		this.edt = edt;
	}
	public String getFnm() {
		return fnm;
	}
	public void setFnm(String fnm) {
		this.fnm = fnm;
	}
	public String getBdt() {
		return bdt;
	}
	public void setBdt(String bdt) {
		this.bdt = bdt;
	}
	public String getFdt() {
		return fdt;
	}
	public void setFdt(String fdt) {
		this.fdt = fdt;
	}
	public String getVm() {
		return vm;
	}
	public void setVm(String vm) {
		this.vm = vm;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public char getSort() {
		return sort;
	}
	public void setSort(char sort) {
		this.sort = sort;
	}
	public char getChk() {
		return chk;
	}
	public void setChk(char chk) {
		this.chk = chk;
	}

}
