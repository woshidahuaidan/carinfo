package com.city.car.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.city.car.mapper.InsuranceMapper;
import com.city.car.model.InsuranceModel;
import com.city.car.service.InsuranceService;

@Service
public class InsuranceServiceImpl implements InsuranceService {

	@Autowired
	InsuranceMapper insuranceMapper;
	
	public List<InsuranceModel> selectAll() {
		return insuranceMapper.selectAll();
	}

	public int insert(InsuranceModel su) {
		return insuranceMapper.insert(su);
	}

	public int delete(InsuranceModel su) {
		return insuranceMapper.delete(su);
	}

	public InsuranceModel selectByPrimaryKey(int id) {
		return insuranceMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKey(InsuranceModel su) {
		return insuranceMapper.updateByPrimaryKey(su);
	}

	public List<InsuranceModel> pageList(Map<String, Object> paramMap) {
		return insuranceMapper.pageList(paramMap);
	}

	public int count() {
		return insuranceMapper.count();
	}

	public void deleteBatch(Map<String, Object> paramMap) {
		insuranceMapper.deleteBatch(paramMap);
	}

	public List<InsuranceModel> querySearch(Map<String, Object> paramMap) {
		return insuranceMapper.querySearch(paramMap);
	}

	public int count(Map<String, Object> paramMap) {
		return insuranceMapper.count(paramMap);
	}

}
