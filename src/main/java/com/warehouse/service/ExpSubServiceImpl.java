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
	public void checkDel(Integer expsubindex) {
		// TODO Auto-generated method stub
		submapper.checkDel(expsubindex);
	}

	@Override
	public void checkModify(Integer expsubindex, String expitemname, String itemname, Integer expquantity,
			Integer expprice) {
		// TODO Auto-generated method stub
		submapper.checkModify(expsubindex, expitemname, itemname, expquantity, expprice);
	}

	@Override
	public void assignment(Integer expnum) {
		
		submapper.assignment(expnum);
		
		String statusname  = "";
		String status = "";
		
		List<ExpSubVO> getList = getList(expnum);
		
		// String[] statusName = new String[getList.size()];
		
		for(int i=0; i<getList.size(); i++) {
			
			// statusName[i] = (getList.get(i)).getStatus();
			
			statusname += (getList.get(i)).getStatus();
			
			log.info(statusname);
			
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

}
