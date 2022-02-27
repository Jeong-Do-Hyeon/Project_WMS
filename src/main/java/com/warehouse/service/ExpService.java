package com.warehouse.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ExpVO;

public interface ExpService {

	public void checkAdd
	(@Param("expcomname")String expcomname, 
	 @Param("expcomperson")String expcomperson,
	 @Param("expaddr")String expaddr,
	 @Param("telnumber")String telnumber,
	 @Param("expmethod")String expmethod,
	 @Param("expdate")String expdate,
	 @Param("note")String note);
	
	public void checkDel
	(@Param("expcomname")String expcomname, 
	 @Param("expcomperson")String expcomperson,
	 @Param("expaddr")String expaddr,
	 @Param("telnumber")String telnumber,
	 @Param("expmethod")String expmethod,
	 @Param("expdate")String expdate,
	 @Param("note")String note);
	
	public void checkModify
	(@Param("expcomname")String expcomname, 
	 @Param("expcomperson")String expcomperson,
	 @Param("expaddr")String expaddr,
	 @Param("telnumber")String telnumber,
	 @Param("expmethod")String expmethod,
	 @Param("expdate")String expdate,
	 @Param("note")String note);
	
	public List<ExpVO> getList();
	
}
