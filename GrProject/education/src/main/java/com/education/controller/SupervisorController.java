/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "/evaSummary/{type}/{chooseYear}/{chooseCo}/{chooseCl}/{chooseTea}", method = RequestMethod.GET)
	public ModelAndView showEvaluationByValList(@PathVariable String type,@PathVariable String chooseYear,@PathVariable Integer chooseCo,@PathVariable Integer chooseCl,
			@PathVariable Integer chooseTea,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/evaluate/evaSummaryList");
		List<Evaluation> evLists = new ArrayList<Evaluation>();
		if("1".equals(type)) {
			evLists = elService.getAllEvaByGroupBy(
					new ArrayList<>(Arrays.asList("t.indexId ", " co.indexId", "cl.indexId", "e.year")),chooseYear,chooseCo,chooseCl,chooseTea);
		}else if("2".equals(type)) {
			evLists = elService.getAllEvaByGroupBy(
					new ArrayList<>(Arrays.asList("t.indexId ", "e.year")),chooseYear,chooseCo,chooseCl,chooseTea);
		}
		List<Evaluation> courseList = evLists.stream()
				.collect(Collectors.collectingAndThen(
						Collectors.toCollection(
								() -> new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getCoName))),
						ArrayList::new));
		List<Evaluation> classList = evLists.stream()
				.collect(Collectors.collectingAndThen(
						Collectors.toCollection(
								() -> new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getClName))),
						ArrayList::new));
		List<Evaluation> tesList = evLists.stream()
				.collect(Collectors.collectingAndThen(
						Collectors.toCollection(
								() -> new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getTname))),
						ArrayList::new));
		mv.addObject("courseLists", courseList.stream().map(Evaluation::getCourse).collect(Collectors.toList()));
		mv.addObject("chooseYear", chooseYear);
		mv.addObject("chooseCourse", chooseCo);
		mv.addObject("chooseCl", chooseCl);
		mv.addObject("chooseTea", chooseTea);
		mv.addObject("yearLists", evLists.stream().map(Evaluation::getYear).distinct().collect(Collectors.toList()));
		mv.addObject("classLists", classList.stream().map(Evaluation::getClasses).collect(Collectors.toList()));
		mv.addObject("teaLists", tesList.stream().map(Evaluation::getTeacher).collect(Collectors.toList()));

		mv.addObject("type", type);
		mv.addObject("evLists", evLists);
		
		return mv;
	}

	// 课程评价列表页面
	@RequestMapping(value = "/evaluationList/{chooseYear}/{chooseCourse}", method = RequestMethod.GET)
	public ModelAndView showEvaluationListByCount(@PathVariable String chooseYear, @PathVariable Integer chooseCourse,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("supervisor/evaluate/evaluateList");
		List<Evaluation> evLists = elService.getAllEvalationsByFilter(chooseYear, chooseCourse);
		List<Evaluation>courseList =  evLists.stream().collect(Collectors.collectingAndThen(
				Collectors.toCollection(()->new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getCoName))), ArrayList::new));
		mv.addObject("courseLists", courseList.stream().map(Evaluation::getCourse).collect(Collectors.toList()));
		mv.addObject("evaItem", evaItemService.getAllEvaItem());

		mv.addObject("yearLists", evLists.stream().map(Evaluation::getYear).distinct().collect(Collectors.toList()));
		mv.addObject("chooseYear", chooseYear);
		mv.addObject("chooseCourse", chooseCourse);
		mv.addObject("evLists", evLists);
		return mv;
	}

	// 课程评价列表页面
	@RequestMapping(value = "/evaluationList", method = RequestMethod.GET)
	public ModelAndView showEvaluationList(HttpServletRequest request) {
		String chooseYear = "all";
		Integer chooseCourse = 0;
		ModelAndView mv = new ModelAndView("supervisor/evaluate/evaluateList");
		List<Evaluation> evLists = elService.getAllEvalationsByFilter(chooseYear, chooseCourse);
		List<Evaluation>courseList =  evLists.stream().collect(Collectors.collectingAndThen(
				Collectors.toCollection(()->new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getCoName))), ArrayList::new));
		mv.addObject("courseLists", courseList.stream().map(Evaluation::getCourse).collect(Collectors.toList()));
		mv.addObject("evaItem", evaItemService.getAllEvaItem());
		mv.addObject("yearLists", evLists.stream().map(Evaluation::getYear).distinct().collect(Collectors.toList()));
		mv.addObject("chooseYear", chooseYear);
		mv.addObject("chooseCourse", chooseCourse);
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
		} else {
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
		} else {
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
		} else {
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
