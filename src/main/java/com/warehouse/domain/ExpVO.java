package com.warehouse.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ExpVO {

	private Integer expnum;
	private String expcomname;
	private String expcomperson;
	private String expaddr;
	private String telnumber;
	private String expmethod;
	private Date expdate;
	private String note;
	private String status;
	
}
