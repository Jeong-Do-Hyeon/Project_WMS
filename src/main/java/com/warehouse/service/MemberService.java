package com.warehouse.service;

import com.warehouse.domain.MemberVO;

public interface MemberService {

	public int adduser(MemberVO vo);
	
	public String checkID(String id);

	public MemberVO login(String id);
	
	public int modify(MemberVO vo);

}
