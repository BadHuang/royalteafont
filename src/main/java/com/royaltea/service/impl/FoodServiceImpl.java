package com.royaltea.service.impl;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.druid.sql.visitor.functions.Length;
import com.royaltea.dao.FoodMapper;
import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodKey;
import com.royaltea.service.FoodService;

@Service("foodService")
public class FoodServiceImpl implements FoodService {
	
	private FoodMapper foodMapper;

    public FoodMapper getFoodMapper() {
        return foodMapper;
    }
    @Autowired
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }
	@Override
	public List<Food> loadFood() {
		// TODO Auto-generated method stub
		
		List<Food> list = foodMapper.queryAll();

        BigDecimal b = new BigDecimal("10.0");
		for (Food food : list) {
			food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
			String dec = food.getfDec();
			if(dec != null) {
				if(dec.length()>20) {
					String newString = food.getfDec().substring(0, 20);
					newString = newString + "...";
					food.setfDec(newString);
				}
			}
		}
		return list;
	}
	@Override
	public void addFood(HttpServletRequest request, Food food, MultipartFile file) {
		// TODO Auto-generated method stub
		if (file.getSize()>= 1) {
            try {
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
                // )
            	String fileName = (int)(1+Math.random()*(10-1+1)) +file.getOriginalFilename();
                String filePath = request.getSession().getServletContext()
                        .getRealPath("/")
                        + "upload/" + fileName;
                System.out.println(filePath);
                File saveDir = new File(filePath);
                if (!saveDir.getParentFile().exists())
                    saveDir.getParentFile().mkdirs();

                // 转存文件
                file.transferTo(saveDir);
                food.setfImg(fileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		foodMapper.add(food);
	}
	
	@Override
	public int updateStatus (Integer foodId, Integer status) {
		try {
			foodMapper.updateStatus(foodId,status);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	
	@Override
	public int deleteFood(Integer foodId) {
		try {
			foodMapper.deleteById(foodId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	@Override
	public Food selectById(Integer foodId) {
		// TODO Auto-generated method stub
		Food food =  foodMapper.selectById(foodId);
		BigDecimal b = new BigDecimal("10.0");
		food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
		return food;
	}
	
	@Override
	public void updateFood1(Food food) {
		// TODO Auto-generated method stub
		foodMapper.update(food);
	}
	@Override
	public void updateDc(Integer fId, BigDecimal fDc) {
		// TODO Auto-generated method stub
		foodMapper.updateDc(fId, fDc);
	}
	
	@Override
	public void updateFood(HttpServletRequest request, Food food, MultipartFile file) {
		// TODO Auto-generated method stub
		if (file.getSize()>= 1) {
            try {
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
                // )
            	String fileName = (int)(1+Math.random()*(10-1+1)) +file.getOriginalFilename();
                String filePath = request.getSession().getServletContext()
                        .getRealPath("/")
                        + "upload/" + fileName;
                System.out.println(filePath);
                File saveDir = new File(filePath);
                if (!saveDir.getParentFile().exists())
                    saveDir.getParentFile().mkdirs();

                // 转存文件
                file.transferTo(saveDir);
                food.setfImg(fileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		foodMapper.update(food);
	}
	@Override
	public List<Food> searchFood(FoodKey foodKey) {
		// TODO Auto-generated method stub
		
		List<Food> list = foodMapper.queryKey(foodKey);
		BigDecimal b = new BigDecimal("10.0");
		for (Food food : list) {
			food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
			String dec = food.getfDec();
			if(dec != null) {
				if(dec.length()>20) {
					String newString = food.getfDec().substring(0, 20);
					newString = newString + "...";
					food.setfDec(newString);
				}
			}
		}
		return list;
	}
	
	

}
