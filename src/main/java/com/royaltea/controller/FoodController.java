package com.royaltea.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.royaltea.pojo.Food;
import com.royaltea.pojo.FoodKey;
import com.royaltea.service.FoodService;
import com.royaltea.service.FoodTypeService;

@Controller
public class FoodController {
	@Autowired
	private FoodService foodService;
    
	@Autowired
	private FoodTypeService foodtypeService;

    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/food",method=RequestMethod.GET)
    public String pageList(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,HttpSession htttpSession){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        FoodKey foodKey = (FoodKey)htttpSession.getAttribute("foodKey");
        List<Food> foodList;
        if (foodKey == null){
        	foodList = foodService.loadFood();//��ȡ�����û���Ϣ
        }else {
        	foodList = foodService.searchFood(foodKey);//��ȡ�����û���Ϣ
        }
        
        PageInfo<Food> pageInfo=new PageInfo<Food>(foodList);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("foodtypeInfo", foodtypeService.loadFoodType());
        return "food";
    }
    
    @RequestMapping(value="/food-add",method=RequestMethod.POST)
    public String foodAdd(@RequestParam("img") MultipartFile files, HttpServletRequest request, ModelMap map,Food food){
    	
    	foodService.addFood(request, food, files);
		
        return "redirect:food";
    }
    
    @RequestMapping(value="/status-update",method=RequestMethod.POST)
    @ResponseBody
    public String foodDelete(Integer fId, Integer status){
    	int i = foodService.updateStatus(fId,status);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/food-delete",method=RequestMethod.POST)
    @ResponseBody
    public String foodDelete(Integer fId){
    	int i = foodService.deleteFood(fId);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/food-update",method=RequestMethod.GET)
    public String foodUpdate(ModelMap map,Integer fId,Integer pageNo,HttpSession htttpSession){
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        FoodKey foodKey = (FoodKey)htttpSession.getAttribute("foodKey");
        List<Food> foodList;
        if (foodKey == null){
        	foodList = foodService.loadFood();//��ȡ�����û���Ϣ
        }else {
        	foodList = foodService.searchFood(foodKey);//��ȡ�����û���Ϣ
        }
        PageInfo<Food> pageInfo=new PageInfo<Food>(foodList);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("foodtypeInfo", foodtypeService.loadFoodType());
    	Food updateInfo = foodService.selectById(fId);
    	map.addAttribute("updateInfo", updateInfo);
        return "food";
    }
    @RequestMapping(value="/food-updateDc",method=RequestMethod.GET)
    public String foodUpdateDc(ModelMap map,Integer fId,Integer pageNo,HttpSession htttpSession){
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        FoodKey foodKey = (FoodKey)htttpSession.getAttribute("foodKey");
        List<Food> foodList;
        if (foodKey == null){
        	foodList = foodService.loadFood();//��ȡ�����û���Ϣ
        }else {
        	foodList = foodService.searchFood(foodKey);//��ȡ�����û���Ϣ
        }
        PageInfo<Food> pageInfo=new PageInfo<Food>(foodList);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("foodtypeInfo", foodtypeService.loadFoodType());
    	Food dcInfo = foodService.selectById(fId);
    	map.addAttribute("dcInfo", dcInfo);
        return "food";
    }
    
    @RequestMapping(value="/food-update1",method=RequestMethod.POST)
    public String foodUpdate1(@RequestParam("img") MultipartFile files, HttpServletRequest request, ModelMap map,Food food){
    	
    	foodService.updateFood(request, food, files);
		
        return "redirect:food";
    }
    @RequestMapping(value="/food-updateDc1",method=RequestMethod.POST)
    public String foodUpdateDc1(Integer fId,BigDecimal fDc){
    	
    	foodService.updateDc(fId, fDc);
		
        return "redirect:food";
    }
    
    
    @RequestMapping(value="/food-search",method=RequestMethod.GET)
    public String foodSearch(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,FoodKey foodKey,HttpSession httpSession){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<Food> foodList = foodService.searchFood(foodKey);//��ȡ�����û���Ϣ
        PageInfo<Food> pageInfo=new PageInfo<Food>(foodList);
        httpSession.setAttribute("foodKey", foodKey);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("foodtypeInfo", foodtypeService.loadFoodType());
        return "food";
    }
    
   
}
