/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.education.pojo.EvaItem;
import com.education.pojo.Evaluation;
import com.education.pojo.Teacher;
import com.education.service.ClassesCourseArrangeService;
import com.education.service.ClassesService;
import com.education.service.EvaItemService;
import com.education.service.EvaluationService;
import com.education.service.TeacherService;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {


	@Autowired
	private TeacherService teacherService;

	@Autowired
	private ClassesCourseArrangeService classArrangeService;

	@Autowired
	private EvaluationService elService;
	
	@Autowired
	private ClassesService classesService;
	

	@Autowired
	private EvaItemService evaItemService;
	// 课程页面
	@RequestMapping(value = "/classList", method = RequestMethod.GET)
	public ModelAndView showClassesList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("teacher/classes/classesList");
		if (request.getSession().getAttribute("teacher") == null) {
			return mv;
		}
		Teacher tea = (Teacher) request.getSession().getAttribute("teacher");
		mv.addObject("classesList", classesService.getClassesByTeacherId(tea.getIndexid()));
		return mv;
	}

	// 课程评价列表页面
	@RequestMapping(value = "/evaluationList", method = RequestMethod.GET)
	public ModelAndView showEvaluationList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("teacher/evaluate/evaluateList");
		if (request.getSession().getAttribute("teacher") == null) {
			mv.addObject("msg", "登录已过期，请重新登录！！");
			return mv;
		}
		Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
		mv.addObject("evaItem", evaItemService.getAllEvaItem());
		
		List<Evaluation> evLists = elService.getAllEvaluationByTeacherId(teacher.getIndexid());
		mv.addObject("evLists", evLists);
		return mv;
	}

	// 课程页面
	@RequestMapping(value = "/courseList", method = RequestMethod.GET)
	public ModelAndView showCourseList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("teacher/course/courseList");
		if (request.getSession().getAttribute("teacher") == null) {
			return mv;
		}
		Teacher tea = (Teacher) request.getSession().getAttribute("teacher");
		mv.addObject("courseList", classArrangeService.getCourseByTeacherId(tea));
		return mv;
	}

	// 个人信息页面
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public ModelAndView showAdminList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("teacher/myInfo");
		Teacher tea = (Teacher) request.getSession().getAttribute("teacher");
		if (tea == null) {
			mv.addObject("userInfo", null);
			return mv;
		} else {
			mv.addObject("userInfo", teacherService.getTeacherById(tea.getIndexid()));
			return mv;
		}
	}

	// 修改密码
	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject changePass(HttpServletRequest request, String newPass, String oldPass) {
		JSONObject jsonObject = new JSONObject();
		String msg = "error";
		Teacher tea = (Teacher) request.getSession().getAttribute("teacher");
		if (tea == null) {
			msg = "用户未登录！";
		} else {
			msg = teacherService.changePass(tea, newPass, oldPass, request);
		}
		jsonObject.put("msg", msg);

		return jsonObject;
	}

	// 修改密码页面
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public ModelAndView showChangePass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("teacher/forgetPass");
		return mv;
	}

	// 主页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("teacher/index");

		return mv;
	}

	// 教师登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(String flag, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("teacher/login");

		if (request.getSession().getAttribute("teacher") == null) {
			return mv;
		} else {
			if ("logout".equals(flag)) {
				request.getSession().removeAttribute("teacher");
			}
		}

		return mv;
	}

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(String name, String pass, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String str = teacherService.login(name, pass, request);
		jsonObject.put("msg", str);
		return jsonObject;
	}

}
