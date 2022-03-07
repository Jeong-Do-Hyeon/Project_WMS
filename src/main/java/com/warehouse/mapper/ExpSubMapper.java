package com.warehouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ExpSubVO;
import com.warehouse.domain.ImpSubVO;
import com.warehouse.domain.ImpVO;

public interface ExpSubMapper {

	public void checkAdd(
			@Param("expnum")Integer expnum,
			@Param("expitemname")String expitemname,
			@Param("itemname")String itemname,
			@Param("expquantity")Integer expquantity,
			@Param("expprice")Integer expprice);
	
	public void checkDel(Integer expsubindex);
	
	public void checkModify(
			@Param("expsubindex")Integer expsubindex,
			@Param("expitemname")String expitemname,
			@Param("itemname")String itemname,
			@Param("expquantity")Integer expquantity,
			@Param("expprice")Integer expprice);
	
	public List<ExpSubVO> getList(Integer expnum);
	
	
}
