package com.city.car.service;

import java.util.List;
import java.util.Map;

import com.city.car.model.InsuranceModel;

public interface InsuranceService {
	
	List<InsuranceModel> selectAll();

	int insert(InsuranceModel cc);

	int delete(InsuranceModel cc);

	InsuranceModel selectByPrimaryKey(int id);

	int updateByPrimaryKey(InsuranceModel cc);

	List<InsuranceModel> pageList(Map<String, Object> paramMap);

	int count();

	void deleteBatch(Map<String, Object> paramMap);

	List<InsuranceModel> querySearch(Map<String, Object> paramMap);

	int count(Map<String, Object> paramMap);
}
