package com.royaltea.service;

import java.util.List;

import com.royaltea.pojo.FoodType;

public interface FoodTypeService {
	/**
     * ����ȫ����person
     * @return
     */
    List<FoodType> loadFoodType();
    
    void addFoodType(FoodType ft);
    
    int deleteFoodType(Integer ftId);

	FoodType selectById(Integer ftId);

	void updateFoodType(FoodType ft);
}
