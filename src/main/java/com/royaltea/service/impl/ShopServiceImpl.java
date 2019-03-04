package com.royaltea.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royaltea.dao.ShopMapper;
import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodType;
import com.royaltea.pojo.Order;
import com.royaltea.pojo.OrderInfo;
import com.royaltea.service.ShopService;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	private ShopMapper shopMapper;

    public ShopMapper getShopMapper() {
        return shopMapper;
    }
    @Autowired
    public void setShopMapper(ShopMapper shopMapper) {
        this.shopMapper = shopMapper;
    }
    
    @Override
	public List<Food> search(String name, HttpSession httpSession) {
		// TODO Auto-generated method stub
		List<Integer> listid = shopMapper.search(name);
		List<Food> list = new ArrayList<Food>();
		BigDecimal b = new BigDecimal("10.0");
		HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
		for(Integer fId : listid) {
			Food food = shopMapper.loadFoodById(fId);
			if(car!=null) {
				if(car.containsKey(fId)) {
					food.setNum(car.get(fId).getNum());			
				}
			}
			
			food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
			list.add(food);
		}
		return list;
	}
    
	@Override
	public List<Food> loadDc(HttpSession httpSession) {
		// TODO Auto-generated method stub
		List<Integer> listid = shopMapper.loadDc();
		List<Food> list = new ArrayList<Food>();
		BigDecimal b = new BigDecimal("10.0");
		HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
		for(Integer fId : listid) {
			Food food = shopMapper.loadFoodById(fId);
			if(car!=null) {
				if(car.containsKey(fId)) {
					food.setNum(car.get(fId).getNum());			
				}
			}
			
			food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
			list.add(food);
		}
		return list;
	}
	@Override
	public List<Food> loadHot(HttpSession httpSession) {
		// TODO Auto-generated method stub
		List<Food> list = shopMapper.loadHot();	
		HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
		BigDecimal b = new BigDecimal("10.0");
		for(Food food : list) {
			food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
			if(car!=null) {
				if(car.containsKey(food.getfId())) {
					food.setNum(car.get(food.getfId()).getNum());			
				}
			}
		}
		
		return list;
	}
	@Override
	public List<FoodType> loadShop(HttpSession httpSession) {
		// TODO Auto-generated method stub
		List<FoodType> ftlist = shopMapper.loadFt();
		for(FoodType ft : ftlist) {
			List<Integer> listid = shopMapper.loadFoodByType(ft.getFtId());
			List<Food> list = new ArrayList<Food>();
			HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
			BigDecimal b = new BigDecimal("10.0");
			for(Integer fId : listid) {
				Food food = shopMapper.loadFoodById(fId);
				if(car!=null) {
					if(car.containsKey(fId)) {
						food.setNum(car.get(fId).getNum());			
					}
				}
				food.setfDprice(food.getfPrice().multiply(food.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
				list.add(food);
			}
			ft.setfList(list);
		}
		return ftlist;
	}
	@Override
	public boolean isAvailable(Integer dId) {
		// TODO Auto-generated method stub
		Integer status = shopMapper.isStatus(dId);
		if(status==0) {
			return true;
		}
		Date time = shopMapper.getTime(dId);
		if (time==null) {
			return true;
		}
		Date now = new Date();
		if ((time.getTime()-now.getTime())>3600) {
			return true;
		}
		return false;
	}
	@Override
	public void addOrder(String oId, Integer dId, Integer oOut, BigDecimal ototal, BigDecimal odtotal,String oDec, List<Food> list) {
		// TODO Auto-generated method stub
		Order order = new Order();

		Date oTime = new Date();
		
		order.setoId(oId);
		order.setOdId(dId);
		order.setoOut(oOut);
		order.setoTotal(ototal);
		order.setoDtotal(odtotal);
		order.setoTime(oTime);
		order.setoDec(oDec);
		shopMapper.addOrder(order);
		
		for(Food food : list) {
			OrderInfo oInfo = new OrderInfo();
			oInfo.setoId(oId);
			oInfo.setfId(food.getfId());
			oInfo.setfNum(food.getNum());
			shopMapper.addOrderInfo(oInfo);
		}
	}
	
	@Override
	public List<Order> loadOrder(List<String> oIds) {
		// TODO Auto-generated method stub
		List<Order> list = new ArrayList<Order>();
		for(String oId : oIds) {
			Order order = shopMapper.loadOrder(oId);
			if(order == null) {
				continue;
			}
			list.add(order);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(list.toString());
        BigDecimal b = new BigDecimal("10.0");
		for(Order order : list) {
			List<OrderInfo> oiList = shopMapper.loadOi(order.getoId());
			for (OrderInfo oi : oiList) {
				oi.setfDprice(oi.getfPrice().multiply(oi.getfDc().divide(b, 2, BigDecimal.ROUND_DOWN)).setScale(1, BigDecimal.ROUND_DOWN));
				
			}
			order.setOiList(oiList);
			order.setoTimes(sdf.format(order.getoTime()));
			
		}
		return list;
	}

}
