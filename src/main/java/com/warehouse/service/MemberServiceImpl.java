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
<<<<<<< HEAD
	public String checkID(String id) {
		// TODO Auto-generated method stub
		return mapper.checkID(id);
	}

	@Override
	public MemberVO login(String id) {
		// TODO Auto-generated method stub
		return mapper.login(id);
=======
	public String checkid(String id) {
		// TODO Auto-generated method stub
		return null;
>>>>>>> refs/remotes/origin/master
	}

}
