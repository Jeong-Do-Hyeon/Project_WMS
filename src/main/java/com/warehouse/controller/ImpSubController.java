package com.warehouse.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.domain.ImpSubVO;
import com.warehouse.domain.ImpVO;
import com.warehouse.service.ImpSubService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/subdata/*")
@AllArgsConstructor
public class ImpSubController {
	
	private ImpSubService service;

	@GetMapping("/subimp")
	public String getList(@ModelAttribute("impnum")Integer impnum, Model model) {
		
		List<ImpSubVO> list = service.getList(impnum);
		
		model.addAttribute("impsubdatacreate", list);
		
		return "/imp/impsubdatacreate";
	}
	
	@ResponseBody
	@PostMapping("/checkAdd")
	public ResponseEntity<String> checkAdd(
			@RequestParam("impnumArr[]") List<Integer> impnumArr,
			@RequestParam("impitemnameArr[]") List<String> impitemnameArr,
			@RequestParam("itemnameArr[]") List<String> itemnameArr,
			@RequestParam("itemquantityArr[]") List<Integer> itemquantityArr,
			@RequestParam("itempriceArr[]") List<Integer> itempriceArr){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<impitemnameArr.size(); i++) {
			
			service.checkAdd(impnumArr.get(i), impitemnameArr.get(i), itemnameArr.get(i), itemquantityArr.get(i), itempriceArr.get(i));
				
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
			@RequestParam("impitemnameArr[]") List<String> impitemnameArr){
		
		log.info(impitemnameArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<impitemnameArr.size(); i++) {
				
				service.checkDel(impitemnameArr.get(i));
				
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		}catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/checkModify")
	public ResponseEntity<String> checkModify(
			@RequestParam("impnumArr[]") List<Integer> impnumArr,
			@RequestParam("impitemnameArr[]") List<String> impitemnameArr,
			@RequestParam("itemnameArr[]") List<String> itemnameArr,
			@RequestParam("itemquantityArr[]") List<Integer> itemquantityArr,
			@RequestParam("itempriceArr[]") List<Integer> itempriceArr){
		
		log.info(impitemnameArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<impitemnameArr.size(); i++) {
				
				service.checkModify
				(impnumArr.get(i), 
				 impitemnameArr.get(i),
				 itemnameArr.get(i),
				 itemquantityArr.get(i),
				 itempriceArr.get(i));
				
			}
			
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
			
			}catch(Exception e) {
				
				e.printStackTrace();
				entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	

}
