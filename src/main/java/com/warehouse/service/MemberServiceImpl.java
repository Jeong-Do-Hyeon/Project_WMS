package com.warehouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.warehouse.domain.MemberVO;
import com.warehouse.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	/*
	public void setMapper(MemberMapper mapper) {
		this.mapper = mapper;
	}
	*/
	
	@Override
	public int adduser(MemberVO vo) {
		// TODO Auto-generated method stub
		return mapper.adduser(vo);
	}

	@Override
	public String checkid(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
