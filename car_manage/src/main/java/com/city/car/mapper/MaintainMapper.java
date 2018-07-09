package com.city.car.mapper;

import java.util.List;
import java.util.Map;

import com.city.car.model.MaintainModel;

public interface MaintainMapper {

	List<MaintainModel> selectAll();

	MaintainModel selectByPrimaryKey(Integer mid);

	int updateByPrimaryKey(MaintainModel info);

	void deleteBatch(Map<String, Object> paramMap);

	int delete(MaintainModel m);

	List<MaintainModel> pageList(Map<String, Object> paramMap);

	int count();

	void insert(MaintainModel m);

	List<MaintainModel> select();

	int countPage(Map<String, Object> paramMap);

}
