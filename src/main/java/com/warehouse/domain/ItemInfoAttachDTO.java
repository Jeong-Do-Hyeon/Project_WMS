package com.warehouse.domain;

import lombok.Data;

@Data
public class ItemInfoAttachDTO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image; 
	
}
