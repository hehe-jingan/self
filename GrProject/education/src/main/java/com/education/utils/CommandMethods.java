/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.utils;

import javax.servlet.http.HttpServletRequest;

import com.education.pojo.User;


/**
 *
 *
 * @author joy_zheng
 * @since: v1.0
 */
public class CommandMethods {
	
	
	//检测是否登录
	public static User checkLogin(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		return user;
	}
}
