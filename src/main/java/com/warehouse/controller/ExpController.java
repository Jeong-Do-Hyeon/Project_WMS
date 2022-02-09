package com.warehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/exp/*")
@Controller
public class ExpController {

	@GetMapping("/expdatacreate")
	public void expdatacreate() {
		
	}
	
	@GetMapping("/exppickchoice")
	public void exppickchoice() {
		
	}
	
	@GetMapping("/exppickdo")
	public void exppickdo() {

	}
	
	@GetMapping("/expcomplete")
	public void expcomplete() {
		
	}
	
	@GetMapping("/expdataprint")
	public void expdataprint() {
		
	}
}
