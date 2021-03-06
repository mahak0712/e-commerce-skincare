package com.neu.edu.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="cart_table")
//@PrimaryKeyJoinColumn(name = "productID")
public class Cart extends Product{
	
	@NotNull(message="please enter quantity")
	@Min(value=1,message="quantity should greater than 1")
	@Column(name="quantity")
	private int quantity;
	

	
	public Cart(String productName, double price, int quantity,String description,int stock,String seller) {
		super(productName,price,description,stock,seller, null);
		this.quantity=quantity;
	}
	
	public Cart() {}


	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	
	

	
	
	

}
