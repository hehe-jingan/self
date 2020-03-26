package com.education.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.BookContentMapper;
import com.education.pojo.BookContent;


@Service
public class BookContentService {

	@Autowired
	private BookContentMapper dao;
	
	
	//删除评论
	public String deleteContent(Integer contentId){
		int result = dao.deleteByPrimaryKey(contentId);
		return result==1?"SUCCESS":"删除失败，请刷新重试！！！";
	}
	
	
	//获取所有评论
	public List<HashMap<String, Object>> getAllBookContent(){
		return dao.getAllBookContent();
	}
	
	
	//评论
	public String addContent(Integer bookId,Integer userId,String val){
		BookContent content = new BookContent();
		content.setBookid(bookId);
		content.setUserid(userId);
		content.setContentval(val);
		content.setContentdate(new Date());
		int result = dao.insertSelective(content);
		return result==1?"SUCCESS":"评论失败，请刷新重试！！！";
	}
	
	
}
