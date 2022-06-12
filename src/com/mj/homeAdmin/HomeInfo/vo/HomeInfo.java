package com.mj.homeAdmin.HomeInfo.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class HomeInfo {

	
	private String contract;
	private int size;
	private String room;
	private int deposit;
	private int rentalFee;
	private int floor;
	private String building;
	private int manageFee;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date contractDateFr;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date contractDateTo;
	private String hnm;
	private String wifiNm;
	private String wifiPw;
	private String petYN;
	private String info;
	private String notice;
	private String address;
	private String direction;
	private String homeImg;
	private String petImg;
	
	private int payDate;
	private String id;
	private String contractCnm;
	private String roomCnm;
	private String cdCT;
	
	public String getHomeImg() {
		return homeImg;
	}

	public void setHomeImg(String homeImg) {
		this.homeImg = homeImg;
	}

	public String getPetImg() {
		return petImg;
	}

	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	public String getWifiPw() {
		return wifiPw;
	}

	public void setWifiPw(String wifiPw) {
		this.wifiPw = wifiPw;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getCdCT() {
		return cdCT;
	}

	public void setCdCT(String cdCT) {
		this.cdCT = cdCT;
	}

	
	
	public String getRoomCnm() {
		return roomCnm;
	}

	public void setRoomCnm(String roomCnm) {
		this.roomCnm = roomCnm;
	}

	public String getContractCnm() {
		return contractCnm;
	}

	public void setContractCnm(String contractCnm) {
		this.contractCnm = contractCnm;
	}

	public String getContract() {
		return contract;
	}
	
	public void setContract(String contract) {
		this.contract = contract;
		
	}
	
	public int getSize() {
		return size;
	}
	
	public void setSize(int size) {
		this.size = size;
	}
	
	public String getRoom() {
		return room;
	}
	
	public void setRoom(String room) {
		this.room = room;
	}
	
	
	public int getDeposit() {
		return deposit;
	}
	
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	
	public int getRentalFee() {
		return rentalFee;
	}
	
	public void setRentalFee(int rentalFee) {
		this.rentalFee = rentalFee;
	}
	
	public int getFloor() {
		return floor;
	}
	
	public void setFloor(int floor) {
		this.floor = floor;
	}
	
	public int getManageFee() {
		return manageFee;
	}
	
	public void setManageFee(int manageFee) {
		this.manageFee = manageFee;
	}
	
	public String getBuilding() {
		return building;
	}
	
	public void setBuilding(String building) {
		this.building = building;
		
	} 
	public Date getContractDateFr() {
		return contractDateFr;
	}
	
	public void setContractDateFr(Date contractDateFr) {
		this.contractDateFr = contractDateFr;
		
	}
	
	public Date getContractDateTo() {
		return contractDateTo;
	}
	
	public void setContractDateTo(Date contractDateTo) {
		this.contractDateTo = contractDateTo;
		
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
		
	}
	
	public String getHnm() {
		return hnm;
	}
	
	public void setHnm(String hnm) {
		this.hnm = hnm;
		
	}
	
	public String getWifiNm() {
		return wifiNm;
	}
	
	public void setWifiNm(String wifiNm) {
		this.hnm = wifiNm;
		
	}
	public String getPetYN() {
		return petYN;
	}
	
	public void setPetYN(String petYN) {
		this.petYN = petYN;
		
	}
	
	public String getInfo() {
		return info;
	}
	
	public void setInfo(String info) {
		this.info = info;
		
	}
	public String getNotice() {
		return notice;
	}
	
	public void setNotice(String notice) {
		this.notice = notice;
		
	}

	public int getPayDate() {
		return payDate;
	}
	
	public void setPayDate(int payDate) {
		this.payDate = payDate;
		
	}
	
}
