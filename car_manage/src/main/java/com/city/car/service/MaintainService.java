package com.city.car.service;

import java.util.List;
import java.util.Map;

import com.city.car.model.MaintainModel;

public interface MaintainService {

	List<MaintainModel> selectAll();

	MaintainModel selectByPrimaryKey(Integer mid);

	int updateByPrimaryKey(MaintainModel info);

	int delete(MaintainModel m);

	void deleteBatch(Map<String, Object> paramMap);

	List<MaintainModel> pageList(Map<String, Object> paramMap);

	int count();

	void insert(MaintainModel m);

	List<MaintainModel> select();

	int countPage(Map<String, Object> paramMap);

}
