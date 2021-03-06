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
import com.education.pojo.Admin;
import com.education.pojo.Classes;
import com.education.pojo.Course;
import com.education.pojo.CourseArrange;
import com.education.pojo.Evaluation;
import com.education.pojo.Student;
import com.education.pojo.Teacher;
import com.education.service.AdminService;
import com.education.service.ClassesCourseArrangeService;
import com.education.service.ClassesService;
import com.education.service.CourseArrangeService;
import com.education.service.CourseService;
import com.education.service.EvaItemService;
import com.education.service.EvaluationService;
import com.education.service.StudentService;
import com.education.service.SupervisorService;
import com.education.service.TeacherService;
import com.mysql.jdbc.StringUtils;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {


	@Autowired
	private AdminService adminService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private ClassesService classesService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private SupervisorService supervisorService;

	@Autowired
	private CourseArrangeService courseArrangeService;

	@Autowired
	private ClassesCourseArrangeService classArrangeService;

	@Autowired
	private EvaluationService elService;

	@Autowired
	private EvaItemService evaItemService;
//
//	// 课程评价统计列表页面
//	@RequestMapping(value = "/evaSummary/{chooseYear}/{chooseCourse}", method = RequestMethod.GET)
//	public ModelAndView showEvaluationByValListaa(@PathVariable String chooseYear, @PathVariable Integer chooseCourse,HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("admin/evaluate/evaSummaryList");
//		List<Evaluation> evLists = elService.getAllEvaByGroupBy(
//				new ArrayList<>(Arrays.asList("t.indexId ", " co.indexId", "cl.indexId", "e.year")));
//		List<Evaluation> list2 = elService
//				.getAllEvaByGroupBy(new ArrayList<>(Arrays.asList("t.indexId ", " cl.indexId")));
//		List<Evaluation> listT = elService.getAllEvaByGroupBy(new ArrayList<>(Arrays.asList("t.indexId ")));
//
////		List<Evaluation> evLists = elService.getAllEvalationsByFilter(chooseYear, chooseCourse);
//
//		List<Evaluation> courseList = evLists.stream()
//				.collect(Collectors.collectingAndThen(
//						Collectors.toCollection(
//								() -> new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getCoName))),
//						ArrayList::new));
//		mv.addObject("courseLists", courseList.stream().map(Evaluation::getCourse).collect(Collectors.toList()));
//		mv.addObject("chooseYear", chooseYear);
//		mv.addObject("chooseCourse", chooseCourse);
//		mv.addObject("yearLists", evLists.stream().map(Evaluation::getYear).distinct().collect(Collectors.toList()));
//
//		mv.addObject("evLists", evLists);
//		mv.addObject("list2", list2);
//		mv.addObject("listT", listT);
//		return mv;
//	}

	// 课程评价统计列表页面
	@RequestMapping(value = "/evaSummary/{type}/{chooseYear}/{chooseCo}/{chooseCl}/{chooseTea}", method = RequestMethod.GET)
	public ModelAndView showEvaluationByValList(@PathVariable String type,@PathVariable String chooseYear,@PathVariable Integer chooseCo,@PathVariable Integer chooseCl,
			@PathVariable Integer chooseTea,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/evaluate/evaSummaryList");
		List<Evaluation> evLists = new ArrayList<Evaluation>();
		if("1".equals(type)) {
			evLists = elService.getAllEvaByGroupBy(
					new ArrayList<>(Arrays.asList("t.indexId ", " co.indexId", "cl.indexId", "e.year")),chooseYear,chooseCo,chooseCl,chooseTea);
		}else if("2".equals(type)) {
			evLists = elService.getAllEvaByGroupBy(
					new ArrayList<>(Arrays.asList("t.indexId ", "e.year")),chooseYear,chooseCo,chooseCl,chooseTea);
		}
		

//		List<Evaluation> evLists = elService.getAllEvalationsByFilter(chooseYear, chooseCourse);

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

	// 评价分项保存
	@RequestMapping(value = "/evaItem", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject editEvaItem(String[] ids, String[] content) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", evaItemService.editEvaItem(ids, content));
		return jsonObject;
	}

	// 评价分项页面
	@RequestMapping(value = "/evaItem", method = RequestMethod.GET)
	public ModelAndView showEvaItem() {
		ModelAndView mv = new ModelAndView("admin/evaluate/editEvaItem");

		mv.addObject("evaItem", evaItemService.getAllEvaItem());
		return mv;
	}

	// 评价删除
	@RequestMapping(value = "/deleteEvaluation/{evId}", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteEvaluation(@PathVariable Integer evId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", elService.deleteEvaluation(evId));
		return jsonObject;

	}

	// 课程评价列表页面
	@RequestMapping(value = "/evaluationList", method = RequestMethod.GET)
	public ModelAndView showEvaluationAllList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/evaluate/evaluateList");
		String chooseYear = "all";
		Integer chooseCourse = 0;
		List<Evaluation> evLists = elService.getAllEvalationsByFilter(chooseYear, chooseCourse);

		List<Evaluation> courseList = evLists.stream()
				.collect(Collectors.collectingAndThen(
						Collectors.toCollection(
								() -> new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getCoName))),
						ArrayList::new));
		mv.addObject("courseLists", courseList.stream().map(Evaluation::getCourse).collect(Collectors.toList()));
		mv.addObject("chooseYear", chooseYear);
		mv.addObject("chooseCourse", chooseCourse);
		mv.addObject("yearLists", evLists.stream().map(Evaluation::getYear).distinct().collect(Collectors.toList()));

		mv.addObject("evaItem", evaItemService.getAllEvaItem());
		mv.addObject("evLists", evLists);

		return mv;
	}

	// 课程评价列表页面
	@RequestMapping(value = "/evaluationList/{chooseYear}/{chooseCourse}", method = RequestMethod.GET)
	public ModelAndView showEvaluationList(@PathVariable String chooseYear, @PathVariable Integer chooseCourse,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/evaluate/evaluateList");
		List<Evaluation> evLists = elService.getAllEvalationsByFilter(chooseYear, chooseCourse);
		List<Evaluation> courseList = evLists.stream()
				.collect(Collectors.collectingAndThen(
						Collectors.toCollection(
								() -> new TreeSet<Evaluation>(Comparator.comparing(Evaluation::getCoName))),
						ArrayList::new));

		mv.addObject("yearLists", evLists.stream().map(Evaluation::getYear).distinct().collect(Collectors.toList()));
		mv.addObject("courseLists", courseList.stream().map(Evaluation::getCourse).collect(Collectors.toList()));
		mv.addObject("chooseYear", chooseYear);
		mv.addObject("chooseCourse", chooseCourse);
		mv.addObject("evaItem", evaItemService.getAllEvaItem());
		mv.addObject("evLists", evLists);

		return mv;
	}

	// 课程评价
	@RequestMapping(value = "/adminEvaluate", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject studentEvaluate(Evaluation evaluation, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		if (request.getSession().getAttribute("admin") == null) {
			jsonObject.put("msg", "登录已过期，请重新登录！！");
			return jsonObject;
		}
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		jsonObject.put("msg", elService.editEvaluation(evaluation, admin.getName()));
		return jsonObject;
	}

	// 课程评价页面
	@RequestMapping(value = "/adminEvaluate/{evId}", method = RequestMethod.GET)
	public ModelAndView showEvaluate(@PathVariable Integer evId) {
		ModelAndView mv = new ModelAndView("admin/evaluate/adminEvaluate");
		mv.addObject("evaItemLists", evaItemService.getAllEvaItem());
		mv.addObject("evaluation", elService.getEvaluationByEvId(evId));
		return mv;

	}

	// 课程分配班级
	@RequestMapping(value = "/arrangeClasses", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject arrangeClasses(Integer coaId, String[] cid, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		String msg = classArrangeService.addClassArrange(cid, coaId, admin.getName());
		jsonObject.put("msg", msg);
		return jsonObject;
	}

	// 课程分配班级页面
	@RequestMapping(value = "/arrangeClasses/{courseArrangeId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showArrangeClasses(@PathVariable Integer courseArrangeId) {
		ModelAndView mv = new ModelAndView("admin/courseArrange/arrangeClasses");

		List<Classes> classList = classesService.getClassesBycoaId(courseArrangeId);
		List<Classes> classNoList = classesService.getNoClassesBycoaId(courseArrangeId);
		mv.addObject("courseArrangeInfo", courseArrangeService.getCourseArrangeById(courseArrangeId));
		mv.addObject("classList", classList);
		mv.addObject("classNoList", classNoList);

		return mv;
	}

	// 删除课程安排
	@RequestMapping(value = "/deleteCourseArrange", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteCourseArrange(Integer courseArrangeId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.deleteCourseArrange(courseArrangeId));
		return jsonObject;
	}

	// 编辑课程安排
	@RequestMapping(value = "/editCourseArrange", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject editCourseArragne(CourseArrange courseArrange, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		String msg = courseArrangeService.editCourseArrange(courseArrange, admin.getName());
		jsonObject.put("msg", msg);
		return jsonObject;
	}

	// 课程安排教师编辑页面
	@RequestMapping(value = "/editCourseArrange/{indexId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showEditCourseArrange(@PathVariable Integer indexId) {
		ModelAndView mv = new ModelAndView("admin/courseArrange/editCourseArrange");
		mv.addObject("courseArrange", courseArrangeService.getCourseArrangeById(indexId));
		return mv;
	}

	// 课程安排教师页面
	@RequestMapping(value = "/courseArrangeList", method = RequestMethod.GET)
	public ModelAndView showcourseArrangeList() {
		ModelAndView mv = new ModelAndView("admin/courseArrange/courseArrangeList");
		mv.addObject("courseArrangeList", courseArrangeService.getAllCourseArranges());
		return mv;
	}

	// 课程安排教师
	@RequestMapping(value = "/arrangeTeacher", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject arrangeTeacher(CourseArrange courseArrange, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		String msg = courseArrangeService.addCourseTeacher(courseArrange, admin.getName());
		jsonObject.put("msg", msg);
		return jsonObject;
	}

	// 课程安排教师页面
	@RequestMapping(value = "/arrangeTeacher/{courseId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showArrangeTeacher(@PathVariable Integer courseId) {
		ModelAndView mv = new ModelAndView("admin/course/arrangeTeacher");

		List<Teacher> teacherList = teacherService.getTeachersByCourseId(courseId);
		List<Teacher> teacherNoCourseList = teacherService.getNoTeachersByCourseId(courseId);
		mv.addObject("courseInfo", courseService.getCourseById(courseId));
		mv.addObject("teacherList", teacherList);
		mv.addObject("teacherNoCourseList", teacherNoCourseList);

		return mv;
	}

	// 删除课程
	@RequestMapping(value = "/deleteCourse", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteCourse(Integer courseId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.deleteCourse(courseId));
		return jsonObject;
	}

	// 修改课程
	@RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateCourse(Course Course, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.updateCourse(Course, admin.getName()));
		return jsonObject;
	}

	// 修改课程页面
	@RequestMapping(value = "/updateCourse/{courseId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView editAddCourse(@PathVariable Integer courseId) {
		ModelAndView mv = new ModelAndView("admin/course/editCourse");
		mv.addObject("courseInfo", courseService.getCourseById(courseId));
		return mv;
	}

	// 新增课程
	@RequestMapping(value = "/addCourse", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addCourse(Course course, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.addCourse(course, admin.getName()));
		return jsonObject;
	}

	// 新增课程页面
	@RequestMapping(value = "/addCourse", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showAddCourse() {
		ModelAndView mv = new ModelAndView("admin/course/addCourse");
		return mv;
	}

	// 课程列表页面
	@RequestMapping(value = "/courseList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showCourseList() {
		ModelAndView mv = new ModelAndView("admin/course/courseList");
		mv.addObject("courseList", courseService.getAllCourses());
		// classArrangeService.getAllCourseArranges();
		return mv;
	}

	// 安排学生
	@RequestMapping(value = "/arrangeStudent", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject arrangeStudent(Integer classesId, String deleteIds, String addIds, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		String msg = "";
		if (!StringUtils.isEmptyOrWhitespaceOnly(addIds)) {
			msg = adminService.addStudentToClass(addIds, classesId, admin.getName());
		}
		if (!StringUtils.isEmptyOrWhitespaceOnly(deleteIds)) {
			msg = adminService.deleteStudentToClass(deleteIds, admin.getName());
		}
		jsonObject.put("msg", msg);
		return jsonObject;
	}

	// 安排学生页面
	@RequestMapping(value = "/arrangeStudent/{classesId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showArrangeStudent(@PathVariable Integer classesId) {
		ModelAndView mv = new ModelAndView("admin/classes/arrangeStudent");

		List<Student> studentList = studentService.getStudentByClassId(classesId);
		List<Student> studentNoClassList = studentService.getAllStudentWithNoClass();

		List<Integer> ids = studentList.stream().map(Student::getIndexid).collect(Collectors.toList());
		List<Integer> noClassIds = studentNoClassList.stream().map(Student::getIndexid).collect(Collectors.toList());

		mv.addObject("classesInfo", classesService.getClassesById(classesId));
		mv.addObject("studentList", studentList);
		mv.addObject("studentNoClassList", studentNoClassList);
		mv.addObject("ids", ids);
		mv.addObject("noClassIds", noClassIds);

		return mv;
	}

	// 删除班级
	@RequestMapping(value = "/deleteClasses", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteClasses(Integer classesId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.deleteClasses(classesId));
		return jsonObject;
	}

	// 修改班级
	@RequestMapping(value = "/updateClasses", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateClasses(Classes classes, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.updateClasses(classes, admin.getName()));
		return jsonObject;
	}

	// 修改班级页面
	@RequestMapping(value = "/updateClasses/{classesId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView editAddClasses(@PathVariable Integer classesId) {
		ModelAndView mv = new ModelAndView("admin/classes/editClasses");
		mv.addObject("classesInfo", classesService.getClassesById(classesId));
		return mv;
	}

	// 新增班级
	@RequestMapping(value = "/addClasses", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addClasses(Classes classes, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.addClasses(classes, admin.getName()));
		return jsonObject;
	}

	// 新增班级页面
	@RequestMapping(value = "/addClasses", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showAddClasses() {
		ModelAndView mv = new ModelAndView("admin/classes/addClasses");
		return mv;
	}

	// 班级列表页面
	@RequestMapping(value = "/classesList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showClassesList() {
		ModelAndView mv = new ModelAndView("admin/classes/classesList");
		mv.addObject("classesList", classesService.getAllClasses());
		return mv;
	}

	// 删除学生
	@RequestMapping(value = "/deleteStudent", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteStudent(Integer studentId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.deleteStudent(studentId));
		return jsonObject;
	}

	// 修改学生
	@RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateStudent(Student student, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.updateStudent(student, admin.getName()));
		return jsonObject;
	}

	// 修改学生页面
	@RequestMapping(value = "/updateStudent/{studentId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView editAddStudent(@PathVariable Integer studentId) {
		ModelAndView mv = new ModelAndView("admin/student/editStudent");
		mv.addObject("studentInfo", studentService.getStudentById(studentId));
		return mv;
	}

	// 新增学生
	@RequestMapping(value = "/addStudent", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addStudent(Student student, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.addStudent(student, admin.getName()));
		return jsonObject;
	}

	// 新增学生页面
	@RequestMapping(value = "/addStudent", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showAddStudent() {
		ModelAndView mv = new ModelAndView("admin/student/addStudent");
		mv.addObject("stuNo", adminService.getNewNo("1"));
		return mv;
	}

	// 学生列表页面
	@RequestMapping(value = "/studentList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showStudentList() {
		ModelAndView mv = new ModelAndView("admin/student/studentList");
		mv.addObject("studentList", studentService.getAllStudents());
		return mv;
	}

	// 删除教师
	@RequestMapping(value = "/deleteTeacher", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteTeacher(Integer teacherId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.deleteTeacher(teacherId));
		return jsonObject;
	}

	// 修改教师页面
	@RequestMapping(value = "/updateTeacher/{teacherId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showUpdateTeacher(@PathVariable Integer teacherId) {
		ModelAndView mv = new ModelAndView("admin/teacher/editTeacher");
		mv.addObject("teacherInfo", teacherService.getTeacherById(teacherId));
		return mv;
	}

	// 修改教师
	@RequestMapping(value = "/updateTeacher", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject updateTeacher(Teacher teacher, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.updateTeacher(teacher, admin.getName()));
		return jsonObject;
	}

	// 新增教师
	@RequestMapping(value = "/addTeacher", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addTeacher(Teacher teacher, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			jsonObject.put("msg", "user no login!!!");
			return jsonObject;
		}
		jsonObject.put("msg", adminService.addTeacher(teacher, admin.getName()));
		return jsonObject;
	}

	// 教师列表页面
	@RequestMapping(value = "/teacherList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showTeacherList() {
		ModelAndView mv = new ModelAndView("admin/teacher/teacherList");
		mv.addObject("teacherList", teacherService.getAllTeachers());
		return mv;
	}

	// 新增教师页面
	@RequestMapping(value = "/addTeacher", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showAddTeacher() {
		ModelAndView mv = new ModelAndView("admin/teacher/addTeacher");
		mv.addObject("teaNo", adminService.getNewNo("2"));
		return mv;
	}

	// 删除督导
	@RequestMapping(value = "/deleteSupervisor", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteSupervisor(Integer supervisorId, String supervisorType) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", supervisorService.deleteSupervisor(supervisorId));

		return jsonObject;

	}

	// 新增督导
	@RequestMapping(value = "/addSupervisor", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addSupervisor(String supervisorName, String supervisorPass, String supervisorType,
			String spare1) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", supervisorService.addSupervisor(supervisorName, supervisorPass, spare1));
		return jsonObject;
	}

	// 新增督导页面
	@RequestMapping(value = "/addSupervisor", method = RequestMethod.GET)
	public ModelAndView showAddSupervisor() {
		ModelAndView mv = new ModelAndView("admin/supervisor/addSupervisor");
		mv.addObject("superNo", adminService.getNewNo("3"));

		return mv;
	}

	// 编辑督导页面
	@RequestMapping(value = "/supervisorList", method = RequestMethod.GET)
	public ModelAndView showSupervisorList() {
		ModelAndView mv = new ModelAndView("admin/supervisor/supervisorList");
		mv.addObject("supervisorList", supervisorService.getAllSupervisor());
		return mv;
	}

	// 删除管理员
	@RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteAdmin(Integer adminId, String supervisorType) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.deleteAdmin(adminId));
		return jsonObject;

	}

	// 新增管理员
	@RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addAdmin(String adminName, String adminPass, String adminType) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", adminService.addAdmin(adminName, adminPass));
		return jsonObject;
	}

	// 新增管理员页面
	@RequestMapping(value = "/addAdmin", method = RequestMethod.GET)
	public ModelAndView showAddAdmin() {
		ModelAndView mv = new ModelAndView("admin/addAdmin");
		return mv;
	}

	// 管理员页面
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public ModelAndView showAdminList() {
		ModelAndView mv = new ModelAndView("admin/adminList");
		mv.addObject("adminList", adminService.getAllAdmin());
		return mv;
	}



	// 修改密码
	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject changePass(HttpServletRequest request, String newPass, String oldPass) {
		JSONObject jsonObject = new JSONObject();

		String msg = "error";
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			msg = "用户未登录！";
		} else {
			msg = adminService.changePass(admin, newPass, oldPass, request);
		}
		jsonObject.put("msg", msg);

		return jsonObject;
	}

	// 修改密码页面
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public ModelAndView showChangePass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/forgetPass");
		return mv;
	}

	// 主页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("admin/index");

		return mv;
	}

	// 管理员登录页面
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(String flag, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/login");

		if (request.getSession().getAttribute("admin") == null) {
			return mv;
		} else {
			if ("logout".equals(flag)) {
				request.getSession().removeAttribute("admin");
			}
		}
		return mv;
	}

	// 登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject login(String name, String pass, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String str = adminService.login(name, pass, request);
		jsonObject.put("msg", str);
		return jsonObject;
	}

}
