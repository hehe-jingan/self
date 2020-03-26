/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.education.pojo.User;
import com.education.service.BookContentService;
import com.education.service.BookService;
import com.education.service.MainService;
import com.education.utils.CommandMethods;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/main")
public class MainController {

	@Autowired
	private MainService mainService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BookContentService bookContentService;
	
	// 书籍详情页面
	@RequestMapping(value = "/bookDetail/{bookId}", method = RequestMethod.GET)
	public ModelAndView showOnline(@PathVariable Integer bookId) {
		ModelAndView mv = new ModelAndView("admin/bookDetail");
		mv.addObject("bookContentList",bookContentService.getAllBookContent());
		mv.addObject("book", bookService.getBookById(bookId));
		return mv;
	}

	// 热门图书页面
	@RequestMapping(value = "/online", method = RequestMethod.GET)
	public ModelAndView showOnline() {
		ModelAndView mv = new ModelAndView("front/online");
		mv.addObject("lists", bookService.getAllHotBook());
		return mv;
	}

	// 关于我们页面
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView showContact() {
		ModelAndView mv = new ModelAndView("front/contact");
		return mv;
	}

	// 简介页面
	@RequestMapping(value = "/Introduction", method = RequestMethod.GET)
	public ModelAndView showIntroduction() {
		ModelAndView mv = new ModelAndView("front/Introduction");
		return mv;
	}

	// 关于我们页面
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView showAbout() {
		ModelAndView mv = new ModelAndView("front/about");
		return mv;
	}


	// 未登录主页
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView showHomeNoLogin(HttpServletRequest request, String query) {
		ModelAndView mv = new ModelAndView("main/home");
		return mv;
	}

	// 注册
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject register(User user) {
		JSONObject jsonObject = new JSONObject();
		String msg = mainService.register(user);
		jsonObject.put("msg", msg);
		return jsonObject;
	}

	// 注册页面
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showRegister(User user, String idcard) {
		ModelAndView mv = new ModelAndView("user/register");
		mv.addObject("idcard", idcard);
		return mv;
	}

	// 主页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView showHome(HttpServletRequest request, String query) {
		ModelAndView mv = new ModelAndView("front/index");
		User user = CommandMethods.checkLogin(request);
		if (user != null) {

			mv.addObject("user", request.getSession().getAttribute("user"));
		}
		return mv;
	}

	// 登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(String flag, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/login");

		if (CommandMethods.checkLogin(request) == null) {
			return mv;
		} else {
			if ("logout".equals(flag)) {
				request.getSession().removeAttribute("user");
			}
		}

		return mv;
	}

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(String name, String pass, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String str = mainService.login(name, pass, request);
		jsonObject.put("msg", str);
		return jsonObject;
	}

}
