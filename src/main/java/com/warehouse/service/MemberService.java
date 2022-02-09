package com.warehouse.service;

import com.warehouse.domain.MemberVO;

public interface MemberService {

	public int adduser(MemberVO vo);
	
	public String checkid(String id);
	
}
