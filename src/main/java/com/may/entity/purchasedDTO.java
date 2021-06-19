package com.may.entity;

public class purchasedDTO {
	Integer amount ;
	String catname;
	String id;
	String img;
	String name;
	Double price;
	String size;

	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}


	public OrderDetail convertToOrderDetail() {
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setPrice(this.price);
		orderDetail.setQuantity(this.amount);

		return orderDetail;
	}
}
