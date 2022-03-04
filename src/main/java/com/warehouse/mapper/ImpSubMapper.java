package com.warehouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ImpSubVO;
import com.warehouse.domain.ImpVO;

public interface ImpSubMapper {

	public void checkAdd(
			@Param("impnum")Integer impnum,
			@Param("impitemname")String impitemname,
			@Param("itemname")String itemname,
			@Param("itemquantity")String itemquantity,
			@Param("itemprice")String itemprice);
	
	public void checkDel(Integer impnum);
	
	public void checkModify();
	
	public List<ImpSubVO> getList(Integer impnum);
	
	
}
