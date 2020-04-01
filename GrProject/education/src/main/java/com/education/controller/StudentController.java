/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import java.util.ArrayList;
import java.util.List;
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
import com.education.pojo.Student;
import com.education.service.ClassesCourseArrangeService;
import com.education.service.CourseArrangeService;
import com.education.service.EvaItemService;
import com.education.service.EvaluationService;
import com.education.service.StudentService;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/student")
public class StudentController {


	@Autowired
	private StudentService studentService;

	@Autowired
	private CourseArrangeService courseArrangeService;

	@Autowired
	private ClassesCourseArrangeService classArrangeService;
	
	@Autowired
	private EvaItemService evaItemService;
	
	@Autowired
	private EvaluationService elService;

	//课程评价列表页面
	@RequestMapping(value="/evaluationList",method=RequestMethod.GET)
	public ModelAndView showEvaluationList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("student/evaluate/evaluateList");
		if(request.getSession().getAttribute("student")==null) {
			mv.addObject("msg", "登录已过期，请重新登录！！");
			return mv;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		List<Evaluation> evLists = elService.getAllEvalationsByStudentId(student.getIndexid());
		mv.addObject("evLists", evLists);
		return mv;
	}
	
	//课程评价
	@RequestMapping(value="/studentEvaluate",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject studentEvaluate(Evaluation evaluation,HttpServletRequest request,String[] scores) {
		JSONObject jsonObject = new JSONObject();
		if(request.getSession().getAttribute("student")==null) {
			jsonObject.put("msg", "登录已过期，请重新登录！！");
			return jsonObject;
		}
		Student student = (Student)request.getSession().getAttribute("student");
		StringBuffer sc = new StringBuffer();
		for (String string : scores) {
			sc.append(string);
		}
		evaluation.setSpare1(sc.toString());
		evaluation.setSid(student.getIndexid());
		jsonObject.put("msg", elService.addNewEvaluation(evaluation, student.getName()));
		return jsonObject;
	}
	
	//课程评价页面
	@RequestMapping(value="/studentEvaluate/{coaId}",method=RequestMethod.GET)
	public ModelAndView showEvaluate(@PathVariable Integer coaId) {
		ModelAndView mv = new ModelAndView("student/evaluate/studentEvaluate");
		mv.addObject("evaItemLists", evaItemService.getAllEvaItem());
		mv.addObject("courseArrange",courseArrangeService.getCourseArrangeById(coaId));
		
		return mv;
		
	}
	
	
	//课程页面
	@RequestMapping(value="/courseList",method=RequestMethod.GET)
	public ModelAndView showCourseList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("student/course/courseList");
		
		if (request.getSession().getAttribute("student") == null) {
			return mv;
		}
		
		Student stu = (Student) request.getSession().getAttribute("student");
		mv.addObject("courseList", classArrangeService.getCoursesByStudentId(stu));
		return mv;
	}
	
	
	
	// 个人信息页面
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public ModelAndView showAdminList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("student/myInfo");
		Student stu = (Student) request.getSession().getAttribute("student");
		if (stu == null) {
			mv.addObject("userInfo", null);
			return mv;
		} else {
			mv.addObject("userInfo", studentService.getStudentById(stu.getIndexid()));
			return mv;
		}
	}

	// 修改密码
	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject changePass(HttpServletRequest request, String newPass, String oldPass) {
		JSONObject jsonObject = new JSONObject();

		String msg = "error";
		Student stu = (Student) request.getSession().getAttribute("student");
		if (stu == null) {
			msg = "用户未登录！";
		} else {
			msg = studentService.changePass(stu, newPass, oldPass, request);
		}
		jsonObject.put("msg", msg);

		return jsonObject;
	}

	// 修改密码页面
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public ModelAndView showChangePass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("student/forgetPass");
		return mv;
	}

	// 主页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("student/index");

		return mv;
	}

	// 学生登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(String flag, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("student/login");

		if (request.getSession().getAttribute("student") == null) {
			return mv;
		} else {
			if ("logout".equals(flag)) {
				request.getSession().removeAttribute("student");
			}
		}

		return mv;
	}

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(String name, String pass, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String str = studentService.login(name, pass, request);
		jsonObject.put("msg", str);
		return jsonObject;
	}
	
	
	public static void main(String[] sss) {
		List<JSONObject> list1 = new ArrayList<JSONObject>();
		JSONObject js = new JSONObject();
		js.put("id", 1);
		js.put("name", "doubizhe");
		list1.add(js);
		js = new JSONObject();
		js.put("id", 2);
		js.put("name", "liudaozhe");
		list1.add(js);
		js = new JSONObject();
		js.put("id", 3);
		js.put("name", "liuliuzhe");
		list1.add(js);
		
		List<JSONObject> list2 = new ArrayList<JSONObject>();
		js = new JSONObject();
		js.put("id", 2);
		js.put("name", "jiquan");
		list2.add(js);
		js = new JSONObject();
		js.put("id", 4);
		js.put("name", "zushiye");
		list2.add(js);
		
		System.out.println(list1);
		System.out.println(list2);
		
//		list2.removeIf(data -> list1.stream().map(e->e.get("id")).collect(Collectors.toList()).contains(data.get("id")));
//		System.out.println(list2);
		//差集 l1-l2
		List<JSONObject> list3 = list1
				.stream()
				.filter(item->!list2.stream()
						.map(e->e.get("id"))
						.collect(Collectors.toList())
				
				.contains(item.get("id")))
				.collect(Collectors.toList());
		System.out.println(list3);
		//交集
		List<JSONObject> list4 = list2.stream().filter(item->!list1.stream().map(e->e.get("id")).
				collect(Collectors.toList()).contains(item.get("id"))).collect(Collectors.toList());
		System.out.println(list4);
	}

}
