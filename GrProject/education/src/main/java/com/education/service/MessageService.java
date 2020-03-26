package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.MessageMapper;
import com.education.pojo.Message;
import com.education.pojo.MessageExample;
import com.education.pojo.MessageExample.Criteria;


@Service
public class MessageService {
	
	@Autowired
	private MessageMapper dao;
	
	public String UserMessage = "%s %s通过。审核员：%s";
	public String UserUnMessage = "%s %s不通过。审核员：%s ，不通过原因：%s。";
	
	public String AdminMessage = "%s 您有新的文章需要审核。标题：%s 。";
	
	
	//设置为已读
	public String setMessageRead(Integer messageId){
		Message message = dao.selectByPrimaryKey(messageId);
		message.setMessflag("已读");
		int result = dao.updateByPrimaryKeySelective(message);
		return result==1?"SUCCESS":"ERROR";
	}
	
	
	
	//根据Id返回所有通知
	public List<Message> getAllList(Integer messId,String messType){
		List<Message> list = null;
		MessageExample example = new MessageExample();
		Criteria criteria = example.createCriteria();
		criteria.andMessidEqualTo(messId);
		criteria.andMesstypeEqualTo(messType);
		example.setOrderByClause("messFlag Desc,messageId Desc");
		list = dao.selectByExample(example);
		
		Message message= new Message();
		message.setMessflag("已读");
		dao.updateByExampleSelective(message, example);
		
		return list;
	}
	
	//统计未读通知数量
	public int countMessage(Integer messId,String messType){
		
		MessageExample example = new MessageExample();
		Criteria criteria = example.createCriteria();
		criteria.andMessidEqualTo(messId);
		criteria.andMesstypeEqualTo(messType);
		criteria.andMessflagEqualTo("未读");
		return dao.countByExample(example);
	}
	
	//新增消息
	public String insertMessage(String content,Integer messId,String type){
		
		Message message = new Message();
		message.setContent(content);
		message.setMessflag("未读");
		message.setMessid(messId);
		message.setMesstype(type);
		int result = dao.insertSelective(message);
		return result==1?"SUCCESS":"ERROR";
	}
	
	
}
