package com.warehouse.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ItemInfoVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	
	private Date regdate;
	private Date updatedDate;
	
	private List<ItemInfoAttachVO> attachList;
	
}
