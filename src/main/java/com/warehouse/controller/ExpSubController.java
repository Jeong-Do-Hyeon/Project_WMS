package com.warehouse.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.domain.ExpSubVO;
import com.warehouse.service.ExpSubService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/expsubdata/*")
@AllArgsConstructor
public class ExpSubController {

	private ExpSubService service;
	
	@GetMapping("/subexp")
	public String getList(@ModelAttribute("expnum")Integer expnum, Model model) {
		
		List<ExpSubVO> list = service.getList(expnum);
		
		model.addAttribute("expsubdatacreate", list);
		
		return "/exp/expsubdatacreate";
		
	}
	
	@ResponseBody
	@PostMapping("/checkAdd")
	public ResponseEntity<String> checkAdd(
			@RequestParam("expnumArr[]") List<Integer> expnumArr,
			@RequestParam("expitemnameArr[]") List<String> expitemnameArr,
			@RequestParam("itemnameArr[]") List<String> itemnameArr,
			@RequestParam("expquantityArr[]") List<Integer> expquantityArr,
			@RequestParam("exppriceArr[]") List<Integer> exppriceArr){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expitemnameArr.size(); i++) {
			
			service.checkAdd(expnumArr.get(i), expitemnameArr.get(i), itemnameArr.get(i), expquantityArr.get(i), exppriceArr.get(i));
				
			}
			
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
			
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@ResponseBody
	@PostMapping("/checkDel")
	public ResponseEntity<String> checkDel(
			@RequestParam("expsubindexArr[]") List<Integer> expsubindexArr){
		
		log.info(expsubindexArr);
		
		ResponseEntity<String> entity = null;
		
		
		try {
			
			for(int i=0; i<expsubindexArr.size(); i++) {
				
				service.checkDel(expsubindexArr.get(i));
			}
			
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/checkModify")
	public ResponseEntity<String> checkModify(
			@RequestParam("expsubindexArr[]") List<Integer> expsubindexArr,
			@RequestParam("expitemnameArr[]") List<String> expitemnameArr,
			@RequestParam("itemnameArr[]") List<String> itemnameArr,
			@RequestParam("expquantityArr[]") List<Integer> expquantityArr,
			@RequestParam("exppriceArr[]") List<Integer> exppriceArr){
		
		log.info(expsubindexArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<expsubindexArr.size(); i++) {
				
				service.checkModify
				(expsubindexArr.get(i),
				 expitemnameArr.get(i),
				 itemnameArr.get(i),
				 expquantityArr.get(i),
				 exppriceArr.get(i));
				
			}
				 
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
				
				
			}catch(Exception e) {
				
				e.printStackTrace();
				entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
		
	}
	
	
}
