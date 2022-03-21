package com.warehouse.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ImpSubVO {
	
	private Integer impsubindex;
	private Integer impnum;
	private String impitemname;
	private String itemname;
	private Integer itemquantity;
	private Integer itemprice;
	private String status;
}
