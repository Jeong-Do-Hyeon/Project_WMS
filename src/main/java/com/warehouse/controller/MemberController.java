package com.warehouse.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ctc.wstx.util.StringUtil;
import com.warehouse.domain.MemberVO;
import com.warehouse.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/usertable/*")
@Controller
public class MemberController {
	
	@Inject
	private PasswordEncoder cryptPassEnc;
	
	@Inject
	private MemberService service;
	
	// 주요기능 : 회원기능
	
	// 회원가입
	@GetMapping("/adduser")
	public void adduser() {
		
	}
	
	// 회원가입저장
	@PostMapping("/adduser")
	public String adduserOk(MemberVO vo, RedirectAttributes rttr) throws Exception{
		
		// 비밀번호(평문) -> 암호화
		// 비밀번호 암호화 (스프링 시큐리티 기능)
		
		vo.setPasswd(cryptPassEnc.encode(vo.getPasswd()));
		
		log.info("MemberVO: " + vo);
		
		service.adduser(vo);
		
		
		return "redirect:/usertable/login";
	}

	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/checkID")
	public ResponseEntity<String> checkID(@RequestParam("id") String id) throws Exception{
		
		String result = "";
		ResponseEntity<String> entity = null;
		
		result = StringUtils.isEmpty(service.checkid(id)) ? "Y" : "N";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 회원수정 폼
	@GetMapping("/modify")
	public void modify() {
		
	}
	
	// 로그인
	@GetMapping("/login")
	public void login() {
		
	}
	
}
