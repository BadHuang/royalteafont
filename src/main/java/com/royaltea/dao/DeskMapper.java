package com.royaltea.dao;

import java.util.List;

import com.royaltea.pojo.Desk;

public interface DeskMapper {
	
	List<Desk> queryAll();
	
	void add(Desk d);
	
	void deleteById(Integer dId);

	Desk selectById(Integer dId);

	void update(Desk d);

	void deletePlanById(Integer dId);

	List<String> selectOrdersId(Integer dId);

	void deleteByOid(String oId);

	void deleteOrderById(Integer dId);

}
