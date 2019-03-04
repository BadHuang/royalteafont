package com.royaltea.dao;

import java.math.BigDecimal;
import java.util.List;

import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodKey;

public interface FoodMapper {
	/**
	 * ��ѯ
	 */
	List<Food> queryAll();

	void add(Food f);

	Food selectById(Integer fId);

	void deleteById(Integer fId);

	void update(Food f);

	List<Food> queryKey(FoodKey foodKey);

	void updateStatus(Integer foodId, Integer status);

	void updateDc(Integer fId, BigDecimal fDc);

}
