/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/main")
public class MainController {

//	@Autowired
//	private MainService mainService;


//	// 未登录主页
//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public ModelAndView showHomeNoLogin(HttpServletRequest request, String query) {
//		ModelAndView mv = new ModelAndView("main/home");
//		return mv;
//	}

//	// 注册
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONObject register(User user) {
//		JSONObject jsonObject = new JSONObject();
//		String msg = mainService.register(user);
//		jsonObject.put("msg", msg);
//		return jsonObject;
//	}

//	// 注册页面
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	@ResponseBody
//	public ModelAndView showRegister(User user, String idcard) {
//		ModelAndView mv = new ModelAndView("user/register");
//		mv.addObject("idcard", idcard);
//		return mv;
//	}

//	// 主页
//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public ModelAndView showHome(HttpServletRequest request, String query) {
//		ModelAndView mv = new ModelAndView("front/index");
//		User user = CommandMethods.checkLogin(request);
//		if (user != null) {
//
//			mv.addObject("user", request.getSession().getAttribute("user"));
//		}
//		return mv;
//	}

//	// 登录页面
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public ModelAndView showLogin(String flag, HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("user/login");
//
//		if (CommandMethods.checkLogin(request) == null) {
//			return mv;
//		} else {
//			if ("logout".equals(flag)) {
//				request.getSession().removeAttribute("user");
//			}
//		}
//
//		return mv;
//	}

//	// 登录
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONObject login(String name, String pass, HttpServletRequest request) {
//		JSONObject jsonObject = new JSONObject();
//		String str = mainService.login(name, pass, request);
//		jsonObject.put("msg", str);
//		return jsonObject;
//	}

}
