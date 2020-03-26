/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.UserMapper;
import com.education.pojo.User;
import com.education.pojo.UserExample;
import com.education.pojo.UserExample.Criteria;


/**
 *
 *
 * @author joy_zheng
 * @since: v1.0
 */
@Service
public class UserService {
	@Autowired
	private UserMapper userDao;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	//获取最新卡号
	public String getNewCertId() {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andCertnoLike(sdf.format(new Date())+"%");
		example.setOrderByClause("certNo desc");
		List<User> lists = userDao.selectByExample(example);
		if(lists==null||lists.size()==0) {
			return sdf.format(new Date())+"001";
		}else {
			User user = lists.get(0);
			String certNo = user.getCertno().replace(sdf.format(new Date()), "");
			String result = sdf.format(new Date())+String.format("%03d", Integer.parseInt(certNo)+1);
			return result;
		}
	}
	
	//新增用户
		public String addUser(String name,String idcard,String pass,String certNo,String age,String sex){
			UserExample example = new UserExample();
			Criteria criteria  = example.createCriteria();
			criteria.andNameEqualTo(name);
			int result = userDao.countByExample(example);
			if(result>0){
				return "用户名已存在，请使用其他用户名！！";
			}
			UserExample example2 = new UserExample();
			Criteria criteria2 = example2.createCriteria();
			criteria2.andCertnoEqualTo(certNo);
			result = userDao.countByExample(example2);
			if(result>0) {
				return "图书卡号已被使用，请重新提交！！";
			}
			UserExample example3 = new UserExample();
			Criteria criteria3 = example3.createCriteria();
			criteria3.andIdcardEqualTo(idcard);
			result = userDao.countByExample(example3);
			if(result>0) {
				return "该身份证已存在，请使用其他身份证！！";
			}
			
			
			User user = new User();
			user.setName(name);
			user.setPass(pass);
			user.setIdcard(idcard);
			user.setCertno(certNo);
			user.setAge(age);
			user.setSex(sex);
			user.setInputdate(new Date());
			result = userDao.insertSelective(user);
			
			return result==1?"SUCCESS":"新增失败，请联系管理员!!";
		}
	
	//修改密码
	public String  changePass(User user,String newPass,String oldPass,HttpServletRequest request){
		
		if(!oldPass.equals(user.getPass())){
			return "旧密码错误，请重试！";
		}
		
		user.setPass(newPass);
		int result =  userDao.updateByPrimaryKeySelective(user);
		
		if(result == 1){
			request.getSession().setAttribute("user", userDao.selectByPrimaryKey(user.getId()));
			return "success";
		}
		return "修改密码失败，请重试";
		
	}
	
	
	
	
	
	
}
