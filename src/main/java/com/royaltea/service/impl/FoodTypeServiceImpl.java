package com.royaltea.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royaltea.dao.FoodTypeMapper;
import com.royaltea.pojo.FoodType;
import com.royaltea.service.FoodTypeService;

@Service("foodTypeService")
public class FoodTypeServiceImpl implements FoodTypeService{
	@Autowired
	private FoodTypeMapper ftMapper;
	
	@Override
	public List<FoodType> loadFoodType() {
		return ftMapper.queryAll();
	}

	@Override
	public void addFoodType(FoodType ft) {
		// TODO Auto-generated method stub
		ftMapper.add(ft);
	}
	
	@Override
	public int deleteFoodType(Integer ftId) {
		try {
			ftMapper.deleteById(ftId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	
	@Override
	public FoodType selectById(Integer ftId) {
		// TODO Auto-generated method stub
		FoodType ft =  ftMapper.selectById(ftId);
		
		return ft;
	}

	@Override
	public void updateFoodType(FoodType ft) {
		// TODO Auto-generated method stub
		ftMapper.update(ft);
		
	}
}
