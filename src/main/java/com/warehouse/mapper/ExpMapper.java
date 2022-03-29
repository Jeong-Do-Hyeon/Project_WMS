package com.warehouse.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ExpSubVO;
import com.warehouse.domain.ExpVO;

public interface ExpMapper {

	public void checkAdd
	(@Param("expcomname")String expcomname, 
	 @Param("expcomperson")String expcomperson,
	 @Param("expaddr")String expaddr,
	 @Param("telnumber")String telnumber,
	 @Param("expmethod")String expmethod,
	 @Param("expdate")String expdate,
	 @Param("note")String note);
	
	public void checkDel(Integer expnum);
	
	public void checkModify
	(@Param("expnum")Integer expnum,
	 @Param("expcomname")String expcomname, 
	 @Param("expcomperson")String expcomperson,
	 @Param("expaddr")String expaddr,
	 @Param("telnumber")String telnumber,
	 @Param("expmethod")String expmethod,
	 @Param("expdate")String expdate,
	 @Param("note")String note);
	
	public List<ExpVO> getList();
	
	public List<ExpSubVO> exppickdoList();
	
	public List<ExpVO> expcomplete();
	
	public void exppickdo
	(@Param("expnum")Integer expnum,
	 @Param("expitemname")String expitemname,
	 @Param("itemname")String itemname,
	 @Param("expquantity")Integer expquantity);
	
	public void assignment
	(@Param("expitemname")String expitemname,
	 @Param("itemname")String itemname,
	 @Param("status")String status);
	
	public List<ExpVO> expdataprint();
	
	public Integer assign
	(@Param("expitemname")String expitemname,
	 @Param("itemname")String itemname);
	
	public void expcomplete
	(@Param("expnum")Integer expnum,
	 @Param("expcomname")String expcomname,
	 @Param("expdate")String expdate);
	
}
