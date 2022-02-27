package com.warehouse.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.warehouse.domain.ImpVO;
import com.warehouse.service.ImpService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/imp/*")
@Controller
public class ImpController {
	
	private ImpService service;

	@GetMapping("/impdatacreate")
	public void impdatacreate(Model model) {
		List<ImpVO> list = service.getList();
		
		model.addAttribute("impdatacreate", list);
	}
	
	@ResponseBody
	@PostMapping("/checkDel")
	public ResponseEntity<String> checkDel(
			@RequestParam("supply1Arr[]") List<String> supply1Arr,
			@RequestParam("impdateArr[]") List<String>	impdateArr,
			@RequestParam("noteArr[]") List<String> noteArr){
		
		log.info(supply1Arr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<supply1Arr.size(); i++) {
				
			service.checkDel(supply1Arr.get(i), impdateArr.get(i), noteArr.get(i));
			
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
			@RequestParam("supply1Arr[]") List<String> supply1Arr,
			@RequestParam("impdateArr[]") List<String>	impdateArr,
			@RequestParam("noteArr[]") List<String> noteArr){
		
		log.info(supply1Arr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<supply1Arr.size(); i++) {
				
			service.checkAdd(supply1Arr.get(i), impdateArr.get(i), noteArr.get(i));
			
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
			@RequestParam("supply1Arr[]") List<String> supply1Arr,
			@RequestParam("impdateArr[]") List<String>	impdateArr,
			@RequestParam("noteArr[]") List<String> noteArr){
		
		log.info(supply1Arr);
		
		ResponseEntity<String> entity = null;
		
		try {
			
			for(int i=0; i<supply1Arr.size(); i++) {
				
			service.checkModify(supply1Arr.get(i), impdateArr.get(i), noteArr.get(i));
			
			}
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
			
		}catch(Exception e){
			
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	
	
	@GetMapping("/impqrcreate")
	public void impqrcreate() {
		
	}
	
	@GetMapping("/impcomplete")
	public void impcomplete() {

	}
}
