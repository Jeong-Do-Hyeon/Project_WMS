package com.warehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/imp/*")
@Controller
public class ImpController {

	@GetMapping("/impdatacreate")
	public void impdatacreate() {
		
	}
	
	@GetMapping("/impqrcreate")
	public void impqrcreate() {
		
	}
	
	@GetMapping("/impcomplete")
	public void impcomplete() {

	}
}
