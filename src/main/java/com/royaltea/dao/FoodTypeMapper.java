package com.royaltea.dao;

import java.util.List;

import com.royaltea.pojo.FoodType;

public interface FoodTypeMapper {
	
	List<FoodType> queryAll();
	
	void add(FoodType ft);
	
	void deleteById(Integer ftId);

	FoodType selectById(Integer ftId);

	void update(FoodType ft);
}
