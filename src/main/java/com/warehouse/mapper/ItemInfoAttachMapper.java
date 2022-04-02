package com.warehouse.mapper;

import java.util.List;

import com.warehouse.domain.ItemInfoAttachVO;

public interface ItemInfoAttachMapper {

	public void insert(ItemInfoAttachVO vo);
	
	public List<ItemInfoAttachVO> findByBno(Long bno);
	
	public void delete(String uuid);
	
	public void deleteAll(Long bno);
	
	public List<ItemInfoAttachVO> getOldFiles();
	
}
