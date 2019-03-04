package com.royaltea.service;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodKey;

public interface FoodService {
	/**
     * ����ȫ����person
     * @return
     */
    List<Food> loadFood();

	void addFood(HttpServletRequest request, Food food, MultipartFile file);


	int deleteFood(Integer foodId);

	Food selectById(Integer foodId);
	
	void updateFood1(Food food);

	void updateFood(HttpServletRequest request, Food food, MultipartFile file);

	List<Food> searchFood(FoodKey foodKey);

	int updateStatus(Integer fId, Integer status);

	void updateDc(Integer fId, BigDecimal fDc);

}
