package com.warehouse.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.warehouse.domain.ExpSubVO;
import com.warehouse.mapper.ExpMapper;
import com.warehouse.mapper.ExpSubMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ExpSubServiceImpl implements ExpSubService {
	
	private ExpMapper mapper;
	
	private ExpSubMapper submapper;

	@Override
	public void checkAdd(Integer expnum, String expitemname, String itemname, Integer expquantity, Integer expprice) {
		// TODO Auto-generated method stub
		submapper.checkAdd(expnum, expitemname, itemname, expquantity, expprice);
	}

	@Override
	public List<ExpSubVO> getList(Integer expnum) {
		// TODO Auto-generated method stub
		return submapper.getList(expnum);
	}

	@Override
	public void checkDel(String expitemname) {
		// TODO Auto-generated method stub
		submapper.checkDel(expitemname);
	}

	@Override
	public void checkModify(Integer expnum, String expitemname, String itemname, Integer expquantity,
			Integer expprice) {
		// TODO Auto-generated method stub
		submapper.checkModify(expnum, expitemname, itemname, expquantity, expprice);
	}

}
