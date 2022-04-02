package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.domain.ComInfoVO;
import com.warehouse.mapper.ExpMapper;
import com.warehouse.mapper.ComInfoMapper;

import lombok.Setter;

@Service
public class ComInfoServiceImpl implements ComInfoService {

	@Setter(onMethod_ = @Autowired)
	private ComInfoMapper mapper;

	
	@Override
	public List<ComInfoVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}


	@Override
	public void checkAdd(String comname, String comperson, String comaddr, String telnumber, String note) {
		// TODO Auto-generated method stub
		mapper.checkAdd(comname, comperson, comaddr, telnumber, note);
	}


	@Override
	public void checkDel(Integer infonum) {
		// TODO Auto-generated method stub
		mapper.checkDel(infonum);
	}


	@Override
	public void checkModify(Integer infonum, String comname, String comperson, String comaddr, String telnumber, String note) {
		// TODO Auto-generated method stub
		mapper.checkModify(infonum, comname, comperson, comaddr, telnumber, note);
	}

}
