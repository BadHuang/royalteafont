package com.royaltea.dao;

import java.util.Date;
import java.util.List;

import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodType;
import com.royaltea.pojo.Order;
import com.royaltea.pojo.OrderInfo;

public interface ShopMapper {

	List<Integer> loadDc();
	
	Date getTime(Integer dId);
	
	List<Integer> loadFoodByType(Integer ftId);
	
	List<FoodType> loadFt();
	
	List<Food> loadHot();

	Integer isStatus(Integer dId);
	
	Food loadFoodById(Integer fId);

	List<Integer> search(String fName);

	void addOrder(Order order);

	void addOrderInfo(OrderInfo oInfo);
	
	List<OrderInfo> loadOi(String oId);

	Order loadOrder(String oId);

}
