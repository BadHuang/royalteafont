package com.royaltea.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.royaltea.pojo.FoodType;
import com.royaltea.service.FoodTypeService;

@Controller
public class FoodTypeController {
	
	@Autowired
	private FoodTypeService foodtypeService;
    

    /**
     * ��ҳ��ѯ
     */
    @RequestMapping(value="/foodtype",method=RequestMethod.GET)
    public String pageList(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<FoodType> foodtypeList = foodtypeService.loadFoodType();//��ȡ�����û���Ϣ
        PageInfo<FoodType> pageInfo=new PageInfo<FoodType>(foodtypeList);
        map.addAttribute("pageInfo", pageInfo);return "/foodtype";
    }
    
    @RequestMapping(value="/foodtype-add",method=RequestMethod.POST)
    public String pageList(ModelMap map,FoodType foodtype){
    	try {
			foodtypeService.addFoodType(foodtype);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "redirect:/foodtype";
    }
    
    @RequestMapping(value="/foodtype-delete",method=RequestMethod.POST)
    @ResponseBody
    public String foodtypeDelete(Integer ftId){
    	int i = foodtypeService.deleteFoodType(ftId);
    	if(i!=1)
    		return "false";
        return "true";
    }
    
    @RequestMapping(value="/foodtype-update",method=RequestMethod.GET)
    public String foodtypeUpdate(ModelMap map,Integer ftId,Integer pageNo){
    	Integer pageSize=5;//ÿҳ��ʾ��¼��
        //��ҳ��ѯ
        PageHelper.startPage(pageNo, pageSize);
        List<FoodType> foodtypeList = foodtypeService.loadFoodType();//��ȡ�����û���Ϣ
        PageInfo<FoodType> pageInfo=new PageInfo<FoodType>(foodtypeList);
        map.addAttribute("pageInfo", pageInfo);
    	FoodType updateInfo = foodtypeService.selectById(ftId);
    	map.addAttribute("updateInfo", updateInfo);
        return "foodtype";
    }
    
    @RequestMapping(value="/foodtype-update1",method=RequestMethod.POST)
    public String empUpdate1(FoodType foodtype){
    	
    	foodtypeService.updateFoodType(foodtype);
		
        return "redirect:foodtype";
    }
}
