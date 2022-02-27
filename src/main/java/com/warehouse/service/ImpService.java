package com.warehouse.service;

import java.util.List;

import org.springframework.ui.Model;

import com.warehouse.domain.ImpVO;

public interface ImpService {
	
	public void checkAdd(String supply1, String impdate, String note);

	public void checkDel(String supply1, String impdate, String note);
	
	public void checkModify(String supply1, String impdate, String note);

	public List<ImpVO> getList();

}
