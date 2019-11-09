package com.royaltea.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodType;
import com.royaltea.pojo.Order;
import com.royaltea.service.FoodService;
import com.royaltea.service.FoodTypeService;
import com.royaltea.service.ShopService;
import com.sun.xml.internal.xsom.impl.scd.Iterators.Map;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;
    
    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/shop",method=RequestMethod.GET)
    public String pageList(ModelMap map,Integer dId, HttpSession httpSession){
    	
    	//把桌号放进session中
//    	httpSession.removeAttribute("dId");
    	httpSession.setAttribute("dId", dId);
    	//判断桌子是否在预定时间前一个小时
    	if (dId==null) {
    		map.addAttribute("error","无效的餐桌号");
    		return "shop";
    	}
    	
    	if (!shopService.isAvailable(dId)) {
    		map.addAttribute("error","该餐桌已失效或处于预订状态，请选择其他餐桌");
    		return "shop";
    	}
    	
//    	httpSession.removeAttribute("car");
//    	httpSession.removeAttribute("total");
//    	httpSession.removeAttribute("oIds");
//    	httpSession.removeAttribute("fkey");
    	
    	
    	//优惠
    	List<Food> shopDc = shopService.loadDc(httpSession);
    	map.addAttribute("dcInfo", shopDc);
    	
    	//热销(前五）
    	List<Food> shopHot = shopService.loadHot(httpSession);
    	map.addAttribute("hotInfo", shopHot);
    	
    	//类型加食物
        List<FoodType> shopList = shopService.loadShop(httpSession);
        map.addAttribute("shopInfo", shopList);
        return "shop";
    }
    
    @RequestMapping(value="/search",method=RequestMethod.GET)
    public String searchList(ModelMap map,String name, HttpSession httpSession){
    	//搜索
    	List<Food> fList = shopService.search(name, httpSession);
    	map.addAttribute("fList", fList);
    	httpSession.setAttribute("fkey", name);
        return "search";
    }
    
    @RequestMapping(value="/car",method=RequestMethod.GET)
    public String carList(ModelMap map, HttpSession httpSession){
    	//优惠
    	List<Food> shopDc = shopService.loadDc(httpSession);
    	map.addAttribute("dcInfo", shopDc);
    	
    	//热销(前五）
    	List<Food> shopHot = shopService.loadHot(httpSession);
    	map.addAttribute("hotInfo", shopHot);
    	
    	//类型加食物
        List<FoodType> shopList = shopService.loadShop(httpSession);
        map.addAttribute("shopInfo", shopList);
    	
    	HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
    	if (car==null) {
    		map.addAttribute("error","购物车为空，请先选择商品！");
    		return "shop";
    	}
    	List<Food> list = new ArrayList<Food>(car.values());
    	map.addAttribute("carInfo", list);
    	String total = (String) httpSession.getAttribute("total");
    	String[] totals = total.split(",");
    	map.addAttribute("cartotal",totals[0]);
    	map.addAttribute("cardtotal",totals[1]);
        return "shop";
    }
    
    @RequestMapping(value="/search-car",method=RequestMethod.GET)
    public String scarList(ModelMap map, HttpSession httpSession){
    	
    	String name = (String)httpSession.getAttribute("fkey");
    	//搜索
    	List<Food> fList = shopService.search(name, httpSession);
    	map.addAttribute("fList", fList);
    	
    	HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
    	if (car==null) {
    		map.addAttribute("error","购物车为空，请先选择商品！");
    		return "shop";
    	}
    	List<Food> list = new ArrayList<Food>(car.values());
    	map.addAttribute("carInfo", list);
    	String total = (String) httpSession.getAttribute("total");
    	String[] totals = total.split(",");
    	map.addAttribute("cartotal",totals[0]);
    	map.addAttribute("cardtotal",totals[1]);
        return "search";
    }
    
    @RequestMapping(value="/clear",method=RequestMethod.GET)
    public String clearList(ModelMap map, HttpSession httpSession){
    	
    	HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
    	if (car==null) {
    		map.addAttribute("error","购物车为空，请先选择商品！");
    		return "shop";
    	}
    	List<Food> list = new ArrayList<Food>(car.values());
    	map.addAttribute("orderInfo", list);
    	String total = (String) httpSession.getAttribute("total");
    	String[] totals = total.split(",");
    	map.addAttribute("cartotal",totals[0]);
    	map.addAttribute("cardtotal",totals[1]);
        return "clear";
    }
    
    @RequestMapping(value="/car-add",method=RequestMethod.POST)
    @ResponseBody
    public String carAdd(Food food,HttpSession httpSession){
    	HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
    	if(car==null) {
    		HashMap<Integer, Food> newcar = new HashMap<Integer,Food>();
    		newcar.put(food.getfId(), food);
    		httpSession.setAttribute("car", newcar);
    	}else {
    		if(car.containsKey(food.getfId())) {
    			Food f = car.get(food.getfId());
    			f.setNum(food.getNum());
    		}else {
    			car.put(food.getfId(), food);
    		}
    		httpSession.setAttribute("car", car);
    	}
    	
    	String total = (String) httpSession.getAttribute("total");
    	if(total==null) {
    		String newtotal = food.getfPrice()+","+food.getfDprice();
    		httpSession.setAttribute("total", newtotal);
    		return newtotal;
    	}else {
    		String[] totals = total.split(",");
    		BigDecimal price = (new BigDecimal(totals[0])).add(food.getfPrice());
    		BigDecimal dprice = (new BigDecimal(totals[1])).add(food.getfDprice());
    		String newtotal = price.toString()+","+dprice.toString();
    		httpSession.setAttribute("total", newtotal);
    		return newtotal;
    	}
    }
    
    @RequestMapping(value="/car-jian",method=RequestMethod.POST)
    @ResponseBody
    public String carJian(Food food, HttpSession httpSession){
    	HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
    	if(car==null) {
    		HashMap<Integer, Food> newcar = new HashMap<Integer,Food>();
    		newcar.put(food.getfId(), food);
    		httpSession.setAttribute("car", newcar);
    	}else {
    		if(food.getNum()==0) {
    			car.remove(food.getfId());
    		}else {
    			Food f = car.get(food.getfId());
    			f.setNum(food.getNum());
    		}
    		httpSession.setAttribute("car", car);
    	}
    	
    	String total = (String) httpSession.getAttribute("total");
		String[] totals = total.split(",");
		BigDecimal price = (new BigDecimal(totals[0])).subtract(food.getfPrice());
		BigDecimal dprice = (new BigDecimal(totals[1])).subtract(food.getfDprice());
		if(price.toString().equals("0.0")||dprice.toString().equals("0.0")) {
			httpSession.setAttribute("car",null);
		}
		String newtotal = price.toString()+","+dprice.toString();
		httpSession.setAttribute("total", newtotal);
		return newtotal;
    	
    }
    
    @RequestMapping(value="/order-add",method=RequestMethod.POST)
    @ResponseBody
    public String orderAdd(Integer oOut, String oDec, HttpSession httpSession){
    	Integer dId = (Integer)httpSession.getAttribute("dId");
    	HashMap<Integer, Food> car = (HashMap<Integer, Food>) httpSession.getAttribute("car");
    	List<Food> list = new ArrayList<Food>(car.values());
    	String total = (String) httpSession.getAttribute("total");
    	String[] totals = total.split(",");
    	BigDecimal odtotal = new BigDecimal(totals[1]);
    	BigDecimal ototal = new BigDecimal(totals[0]);
    	
    	Random random = new Random();
    	String oId="";
		for (int i=0;i<8;i++){
			oId+=random.nextInt(10);
		}
		ArrayList<String> oIds = (ArrayList<String>)httpSession.getAttribute("oIds");
		if(oIds==null) {
			ArrayList<String> newoIds = new ArrayList<String>();
			newoIds.add(oId);
			httpSession.setAttribute("oIds", newoIds);
		}else {
			oIds.add(oId);
			httpSession.setAttribute("oIds", oIds);
		}
    	shopService.addOrder(oId, dId, oOut, ototal, odtotal, oDec, list);
    	httpSession.removeAttribute("car");
    	httpSession.removeAttribute("total");
    	httpSession.removeAttribute("fkey");
    	return "true";
    }
    
    @RequestMapping(value="/order",method=RequestMethod.GET)
    public String orderList(ModelMap map, HttpSession httpSession){
    	
    	List<String> oIds = (List<String>)httpSession.getAttribute("oIds");
    	if(oIds == null) {
    		map.addAttribute("error","请下单后再查看我的订单！");
    		//优惠
//        	List<Food> shopDc = shopService.loadDc(httpSession);
//        	map.addAttribute("dcInfo", shopDc);
//        	
//        	//热销(前五）
//        	List<Food> shopHot = shopService.loadHot(httpSession);
//        	map.addAttribute("hotInfo", shopHot);
//        	
//        	//类型加食物
//            List<FoodType> shopList = shopService.loadShop(httpSession);
//            map.addAttribute("shopInfo", shopList);
    		return "shop";
    	}
    	
    	//我的订单
    	List<Order> orders = shopService.loadOrder(oIds);
    	map.addAttribute("orders", orders);
        return "order";
    }
   
}
