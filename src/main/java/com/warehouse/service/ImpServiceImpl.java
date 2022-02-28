package com.warehouse.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.warehouse.domain.ImpVO;
import com.warehouse.mapper.ImpMapper;

import lombok.Setter;

@Service
public class ImpServiceImpl implements ImpService {
	
	@Setter(onMethod_ = @Autowired)
	private ImpMapper mapper;

	@Override
	public void checkAdd(String supply1, String impdate, String note) {
		// TODO Auto-generated method stub
		mapper.checkAdd(supply1, impdate, note);
	}
	
	@Override
	public void checkDel(Integer impnum) {
		// TODO Auto-generated method stub
		mapper.checkDel(impnum);
	}

	@Override
	public List<ImpVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public void checkModify(Integer impnum, String supply1, String impdate, String note) {
		// TODO Auto-generated method stub
		mapper.checkModify(impnum, supply1, impdate, note);
	}



}
