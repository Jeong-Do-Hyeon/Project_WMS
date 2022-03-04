package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.domain.ExpVO;
import com.warehouse.mapper.ExpMapper;

import lombok.Setter;

@Service
public class ExpServiceImpl implements ExpService {
	
	@Setter(onMethod_ = @Autowired)
	private ExpMapper mapper;
	

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

}