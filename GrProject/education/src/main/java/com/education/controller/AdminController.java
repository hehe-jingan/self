/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.education.pojo.Admin;
import com.education.pojo.Book;
import com.education.pojo.Classes;
import com.education.pojo.Student;
import com.education.pojo.Teacher;
import com.education.service.AdminService;
import com.education.service.BookService;
import com.education.service.BorrowService;
import com.education.service.ClassesService;
import com.education.service.MessageService;
import com.education.service.StudentService;
import com.education.service.TeacherService;
import com.education.service.UserService;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BorrowService borrowService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private ClassesService classesService;

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
		ModelAndView mv = new ModelAndView("admin/editStudent");
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
		ModelAndView mv = new ModelAndView("admin/addStudent");
		return mv;
	}

	// 学生列表页面
	@RequestMapping(value = "/studentList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showStudentList() {
		ModelAndView mv = new ModelAndView("admin/studentList");
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
		ModelAndView mv = new ModelAndView("admin/editTeacher");
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
		ModelAndView mv = new ModelAndView("admin/teacherList");
		mv.addObject("teacherList", teacherService.getAllTeachers());
		return mv;
	}

	// 新增教师页面
	@RequestMapping(value = "/addTeacher", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView showAddTeacher() {
		ModelAndView mv = new ModelAndView("admin/addTeacher");
		return mv;
	}
	// ----------------------------------------------

	// 还书
	@RequestMapping(value = "/returnBook", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject returnBook(Integer borrowId) {

		JSONObject jsonObject = new JSONObject();

		jsonObject.put("msg", borrowService.returnBook(borrowId));

		return jsonObject;

	}

	// 获取所有预借图书
	@RequestMapping(value = "/onlineBookList", method = RequestMethod.GET)
	public ModelAndView showAllOnlineBook(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/allOnlineList");
		List<HashMap<String, Object>> lists = borrowService.getAllBorrowBook(null, "预借中");
		mv.addObject("borrowList", lists);
		return mv;
	}

	// 获取所有需要归还图书
	@RequestMapping(value = "/returnBookList", method = RequestMethod.GET)
	public ModelAndView showAllReturnBook(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("admin/allReturnList");
		List<HashMap<String, Object>> list1 = borrowService.getAllBorrowBook(null, "租借中");
		List<HashMap<String, Object>> list2 = borrowService.getAllBorrowBook(null, "续借中");
		list1.addAll(list2);
		mv.addObject("borrowList", list1);

		return mv;
	}

	// 书籍借阅
	@RequestMapping(value = "/bookBorrow", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject borrowBook(Integer bookId, String certNo, Integer day) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", borrowService.borrowBook(certNo, day, bookId));
		return jsonObject;
	}

	// 书籍入库
	@RequestMapping(value = "/editBook", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject editBook(MultipartFile bookImage, Book book) throws IllegalStateException, IOException {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", bookService.editBook(bookImage, book));
		return jsonObject;
	}

	// 编辑书籍页面
	@RequestMapping(value = "/editBook/{bookId}", method = RequestMethod.GET)
	public ModelAndView showEditBook(@PathVariable Integer bookId) {
		ModelAndView mv = new ModelAndView("admin/editBook");
		mv.addObject("book", bookService.getBookById(bookId));
		return mv;
	}

	// 借阅页面
	@RequestMapping(value = "/borrowBook/{bookId}", method = RequestMethod.GET)
	public ModelAndView showOnline(@PathVariable Integer bookId) {
		ModelAndView mv = new ModelAndView("admin/borrowBook");
		mv.addObject("userLists", adminService.getAllUser());
		mv.addObject("book", bookService.getBookById(bookId));
		return mv;
	}

	// 可借阅管理页面
	@RequestMapping(value = "/borrowBookList", method = RequestMethod.GET)
	public ModelAndView showCanBorrow() {
		ModelAndView mv = new ModelAndView("admin/canBorrowList");
		mv.addObject("bookList", bookService.getCanBorrowBook());
		return mv;
	}

	// 书籍管理页面
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public ModelAndView showAllBook() {
		ModelAndView mv = new ModelAndView("admin/bookList");
		mv.addObject("bookList", bookService.getAllBook());
		return mv;
	}

	// 书籍入库
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addBook(MultipartFile bookImage, MultipartFile bookDoc, Book book)
			throws IllegalStateException, IOException {
		JSONObject jsonObject = new JSONObject();

		jsonObject.put("msg", bookService.addBook(bookImage, bookDoc, book));
		return jsonObject;
	}

	// 新增书籍
	@RequestMapping(value = "/addBook", method = RequestMethod.GET)
	public ModelAndView showAddBook() {
		ModelAndView mv = new ModelAndView("admin/addBook");
		return mv;
	}

	// 获取最新卡号
	@RequestMapping(value = "/getNewCertNo", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getNewCertNo() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "SUCCESS");
		jsonObject.put("newCertNo", userService.getNewCertId());
		return jsonObject;
	}

	// 删除管理员
	@RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteAdmin(Integer adminId, String adminType) {
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

	// 获取通知数量
	@RequestMapping(value = "/getMessageCount", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMessageCount(Integer adminId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "success");
		jsonObject.put("data", messageService.countMessage(adminId, "管理员"));

		return jsonObject;
	}

	// 新增用户页面
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public ModelAndView showAddUser() {
		ModelAndView mv = new ModelAndView("admin/addUser");
		mv.addObject("newCertId", userService.getNewCertId());
		return mv;
	}

	// 删除用户
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteUser(Integer userId) {
		JSONObject jsonObject = new JSONObject();
		String msg = adminService.deleteUser(userId);
		jsonObject.put("msg", msg);
		return jsonObject;
	}

	// 用户管理页面
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ModelAndView showUserList() {
		ModelAndView mv = new ModelAndView("admin/userList");
		mv.addObject("userList", adminService.getAllUser());
		return mv;
	}

	// 新增用户
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject addUser(String name, String idcard, String pass, String certNo, String age, String sex) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", userService.addUser(name, idcard, pass, certNo, age, sex));
		return jsonObject;
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

	int x = 8;

	public static void main(String sss[]) throws FileNotFoundException {
//		System.out.println(1);
//		Stream.of(new MyCol("Mercury"),new MyCol("Venus"),
//				new MyCol("Earth")).
//		flatMap(i->i.indices.stream()).
//		mapToInt(j->j).max().
//		ifPresent(s->System.out.println(s));;
//		System.out.println(Element.A.get);
//		int x = 9;
		AdminController adminController = new AdminController();
		System.out.println(adminController.x);
//		BufferedReader i = new BufferedReader(new InputStreamReader(""));

//		int c= 0;
//		System.out.println((0==c++)?"t":"f");
//		
//
//		Double d = null;
//		System.out.println((d instanceof Double)?"t":"f");
//		
//		boolean b = false;
//		System.out.println("(b = true)="+(b = true));
//		System.out.println((b = true)?"t":"f");
//		
//		int a= 0;
//		System.out.println((a!=0)?"t":"f");
//		
//		String eString = "1";
//		System.out.println(("1"!=eString)?"t":"f");
//		System.out.println((eString == "1"));

//		String first = "first";
//		String second = new String("first");
//		"first".concat("second");
//		System.out.println(first);
//		System.out.println(second);
//		
//		System.out.println(first.equals(second));
//		System.out.println(first==second);
//		System.out.println(first.equals("firstsecond"));
//		System.out.println(second == "first");

	}

}
