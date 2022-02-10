package com.warehouse.mapper;

import com.warehouse.domain.MemberVO;

public interface MemberMapper {

	public int adduser(MemberVO vo);
	
	public String checkID(String id);
	
	public MemberVO login(String id);
}
