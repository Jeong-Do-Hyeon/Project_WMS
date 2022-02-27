package com.warehouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.warehouse.domain.ImpVO;

public interface ImpMapper {

	public void checkAdd(@Param("supply1")String supply1, @Param("impdate")String impdate, @Param("note")String note);
	
	public void checkDel(@Param("supply1")String supply1, @Param("impdate")String impdate, @Param("note")String note);
	
	public void checkModify(@Param("supply1")String supply1, @Param("impdate")String impdate, @Param("note")String note);
	
	public List<ImpVO> getList();
	
}
