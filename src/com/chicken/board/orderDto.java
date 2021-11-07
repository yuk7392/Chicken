package com.chicken.board;

public class orderDto {
	int orderNumber,ordertbl_no,amount,price;
String products,addr, orderer,date,status;




public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}

public orderDto(int ordertbl_no,int orderNumber, String status, String products, String addr, String orderer, String date,
		int amount,int price) {
	super();
	this.orderNumber = orderNumber;
	this.ordertbl_no = ordertbl_no;
	this.amount = amount;
	this.products = products;
	this.addr = addr;
	this.orderer = orderer;
	this.date = date;
	this.status = status;
	this.price = price;
}

public orderDto() {
	super();
}

public String getProducts() {
	return products;
}

public void setProducts(String products) {
	this.products = products;
}




public int getOrderNumber() {
	return orderNumber;
}

public void setOrderNumber(int orderNumber) {
	this.orderNumber = orderNumber;
}

public int getOrdertbl_no() {
	return ordertbl_no;
}

public void setOrdertbl_no(int ordertbl_no) {
	this.ordertbl_no = ordertbl_no;
}

public int getAmount() {
	return amount;
}

public void setAmount(int amount) {
	this.amount = amount;
}

public String getAddr() {
	return addr;
}

public void setAddr(String addr) {
	this.addr = addr;
}

public String getOrderer() {
	return orderer;
}

public void setOrderer(String orderer) {
	this.orderer = orderer;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}
}
