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

import com.warehouse.domain.ExpSubVO;
import com.warehouse.domain.ExpVO;
import com.warehouse.domain.ImpSubVO;
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
			@RequestParam("expnumArr[]") List<Integer> expnumArr){
		
		log.info(expnumArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expnumArr.size(); i++) {
				
			service.checkDel(expnumArr.get(i));
			
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
			@RequestParam("expnumArr[]") List<Integer> expnumArr,
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
			(expnumArr.get(i),
			 expcomnameArr.get(i),
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
	public void exppickchoice(Model model) {
		List<ExpVO> list = service.getList();
		
		model.addAttribute("exppickchoice", list);
		
		
	}
	
	@GetMapping("/exppickdo")
	public String exppickdo(Model model) {
		
		List<ExpSubVO> list = service.exppickdoList();
		
		model.addAttribute("exppickdoList", list);
		
		return "/exp/exppickdo";
		
		
	}
	
	@GetMapping("/expcomplete")
	public String expcomplete(Model model) {
		List<ExpVO> list = service.expcomplete();
		
		model.addAttribute("expcomplete", list);
		
		return "/exp/expcomplete";
	}
	
	@ResponseBody
	@PostMapping("/exppickdo")
	public ResponseEntity<String> exppickdo(
			@RequestParam("expnumArr[]")List<Integer> expnumArr,
			@RequestParam("expitemnameArr[]")List<String> expitemnameArr,
			@RequestParam("itemnameArr[]")List<String> itemnameArr,
			@RequestParam("expquantityArr[]")List<Integer> expquantityArr){
		
		log.info(expnumArr);
		log.info(expitemnameArr);
		log.info(itemnameArr);
		log.info(expquantityArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expnumArr.size(); i++) {
				
			service.exppickdo
			(expnumArr.get(i),
			 expitemnameArr.get(i),
			 itemnameArr.get(i),
			 expquantityArr.get(i));			
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	
	
	
	@GetMapping("/expdataprint")
	public String expdataprint(Model model) {
		List<ExpVO> list = service.expdataprint();
		
		model.addAttribute("expdataprint", list);
		
		return "/exp/expdataprint";
	}
}
