package com.warehouse.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.domain.ExpVO;
import com.warehouse.service.ExpService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/exp/*")
@Controller
public class ExpController {
	
	private ExpService service;

	@GetMapping("/expdatacreate")
	public void expdatacreate(Model model) {
		List<ExpVO> list = service.getList();
		
		model.addAttribute("expdatacreate", list);
		
	}
	
	@ResponseBody
	@PostMapping("/checkDel")
	public ResponseEntity<String> checkDel(
			@RequestParam("expcomnameArr[]") List<String> expcomnameArr,
			@RequestParam("expcompersonArr[]") List<String>	expcompersonArr,
			@RequestParam("expaddrArr[]") List<String> expaddrArr,
			@RequestParam("telnumberArr[]") List<String> telnumberArr,
			@RequestParam("expmethodArr[]") List<String> expmethodArr,
			@RequestParam("expdateArr[]") List<String> expdateArr,
			@RequestParam("noteArr[]") List<String> noteArr
			){
		
		// log.info("가나다라");
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expcomnameArr.size(); i++) {
				
			service.checkDel
			(expcomnameArr.get(i),
			 expcompersonArr.get(i),
			 expaddrArr.get(i),
			 telnumberArr.get(i),
			 expmethodArr.get(i),
			 expdateArr.get(i),
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
	@PostMapping("/checkAdd")
	public ResponseEntity<String> checkAdd(
			@RequestParam("expcomnameArr[]") List<String> expcomnameArr,
			@RequestParam("expcompersonArr[]") List<String>	expcompersonArr,
			@RequestParam("expaddrArr[]") List<String> expaddrArr,
			@RequestParam("telnumberArr[]") List<String> telnumberArr,
			@RequestParam("expmethodArr[]") List<String> expmethodArr,
			@RequestParam("expdateArr[]") List<String> expdateArr,
			@RequestParam("noteArr[]") List<String> noteArr
			){
		
		//log.info();
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expcomnameArr.size(); i++) {
				
			service.checkAdd
			(expcomnameArr.get(i),
			 expcompersonArr.get(i),
			 expaddrArr.get(i),
			 telnumberArr.get(i),
			 expmethodArr.get(i),
			 expdateArr.get(i),
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
	@PostMapping("/checkModify")
	public ResponseEntity<String> checkModify(
			@RequestParam("expcomnameArr[]") List<String> expcomnameArr,
			@RequestParam("expcompersonArr[]") List<String>	expcompersonArr,
			@RequestParam("expaddrArr[]") List<String> expaddrArr,
			@RequestParam("telnumberArr[]") List<String> telnumberArr,
			@RequestParam("expmethodArr[]") List<String> expmethodArr,
			@RequestParam("expdateArr[]") List<String> expdateArr,
			@RequestParam("noteArr[]") List<String> noteArr
			){
		
		//log.info();
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expcomnameArr.size(); i++) {
				
			service.checkModify
			(expcomnameArr.get(i),
			 expcompersonArr.get(i),
			 expaddrArr.get(i),
			 telnumberArr.get(i),
			 expmethodArr.get(i),
			 expdateArr.get(i),
			 noteArr.get(i));			
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
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
