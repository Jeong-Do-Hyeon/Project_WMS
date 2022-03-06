package com.warehouse.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ImpSubVO;
import com.warehouse.domain.ImpVO;

public interface ImpSubService {
	
	public void checkAdd (Integer impnum, String impitemname, String itemname, Integer itemquantity, Integer itemprice);

	public void checkDel(String impitemname);
	
	public void checkModify(Integer impnum, String impitemname, String itemname, Integer itemquantity, Integer itemprice);
	
	public List<ImpSubVO> getList(Integer impnum);
	
}
