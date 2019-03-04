package com.royaltea.service;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodType;
import com.royaltea.pojo.Order;

public interface ShopService {
	List<Food> loadDc(HttpSession httpSession);
	
	List<Food> loadHot(HttpSession httpSession);
	
	List<FoodType> loadShop(HttpSession httpSession);
	
	boolean isAvailable(Integer dId);

	List<Food> search(String name, HttpSession httpSession);

	void addOrder(String oId, Integer dId, Integer oOut, BigDecimal ototal, BigDecimal odtotal, String oDec, List<Food> list);

	List<Order> loadOrder(List<String> oIds);
}
