package com.warehouse.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ItemInfoPageDTO {
	
	private int startPage;
	private int endPage;
	
	private boolean prev, next;
	
	private int total;
	
	private ItemInfoCriteria cri;
	
	public ItemInfoPageDTO(ItemInfoCriteria cri, int total) {
	
		this.cri = cri;
		this.total = total;
		
		int pageSize = 10;
		int endPageInfo = pageSize - 1;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		
		this.startPage = this.endPage - endPageInfo;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
}
}
