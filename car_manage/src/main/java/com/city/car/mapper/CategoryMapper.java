package com.city.car.mapper;

import java.util.List;
import java.util.Map;

import com.city.car.model.CategoryModel;
import com.city.car.model.LevalModel;

public interface CategoryMapper {

	List<CategoryModel> selectAll();
	
	int insert(CategoryModel cc);
	
	int delete(CategoryModel cc);
	
	CategoryModel selectByPrimaryKey(int id);
	
	int updateByPrimaryKey(CategoryModel cc);

	int count();

	List<CategoryModel> pageList(Map<String, Object> paramMap);

	void deleteBatch(Map<String, Object> paramMap);

	List<LevalModel> selectLevel(LevalModel lm);

	int insertLevels(Map<String, Object> paramMap);
}
