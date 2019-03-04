package com.royaltea.service;

import java.util.List;

import com.royaltea.pojo.Desk;

public interface DeskService {
	/**
     * ����ȫ����person
     * @return
     */
    List<Desk> loadDesk();
    
    void addDesk(Desk d);
    
    int deleteDesk(Integer dId);

	Desk selectById(Integer dId);

	void updateDesk(Desk d);

	void deletePlan(Integer dId);
}
