package com.may.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	Integer id;
	String name;
	double price;
	int quantity = 1; //2. mặc định số lượng là 1
}
