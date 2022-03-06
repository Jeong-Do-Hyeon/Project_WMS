package com.warehouse.service;

import java.util.List;

import com.warehouse.domain.ExpSubVO;

public interface ExpSubService {

	public void checkAdd(
			Integer expnum,
			String expitemname,
			String itemname,
			Integer exqquantity,
			Integer expprice);
	
	public void checkDel(String expitemname);
	
	public void checkModify(
			Integer expnum,
			String expitemname,
			String itemname,
			Integer expquantity,
			Integer expprice);
	
	public List<ExpSubVO> getList(Integer expnum);
	
}
