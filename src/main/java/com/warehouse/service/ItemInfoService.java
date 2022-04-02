package com.warehouse.service;

import java.util.List;

import com.warehouse.domain.ItemInfoAttachVO;
import com.warehouse.domain.ItemInfoCriteria;
import com.warehouse.domain.ItemInfoVO;

public interface ItemInfoService {
	
	public void register(ItemInfoVO vo);
	
	public List<ItemInfoVO> getList();
	
	public List<ItemInfoVO> getListWithPaging(ItemInfoCriteria cri);
	
	public int getTotalCount(ItemInfoCriteria cri);
	
	public ItemInfoVO get(Long bno);
	
	public void modify(ItemInfoVO board);
	
	public boolean delete(Long bno);
	
	public List<ItemInfoAttachVO> getAttachList(Long bno);
	
	public void removeAttach(Long bno);

}
