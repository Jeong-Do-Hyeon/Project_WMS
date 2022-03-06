package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.domain.InventoryVO;
import com.warehouse.mapper.ExpMapper;
import com.warehouse.mapper.InventoryMapper;

import lombok.Setter;

@Service
public class InventoryServiceImpl implements InventoryService {
	
	@Setter(onMethod_ = @Autowired)
	private InventoryMapper inventory;

	@Override
	public List<InventoryVO> getList() {
		// TODO Auto-generated method stub
		return inventory.getList();
	}

}
