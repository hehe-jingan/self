/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.UserMapper;
import com.education.pojo.User;
import com.education.pojo.UserExample;
import com.education.pojo.UserExample.Criteria;
import com.mysql.jdbc.StringUtils;

/**
 *
 *
 * @author joy_zheng
 * @since: v1.0
 */
@Service
public class MainService {
	
	@Autowired
	private UserMapper userDao;
//	@Autowired
//	private MessageMapper messDao;
	
	@Autowired
	private UserService userService;
	
	
	//注册
	public String register(User user){
		
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(user.getName());
		
		if(userDao.countByExample(example)!=0){
			return "用户名重复，请重新输入！";
		}
		
		UserExample example2 = new UserExample();
		Criteria criteria2 = example2.createCriteria();
		criteria2.andIdcardEqualTo(user.getIdcard());
		if(userDao.countByExample(example2)!=0){
			return "身份证已被注册，请重新输入！";
		}
		
		user.setInputdate(new Date());
		String certNo = userService.getNewCertId();
		user.setCertno(certNo);
		
		int result =  userDao.insertSelective(user);
		if(result == 1){
			return "success";
		}
		return "注册失败，请重试！！";
	}
	
	
	
	//登录
	public String login(String loginAccount,String loginPass,HttpServletRequest request){
		if(StringUtils.isNullOrEmpty(loginAccount)){
			return "用户名不能为空！";
		}
		if(StringUtils.isNullOrEmpty(loginPass)){
			return "密码不能为空！！";
		}
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(loginAccount);
		List<User> users = userDao.selectByExample(example);
		System.out.println("userSize="+users.size());
		if(users.size()!=1){
			return "用户名错误！！！";
		}
		
		if(!users.get(0).getPass().equals(loginPass)){
			return "密码错误！！！！";
		}
		
		User user = users.get(0);
		user.setLastlogindate(new Date());
		userDao.updateByPrimaryKeySelective(user);
		
		request.getSession().setAttribute("user", users.get(0));
		return "SUCCESS";
	}
	
	
	
}
