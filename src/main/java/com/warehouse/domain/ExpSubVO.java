package com.warehouse.domain;

import lombok.Data;

@Data
public class ExpSubVO {

	private Integer expsubindex;
	private Integer expnum;
	public String expitemname;
	public String itemname;
	public int expquantity;
	public int expprice;
	private String status;
	
}
