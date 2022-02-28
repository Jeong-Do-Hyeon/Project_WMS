package com.warehouse.service;

import java.util.Date;
import java.util.List;

import org.springframework.ui.Model;

import com.warehouse.domain.ImpVO;

public interface ImpService {
	
	public void checkAdd(String supply1, String impdate, String note);

	public void checkDel(Integer impnum);
	
	public void checkModify(Integer impnum, String supply1, String impdate, String note);

	public List<ImpVO> getList();

}
