/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.education.pojo.Evaluation;
import com.education.pojo.Supervisor;
import com.education.service.EvaItemService;
import com.education.service.EvaluationService;
import com.education.service.SupervisorService;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/supervisor")
public class SupervisorController {

	@Autowired
	private SupervisorService superService;

	@Autowired
	private EvaluationService elService;

	@Autowired
	private EvaItemService evaItemService;

	// 课程评价统计列表页面
	@RequestMapping(value = "/evaSummary", method = RequestMethod.GET)
	public ModelAndView showEvaluationByValList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/evaluate/evaSummaryList");
		List<Evaluation> evLists = elService.getAllEvaByGroupBy(new ArrayList<>(Arrays.asList("t.indexId ", " co.indexId")));
		List<Evaluation> list2 = elService.getAllEvaByGroupBy(new ArrayList<>(Arrays.asList("t.indexId ", " cl.indexId")));
		List<Evaluation> listT = elService.getAllEvaByGroupBy(new ArrayList<>(Arrays.asList("t.indexId ")));

		mv.addObject("evLists", evLists);
		mv.addObject("list2", list2);
		mv.addObject("listT", listT);
		return mv;
	}

	// 课程评价列表页面
	@RequestMapping(value = "/evaluationList", method = RequestMethod.GET)
	public ModelAndView showEvaluationList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/evaluate/evaluateList");
		List<Evaluation> evLists = elService.getAllEvalations();
		mv.addObject("evaItem", evaItemService.getAllEvaItem());

		mv.addObject("evLists", evLists);
		return mv;
	}

	// // 课程页面
	// @RequestMapping(value = "/courseList", method = RequestMethod.GET)
	// public ModelAndView showCourseList(HttpServletRequest request) {
	// ModelAndView mv = new ModelAndView("teacher/course/courseList");
	// if (request.getSession().getAttribute("teacher") == null) {
	// return mv;
	// }
	// Teacher tea = (Teacher) request.getSession().getAttribute("teacher");
	// mv.addObject("courseList", classArrangeService.getCourseByTeacherId(tea));
	// return mv;
	// }

	// 个人信息页面
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public ModelAndView showMyInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/myInfo");
		Supervisor superv = (Supervisor) request.getSession().getAttribute("supervisor");
		if (superv == null) {
			mv.addObject("userInfo", null);
			return mv;
		}
		else {
			mv.addObject("userInfo", superService.getSupervisorById(superv.getIndexid()));
			return mv;
		}
	}

	// 修改密码
	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject changePass(HttpServletRequest request, String newPass, String oldPass) {
		JSONObject jsonObject = new JSONObject();
		String msg = "error";
		Supervisor superv = (Supervisor) request.getSession().getAttribute("supervisor");
		if (superv == null) {
			msg = "用户未登录！";
		}
		else {
			msg = superService.changePass(superv, newPass, oldPass, request);
		}
		jsonObject.put("msg", msg);

		return jsonObject;
	}

	// 修改密码页面
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public ModelAndView showChangePass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/forgetPass");
		return mv;
	}

	// 主页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("supervisor/index");

		return mv;
	}

	// 督导登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(String flag, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/login");

		if (request.getSession().getAttribute("supervisor") == null) {
			return mv;
		}
		else {
			if ("logout".equals(flag)) {
				request.getSession().removeAttribute("supervisor");
			}
		}

		return mv;
	}

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(String name, String pass, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String str = superService.login(name, pass, request);
		jsonObject.put("msg", str);
		return jsonObject;
	}

}
