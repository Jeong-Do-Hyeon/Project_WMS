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
			@Param("itemquantity")Integer itemquantity,
			@Param("itemprice")Integer itemprice);
	
	public void checkDel(Integer impsubindex);
	
	public void checkModify(
			@Param("impsubindex")Integer impsubindex,
			@Param("impitemname")String impitemname,
			@Param("itemname")String itemname,
			@Param("itemquantity")Integer itemquantity,
			@Param("itemprice")Integer itemprice);
	
	public List<ImpSubVO> getList(Integer impnum);
	
	public List<ImpSubVO> gettotalList();
	
	
}
