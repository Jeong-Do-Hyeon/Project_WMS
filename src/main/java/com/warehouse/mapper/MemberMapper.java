package com.warehouse.mapper;

import org.apache.ibatis.annotations.Param;

import com.warehouse.domain.MemberVO;

public interface MemberMapper {

	public int adduser(MemberVO vo);
	
	public String checkID(String id);
	
	public MemberVO login(String id);
	
	public int modify(MemberVO vo);

}
