package com.warehouse.domain;

import lombok.Data;

@Data
public class ItemInfoAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long bno;
	
	
}
