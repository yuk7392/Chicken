package com.chicken.board;

import java.io.Serializable;

public class productDto implements Serializable{
	int price,like,dislike,view,stock,quantity;
	String id,name,desc,category,imgsrc;
	public productDto() {}
	
	public productDto(String id, String name, int price) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.name = name;
		this.price = price;
		
	}

	

	@Override
	public String toString() {
		return "productDto [price=" + price + ", like=" + like + ", dislike=" + dislike + ", view=" + view + ", stock="
				+ stock + ", id=" + id + ", name=" + name + ", desc=" + desc + ", category=" + category + ", imgsrc="
				+ imgsrc + quantity + "]";
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getDislike() {
		return dislike;
	}

	public void setDislike(int dislike) {
		this.dislike = dislike;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}



	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrice() {
		return price;
	}

	public String getImgsrc() {
		return imgsrc;
	}

	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
