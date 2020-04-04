package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.EvaItemMapper;
import com.education.pojo.EvaItem;
import com.education.pojo.EvaItemExample;

@Service
public class EvaItemService {

	@Autowired
	private EvaItemMapper dao;
	
	
	//获取所有分项
	public List<EvaItem> getAllEvaItem() {
		return dao.selectByExample(new EvaItemExample());
	}
	
	//修改分项
	public String editEvaItem(String[]ids,String[] content) {
		for (int i=0;i<ids.length;i++) {
			String id = ids[i];
			EvaItem evaItem = new EvaItem();
			evaItem.setIndexid(Integer.parseInt(id));
			evaItem.setIname(content[i]);
			dao.updateByPrimaryKeySelective(evaItem);
		}
		return "SUCCESS";
	}
	
	
}
