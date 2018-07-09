package com.city.car.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.city.car.mapper.UseCarMapper;
import com.city.car.model.UseCarModel;
import com.city.car.service.UseCarService;

@Service
public class UseCarServiceImpl implements UseCarService {

	@Autowired
	UseCarMapper useCarMapper;

	public List<UseCarModel> pageList(Map<String, Object> paramMap) {
		return useCarMapper.pageList(paramMap);
	}

	public int count() {
		return useCarMapper.count();
	}

	public List<UseCarModel> selectAll() {
		return useCarMapper.selectAll();
	}

	public UseCarModel selectByPrimaryKey(Integer uid) {
		return useCarMapper.selectByPrimaryKey(uid);
	}

	public int updateByPrimaryKey(UseCarModel info) {
		return useCarMapper.updateByPrimaryKey(info);
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		useCarMapper.deleteBatch(paramMap);
	}

	public int delete(UseCarModel u) {
		return useCarMapper.delete(u);
	}

	public void passStatus(Map<String, Object> paramMap) {
		useCarMapper.passStatus(paramMap);
	}

	public void stopStatus(Map<String, Object> paramMap) {
		useCarMapper.stopStatus(paramMap);
	}

	public void insert(UseCarModel u) {
		useCarMapper.insert(u);
	}

	public List<UseCarModel> select() {
		return useCarMapper.select();
	}

	public int countPage(Map<String, Object> paramMap) {
		return useCarMapper.countPage(paramMap);
	}
}
