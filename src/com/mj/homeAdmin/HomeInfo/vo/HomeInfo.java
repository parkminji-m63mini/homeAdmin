package com.mj.homeAdmin.HomeInfo.vo;

import java.util.Date;

public class HomeInfo {

	
	private String contract;
	private int size;
	private int room;
	private int deposit;
	private int rentalFee;
	private int floor;
	private String building;
	private int manageFee;
	private Date contractDate;
	private String id;

	
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
	
	public int getRoom() {
		return room;
	}
	
	public void setRoom(int room) {
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
	public Date getContractDate() {
		return contractDate;
	}
	
	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
		
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
		
	}
	

	
}
