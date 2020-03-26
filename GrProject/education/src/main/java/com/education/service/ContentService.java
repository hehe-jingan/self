package com.education.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.ContentMapper;
import com.education.pojo.Content;
import com.education.pojo.ContentExample;


@Service
public class ContentService {
	
	@Autowired
	private ContentMapper dao;
	
	//根据Id获取留言
	public Content getContentById(Integer contentId){
		return dao.selectByPrimaryKey(contentId);
	}
	
	//删除留言
	public String deleteContent(Integer contentId){
		int result = dao.deleteByPrimaryKey(contentId);
		return result == 1?"SUCCESS":"删除失败，请刷新重试！！";
	}
	
	
	//获取所有留言
	public List<Content> getAllContent(){
		ContentExample example = new ContentExample();
		example.setOrderByClause("inputDate desc");
		return dao.selectByExample(example);
	}
	
	//添加留言
	public String addMessage(String name,String mail,String title,String message){
		
		Content content = new Content();
		content.setName(name);
		content.setMail(mail);
		content.setTitle(title);
		content.setMessage(message);
		content.setInputdate(new Date());
		
		int result = dao.insertSelective(content);
		
		return result == 1?"SUCCESS":"留言失败，请刷新重试！！";
		
	}
	
	

}
