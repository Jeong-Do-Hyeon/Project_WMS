package com.warehouse.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.warehouse.domain.ImpSubVO;
import com.warehouse.domain.ImpVO;

public interface ImpMapper {

	public void checkAdd(@Param("supply1")String supply1, @Param("impdate")String impdate, @Param("note")String note);
	
	public void checkDel(Integer impnum);
	
	public void checkModify(@Param("impnum")Integer impnum, @Param("supply1")String supply1, @Param("impdate")String impdate, @Param("note")String note);
	
	public List<ImpVO> getList();
	
	public List<ImpSubVO> gettotalList();
	
	public void checkAddInventory
	(@Param("impitemname")String impitemname,
	 @Param("itemname")String itemname,
	 @Param("impdepot")String impdepot,
	 @Param("implocation")String implocation,
	 @Param("quantity")Integer quantity,
	 @Param("impdate")String impdate,
	 @Param("status")String status);
	
	public void checkAddInventoryCheck
	(@Param("impsubindex")Integer impsubindex,
	 @Param("impitemname")String impitemname,
	 @Param("itemname")String itemname,
	 @Param("impdepot")String impdepot,
	 @Param("implocation")String implocation,
	 @Param("quantity")Integer quantity,
	 @Param("impdate")String impdate,
	 @Param("status")String status);

}
