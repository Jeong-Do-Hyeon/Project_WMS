package com.warehouse.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.warehouse.domain.ItemInfoAttachVO;
import com.warehouse.domain.ItemInfoCriteria;
import com.warehouse.domain.ItemInfoPageDTO;
import com.warehouse.domain.ItemInfoVO;
import com.warehouse.service.ItemInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/iteminfo/*")
@Controller
@AllArgsConstructor
public class ItemInfoController {

	private ItemInfoService service;
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	
	@PostMapping("/register")
	public String register(ItemInfoVO board, RedirectAttributes rttr) {
		
		log.info("ItemInfoVO..." + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(board);
		
		return "redirect:/iteminfo/list";
		
	}
	
	
	
	
	@GetMapping("/list")
	public void list(ItemInfoCriteria cri, Model model) {
		
		log.info("list: " + cri);
		List<ItemInfoVO> list = service.getListWithPaging(cri);
		model.addAttribute("list", list);
		
		int total = service.getTotalCount(cri);
		
		log.info("total: " + total);
		
		ItemInfoPageDTO pageDTO = new ItemInfoPageDTO(cri, total);
		model.addAttribute("pageMaker", pageDTO);
		
		
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") ItemInfoCriteria cri, Model model) {
		
		log.info("get..." + bno);
		
		ItemInfoVO board = service.get(bno);
		model.addAttribute("board", board);
	}
	
	@PostMapping("/modify")
	public String modify(ItemInfoVO board, ItemInfoCriteria cri, RedirectAttributes rttr) {
		
		log.info("modify: " + board);
		
		service.modify(board);
		
		return "redirect:/iteminfo/list" + cri.getListLink();
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, ItemInfoCriteria cri, RedirectAttributes rttr) {
		
		List<ItemInfoAttachVO> attachList = service.getAttachList(bno);
		
		if(service.delete(bno)) {
		
			deleteFiles(attachList);
			
		}
		
		return "redirect:/iteminfo/list" + cri.getListLink();
		
	}
	
	private void deleteFiles(List<ItemInfoAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info(attachList);
		
		attachList.forEach(attach -> {
			
			try {
				Path file = Paths.get("D:\\Dev\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
			
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("D:\\Dev\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					Files.delete(thumbNail);
				}
				
			}catch(Exception ex) {
				log.error("delete file error: " + ex.getMessage());
			}
			
		});
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ItemInfoAttachVO>> getAttachList(Long bno){
		
		ResponseEntity<List<ItemInfoAttachVO>> entity = null;
		
		entity = new ResponseEntity<List<ItemInfoAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
		
		return entity;
	}
	
	
}
