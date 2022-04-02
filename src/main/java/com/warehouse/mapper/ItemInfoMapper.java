package com.warehouse.mapper;

import java.util.List;

import com.warehouse.domain.ItemInfoCriteria;
import com.warehouse.domain.ItemInfoVO;

public interface ItemInfoMapper {
	
	public void insert(ItemInfoVO board);
	
	public Integer insertSelectKey(ItemInfoVO board); // 글번호 bno 필드값이 null상태.
	
	public List<ItemInfoVO> getList();
	
	// 검색기능이 포함된 필드(type, keyword)가 사용하게 됨.
	public List<ItemInfoVO> getListWithPaging(ItemInfoCriteria cri);
	
	// 검색기능 포함
	public int getTotalCount(ItemInfoCriteria cri);
	
	public ItemInfoVO get(Long bno);
	
	public int update(ItemInfoVO board);
	
	public int delete(Long bno);
	
	
}
