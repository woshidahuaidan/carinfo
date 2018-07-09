package com.city.car.mapper;

import java.util.List;
import java.util.Map;

import com.city.car.model.UseCarModel;

public interface UseCarMapper {

	List<UseCarModel> pageList(Map<String, Object> paramMap);

	int count();

	List<UseCarModel> selectAll();

	UseCarModel selectByPrimaryKey(Integer uid);

	int updateByPrimaryKey(UseCarModel info);

	void deleteBatch(Map<String, Object> paramMap);

	int delete(UseCarModel u);
	
	void passStatus(Map<String, Object> paramMap);
	
	void stopStatus(Map<String, Object> paramMap);

	void insert(UseCarModel u);

	List<UseCarModel> select();

	int countPage(Map<String, Object> paramMap);
}
