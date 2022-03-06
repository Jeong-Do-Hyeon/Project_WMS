package com.warehouse.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InventoryVO {
	
	public String impitemname;
	public String itemname;
	public String impdepot;
	public String implocation;
	public int quantity;
	public Date impdate;
}
