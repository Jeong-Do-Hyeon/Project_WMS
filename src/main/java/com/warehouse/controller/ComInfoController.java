package com.warehouse.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.domain.ComInfoVO;
import com.warehouse.domain.ExpVO;
import com.warehouse.service.ExpService;
import com.warehouse.service.ComInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/cominfo/*")
@Controller
public class ComInfoController {

	private ComInfoService service;

	@GetMapping("/cominfo")
	public void cominfo(Model model) {
		
		List<ComInfoVO> list = service.getList();
		
		model.addAttribute("cominfo", list);
		
	}
	
	@ResponseBody
	@PostMapping("/checkAdd")
	public ResponseEntity<String> checkAdd(
			@RequestParam("comnameArr[]") List<String> comnameArr,
		  	@RequestParam("compersonArr[]") List<String> compersonArr,
		  	@RequestParam("comaddrArr[]") List<String> comaddrArr,
		  	@RequestParam("telnumberArr[]") List<String> telnumberArr,
		  	@RequestParam("noteArr[]") List<String> noteArr){
		
		//log.info();
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<comnameArr.size(); i++) {
				
			service.checkAdd
			(comnameArr.get(i),
			 compersonArr.get(i),
			 comaddrArr.get(i),
			 telnumberArr.get(i),
			 noteArr.get(i));		
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/checkdel")
	public ResponseEntity<String> checkDel(
			@RequestParam("infonumArr[]") List<Integer> infonumArr){
		
		log.info(infonumArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<infonumArr.size(); i++) {
				
			service.checkDel(infonumArr.get(i));
			
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	
	@ResponseBody
	@PostMapping("/checkModify")
	public ResponseEntity<String> checkModify(
			@RequestParam("infonumArr[]") List<Integer> infonumArr,
			@RequestParam("comnameArr[]") List<String> comnameArr,
		  	@RequestParam("compersonArr[]") List<String> compersonArr,
		  	@RequestParam("comaddrArr[]") List<String> comaddrArr,
		  	@RequestParam("telnumberArr[]") List<String> telnumberArr,
		  	@RequestParam("noteArr[]") List<String> noteArr){
		
		log.info(infonumArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<comnameArr.size(); i++) {
				
			service.checkModify
			(infonumArr.get(i),
			 comnameArr.get(i),
			 compersonArr.get(i),
			 comaddrArr.get(i),
			 telnumberArr.get(i),
			 noteArr.get(i));			
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	
	
	
}
