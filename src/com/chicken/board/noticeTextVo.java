package com.chicken.board;

public class noticeTextVo {
	int Number;
    String Title;
	String Writer;
	String Date;
	String Status;
	String Products;
	String Addr;
	int pageNum = 0;
	
	public String getProducts() {
		return Products;
	}

	public void setProducts(String products) {
		this.Products = products;
	}

	
	public noticeTextVo(int number, String products, String date, String status, String addr,int i) { // 주문 현황 받아올떄
		super();
		Number = number;
		Products = products;
		Date = date;
		Status = status;
		Addr = addr;
	}
	
	public noticeTextVo(int number, String title, String writer, String date) {
		super();
		Number = number;
		Title = title;
		Writer = writer;
		Date = date;
	}
	
	public noticeTextVo(int number, String title, String writer, String date, String status) {
		super();
		Number = number;
		Title = title;
		Writer = writer;
		Date = date;
		Status = status;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getNumber() {
		return Number;
	}
	public void setNumber(int number) {
		Number = number;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getWriter() {
		return Writer;
	}
	public void setWriter(String writer) {
		Writer = writer;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
}
