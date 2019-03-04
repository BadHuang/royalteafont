package com.royaltea.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.royaltea.dao.DeskMapper;
import com.royaltea.pojo.Desk;
import com.royaltea.service.DeskService;

@Service("fdeskService")
public class DeskServiceImpl implements DeskService{
	@Autowired
	private DeskMapper dMapper;
	
	@Override
	public List<Desk> loadDesk() {
		return dMapper.queryAll();
	}

	@Override
	public void addDesk(Desk d) {
		// TODO Auto-generated method stub
		dMapper.add(d);
	}
	
	@Override
	public int deleteDesk(Integer dId) {
		try {
			List<String> list = dMapper.selectOrdersId(dId);
			for (String oId : list) {
				dMapper.deleteByOid(oId);
			}
			dMapper.deleteOrderById(dId);
			dMapper.deleteById(dId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		return 1 ;
	}
	

	@Override
	public Desk selectById(Integer dId) {
		// TODO Auto-generated method stub
		Desk d =  dMapper.selectById(dId);
		
		return d;
	}

	@Override
	public void updateDesk(Desk d) {
		// TODO Auto-generated method stub
		dMapper.update(d);
		
	}
	
	@Override
	public void deletePlan(Integer dId) {
		// TODO Auto-generated method stub
		dMapper.deletePlanById(dId);
		
	}
}
