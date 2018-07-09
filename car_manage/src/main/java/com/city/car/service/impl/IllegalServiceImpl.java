package com.city.car.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.city.car.mapper.IllegalMapper;
import com.city.car.model.IllegalModel;
import com.city.car.service.IllegalService;

@Service
public class IllegalServiceImpl implements IllegalService {

	@Autowired
	IllegalMapper illegalMapper;

	public List<IllegalModel> selectAll() {
		return illegalMapper.selectAll();
	}

	public int count() {
		return illegalMapper.count();
	}

	public List<IllegalModel> pageList(Map<String, Object> paramMap) {
		return illegalMapper.pageList(paramMap);
	}

	public int delete(IllegalModel e) {
		return illegalMapper.delete(e);
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		illegalMapper.deleteBatch(paramMap);
	}

	public IllegalModel selectByPrimaryKey(Integer eid) {
		return illegalMapper.selectByPrimaryKey(eid);
	}

	public int updateByPrimaryKey(IllegalModel info) {
		return illegalMapper.updateByPrimaryKey(info);
	}

	public void insert(IllegalModel e) {
		illegalMapper.insert(e);
	}

	public int countPage(Map<String, Object> paramMap) {
		return illegalMapper.countPage(paramMap);
	}

	public List<IllegalModel> select() {
		return illegalMapper.select();
	}
}
