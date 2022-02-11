package com.warehouse.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		result = StringUtils.isEmpty(service.checkID(id)) ? "Y" : "N";
		
		entity = new ResponseEntity<String>(result, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 회원수정 폼
	@GetMapping("/modify")
	public void modify(HttpSession session, Model model) {
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		String id = vo.getId();
		
		model.addAttribute(service.login(id));
		
	}
	
	// 회원수정 저장
	@PostMapping("/modify")
	public String modify(MemberVO vo, HttpSession session, RedirectAttributes rttr) {
		
		String redirectURL = "";
		
		log.info("회원수정정보: " + vo);
		
		MemberVO session_vo = (MemberVO) session.getAttribute("loginStatus");
		
		
		
		if(cryptPassEnc.matches(vo.getPasswd(), session_vo.getPasswd())) {
			
			service.modify(vo);
			
						
			redirectURL = "/usertable/modify";
			rttr.addFlashAttribute("msg", "modifyOk");
		}
		else {
			redirectURL = "/usertable/modify";
			rttr.addFlashAttribute("msg", "modifyFail");
		}
		
		

		return "redirect:" + redirectURL;
	}
	

	// 로그인폼 /member/login
	@GetMapping("/login")
	public void login() {

	}

	// 로그인
	@ResponseBody
	@PostMapping("/login")
	public ResponseEntity<String> login
	(@RequestParam("id") String id, 
	 @RequestParam("passwd") String passwd, 
	 HttpSession session) throws Exception{

		String result = "";
		ResponseEntity<String> entity = null;

		MemberVO vo = service.login(id);

		if(vo == null) { // ID가 미존재한다
			result = "IdFail";
		}else {	// ID가 존재한다
			if(cryptPassEnc.matches(passwd, vo.getPasswd())) {
				result = "success";

				session.setAttribute("loginStatus", vo); // 로그인 성공 상태정보를 세션으로 저장

			}else {
				result = "PwFail";
			}
		}

		entity = new ResponseEntity<String>(result, HttpStatus.OK);

		return entity;

	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		
		session.invalidate();
		
		return "redirect:/usertable/login";
	}
	}