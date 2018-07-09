package com.city.car.mapper;

import java.util.List;
import java.util.Map;

import com.city.car.model.IllegalModel;

public interface IllegalMapper {

	List<IllegalModel> selectAll();

	int count();

	List<IllegalModel> pageList(Map<String, Object> paramMap);

	int delete(IllegalModel e);

	void deleteBatch(Map<String, Object> paramMap);

	IllegalModel selectByPrimaryKey(Integer eid);

	int updateByPrimaryKey(IllegalModel info);

	void insert(IllegalModel e);

	int countPage(Map<String, Object> paramMap);

	List<IllegalModel> select();

}
