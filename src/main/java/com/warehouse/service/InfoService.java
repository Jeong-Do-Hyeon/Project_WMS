package com.warehouse.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.ComInfoVO;

public interface InfoService {

	public List<ComInfoVO> getList();
	
	public void checkAdd(String comname, String comperson, String comaddr, String telnumber, String note);

	public void checkDel(Integer infonum);
	
	public void checkModify(Integer infonum, String comname, String comperson, String comaddr, String telnumber, String note);
}
