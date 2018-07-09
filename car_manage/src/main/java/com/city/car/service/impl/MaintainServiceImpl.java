package com.city.car.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.city.car.mapper.MaintainMapper;
import com.city.car.model.MaintainModel;
import com.city.car.service.MaintainService;

@Service
public class MaintainServiceImpl implements MaintainService {

	@Autowired
	MaintainMapper maintainMapper;
	
	public List<MaintainModel> selectAll() {
		return maintainMapper.selectAll();
	}

	public MaintainModel selectByPrimaryKey(Integer mid) {
		return maintainMapper.selectByPrimaryKey(mid);
	}

	public int updateByPrimaryKey(MaintainModel info) {
		return maintainMapper.updateByPrimaryKey(info);
	}

	public int delete(MaintainModel m) {
		return maintainMapper.delete(m);
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		maintainMapper.deleteBatch(paramMap);
	}

	public List<MaintainModel> pageList(Map<String, Object> paramMap) {
		return maintainMapper.pageList(paramMap);
	}

	public int count() {
		return maintainMapper.count();
	}

	public void insert(MaintainModel m) {
		maintainMapper.insert(m);
	}

	public List<MaintainModel> select() {
		return maintainMapper.select();
	}

	public int countPage(Map<String, Object> paramMap) {
		return maintainMapper.countPage(paramMap);
	}

}
