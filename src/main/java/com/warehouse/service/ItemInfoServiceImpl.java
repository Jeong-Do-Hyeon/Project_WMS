package com.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.warehouse.domain.ItemInfoAttachVO;
import com.warehouse.domain.ItemInfoCriteria;
import com.warehouse.domain.ItemInfoVO;
import com.warehouse.mapper.ItemInfoAttachMapper;
import com.warehouse.mapper.ItemInfoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ItemInfoServiceImpl implements ItemInfoService {
	
	@Setter(onMethod_ = @Autowired)
	private ItemInfoMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ItemInfoAttachMapper attachMapper;
	

	@Override
	public void register(ItemInfoVO board) {
		// TODO Auto-generated method stub
		log.info("register..." + board);
		
		mapper.insertSelectKey(board);
		
		log.info("bno: " + board.getBno());
		
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
			
		});
	}

	@Override
	public List<ItemInfoVO> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public List<ItemInfoVO> getListWithPaging(ItemInfoCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(ItemInfoCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public ItemInfoVO get(Long bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}

	@Transactional
	@Override
	public void modify(ItemInfoVO board) {
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size()>=0) {
			
			board.getAttachList().forEach(attach -> {
				
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
				
			});
			
		}
		
	}

	@Transactional
	@Override
	public boolean delete(Long bno) {
		// TODO Auto-generated method stub
		
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<ItemInfoAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		return attachMapper.findByBno(bno);
	}

	@Override
	public void removeAttach(Long bno) {
		// TODO Auto-generated method stub
		attachMapper.deleteAll(bno);
	}

}
