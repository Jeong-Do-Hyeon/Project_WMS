package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.warehouse.domain.ImpSubVO;
import com.warehouse.domain.ImpVO;
import com.warehouse.mapper.ImpMapper;
import com.warehouse.mapper.ImpSubMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ImpSubServiceImpl implements ImpSubService {
	
	private ImpMapper mapper;
	
	private ImpSubMapper submapper;


	@Override
	public List<ImpSubVO> getList(Integer impnum) {
		// TODO Auto-generated method stub
		return submapper.getList(impnum);
	}



	@Override
	public void checkAdd(Integer impnum, String impitemname, String itemname, Integer itemquantity, Integer itemprice) {
		// TODO Auto-generated method stub
		submapper.checkAdd(impnum, impitemname, itemname, itemquantity, itemprice);
	}



	@Override
	public void checkDel(Integer impsubindex) {
		// TODO Auto-generated method stub
		submapper.checkDel(impsubindex);
	}



	@Override
	public void checkModify(Integer impsubindex, String impitemname, String itemname, Integer itemquantity,
			Integer itemprice) {
		// TODO Auto-generated method stub
		
		submapper.checkModify(impsubindex, impitemname, itemname, itemquantity, itemprice);
	}




}
