package com.warehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/usertable/*")
@Controller
public class MemberController {
	
	// 주요기능 : 회원기능
	
	// 회원가입
	@GetMapping("/adduser")
	public void adduser() {
		
	}
	
	// 회원가입저장
	@PostMapping("/adduser")
	public String joinOk() throws Exception{
		
		return "";
	}

	// 아이디 중복체크
	
}
