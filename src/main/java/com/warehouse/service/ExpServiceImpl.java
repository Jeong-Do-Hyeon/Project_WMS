package com.warehouse.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.domain.ExpSubVO;
import com.warehouse.domain.ExpVO;
import com.warehouse.mapper.ExpMapper;
import com.warehouse.mapper.ExpSubMapper;

import lombok.Setter;

@Service
public class ExpServiceImpl implements ExpService {
	
	@Setter(onMethod_ = @Autowired)
	private ExpMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ExpSubMapper submapper;
	
	

	@Override
	public void checkAdd
	(String expcomname, 
	 String expcomperson,
	 String expaddr,
	 String telnumber,
	 String expmethod,
	 String expdate,
	 String note) {
		// TODO Auto-generated method stub
		mapper.checkAdd(expcomname, expcomperson, expaddr, telnumber, expmethod, expdate, note);
	}

	@Override
	public void checkDel(Integer expnum) {
		// TODO Auto-generated method stub
		mapper.checkDel(expnum);
	}
	
	@Override
	public void checkModify
	(Integer expnum,
	 String expcomname,
	 String expcomperson,
	 String expaddr,
	 String telnumber,
	 String expmethod,
	 String expdate,
	 String note) {
		// TODO Auto-generated method stub
		mapper.checkModify(expnum, expcomname, expcomperson, expaddr, telnumber, expmethod, expdate, note);
	}
	
	@Override
	public List<ExpVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public List<ExpSubVO> exppickdoList() {
		// TODO Auto-generated method stub
		return mapper.exppickdoList();
	}

	@Override
	public List<ExpVO> expcomplete() {
		// TODO Auto-generated method stub
		return mapper.expcomplete();
	}

	@Override
	public List<ExpVO> expdataprint() {
		// TODO Auto-generated method stub
		return mapper.expdataprint();
	}

	@Override
	public void exppickdo(Integer expnum, String expitemname, String itemname, Integer expquantity) {
		// TODO Auto-generated method stub
		mapper.exppickdo(expnum, expitemname, itemname, expquantity);
	}

	/*
	@Override
	public void assignment(Integer expnum, String expitemname, String itemname, Integer expquantity) {
		// TODO Auto-generated method stub
		
		mapper.assignment(expnum, expitemname, itemname, expquantity);
		
		String statusname  = "";
		String status = "";
		
		List<ExpVO> getList = getList();
		
		// String[] statusName = new String[getList.size()];
		
		for(int i=0; i<getList.size(); i++) {
			
			// statusName[i] = (getList.get(i)).getStatus();
			
			statusname += (getList.get(i)).getStatus();
			
		}
		
		// 미할당, 부분할당, 완전할당
		
		if(statusname.contains("미할당") && statusname.contains("완전할당")) {
			status = "부분할당";
		}else if(statusname.contains("미할당")) {
			status = "미할당";
		}else {
			status = "완전할당";
		}
	}
	*/

	@Override
	public Integer assign(String expitemname, String itemname) {
		// TODO Auto-generated method stub
		return mapper.assign(expitemname, itemname);
	}

	@Override
	public void assignment(String expitemname, String itemname, String status) {
		// TODO Auto-generated method stub
		mapper.assignment(expitemname, itemname, status);
	}

	@Override
	public void expcomplete(Integer expnum, String expcomname, String expdate) {
		// TODO Auto-generated method stub
		mapper.expcomplete(expnum, expcomname, expdate);
	}

}