package com.warehouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ComInfoVO;

public interface ComInfoMapper {
	
	public List<ComInfoVO> getList();

	public void checkAdd(
			@Param("comname")String comname,
			@Param("comperson")String comperson,
			@Param("comaddr")String comaddr,
			@Param("telnumber")String telnumber,
			@Param("note")String note);
	
	public void checkDel(Integer infonum);
	
	public void checkModify(
			@Param("infonum")Integer infonum,
			@Param("comname")String comname,
			@Param("comperson")String comperson,
			@Param("comaddr")String comaddr,
			@Param("telnumber")String telnumber,
			@Param("note")String note);
	
}
