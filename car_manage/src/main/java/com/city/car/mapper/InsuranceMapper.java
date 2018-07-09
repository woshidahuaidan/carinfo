package com.city.car.mapper;

import java.util.List;
import java.util.Map;

import com.city.car.model.InsuranceModel;

public interface InsuranceMapper {

	List<InsuranceModel> selectAll();

	int insert(InsuranceModel su);

	int delete(InsuranceModel su);

	InsuranceModel selectByPrimaryKey(int id);

	int updateByPrimaryKey(InsuranceModel su);

	List<InsuranceModel> pageList(Map<String, Object> paramMap);

	int count();

	void deleteBatch(Map<String, Object> paramMap);

	List<InsuranceModel> querySearch(Map<String, Object> paramMap);

	int count(Map<String, Object> paramMap);

}
