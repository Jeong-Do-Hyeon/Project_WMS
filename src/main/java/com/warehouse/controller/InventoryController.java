package com.warehouse.controller;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.warehouse.domain.ImpVO;
import com.warehouse.domain.InventoryVO;
import com.warehouse.service.InventoryService;
import com.warehouse.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/inventory/*")
@Controller
public class InventoryController {
	
	private InventoryService service;

	@GetMapping("/inventory")
	public void inventory(Model model) {
		
		List<InventoryVO> list = service.getList();
			
		model.addAttribute("inventory", list);
	}
}
