package com.may.entity;

import java.util.List;

public class orderDTO {
	Integer totalPurhased;
	Integer totalMoney;
	List<purchasedDTO> listPurchased;
	
	public Integer getTotalPurhased() {
		return totalPurhased;
	}
	public void setTotalPurhased(Integer totalPurhased) {
		this.totalPurhased = totalPurhased;
	}
	public Integer getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Integer totalMoney) {
		this.totalMoney = totalMoney;
	}
	public List<purchasedDTO> getListPurchased() {
		return listPurchased;
	}
	public void setListPurchased(List<purchasedDTO> listPurchased) {
		this.listPurchased = listPurchased;
	}
}
