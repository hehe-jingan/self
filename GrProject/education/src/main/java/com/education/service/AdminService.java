/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.AdminMapper;
import com.education.dao.ClassArrangeMapper;
import com.education.dao.ClassesMapper;
import com.education.dao.CourseArrangeMapper;
import com.education.dao.CourseMapper;
import com.education.dao.EvaluationMapper;
import com.education.dao.StudentMapper;
import com.education.dao.SupervisorMapper;
import com.education.dao.TeacherMapper;
import com.education.pojo.Admin;
import com.education.pojo.AdminExample;
import com.education.pojo.AdminExample.Criteria;
import com.education.pojo.ClassArrangeExample;
import com.education.pojo.Classes;
import com.education.pojo.ClassesExample;
import com.education.pojo.Course;
import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;
import com.education.pojo.CourseExample;
import com.education.pojo.EvaluationExample;
import com.education.pojo.Student;
import com.education.pojo.StudentExample;
import com.education.pojo.Supervisor;
import com.education.pojo.SupervisorExample;
import com.education.pojo.Teacher;
import com.education.pojo.TeacherExample;
import com.mysql.jdbc.StringUtils;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Service
public class AdminService {

	@Autowired
	private AdminMapper adminDao;


	@Autowired
	private TeacherMapper teacherDao;

	@Autowired
	private StudentMapper studentDao;

	@Autowired
	private ClassesMapper classesDao;

	@Autowired
	private CourseMapper courseDao;
	
	@Autowired
	private CourseArrangeMapper courseArrangeDao;
	
	@Autowired
	private SupervisorMapper superDao;
	
	@Autowired
	private ClassArrangeMapper classArrangeDao;
	
	@Autowired
	private EvaluationMapper evaDao;

	// 删除课程安排信息
	public String deleteCourseArrange(Integer indexid) {
		
		CourseArrange coa = courseArrangeDao.selectByPrimaryKey(indexid);
		
		if("1".equals(coa.getIsuse())) {
			return "该课程安排还在开设中，请修改开设状态再删除！！！";
		}
		
		EvaluationExample example = new EvaluationExample();
		com.education.pojo.EvaluationExample.Criteria criteria = example.createCriteria();
		criteria.andCaidEqualTo(indexid);
		evaDao.deleteByExample(example);
		
		return courseArrangeDao.deleteByPrimaryKey(indexid)==1?"SUCCESS":"ERROR";
	}

	// 删除课程信息
	public String deleteCourse(Integer indexid) {
		
		Course c = courseDao.selectByPrimaryKey(indexid);
		if("1".equals(c.getIsUse())) {
			return "课程开设中，请修改开设状态再删除！！！";
		}
		
		CourseArrangeExample example = new CourseArrangeExample();
		com.education.pojo.CourseArrangeExample.Criteria criteria = example.createCriteria();
		criteria.andCidEqualTo(indexid);
		int count = courseArrangeDao.countByExample(example);
		if(count != 0) {
			return "该课程存在课程编排，请先删除课程编排再删除该课程！！";
		}
		
		return courseDao.deleteByPrimaryKey(indexid)==1?"SUCCESS":"ERROR";
	}

	// 修改课程信息
	public String updateCourse(Course course, String inputName) {
		if("0".equals(course.getIsUse())) {
			if((new Integer(0)).equals(course.gettCount())) {
				return "课程还有教师安排，请先取消教师安排再修改课程状态！！！";
			}
			
		}
		
		course.setModifydate(new Date());
		course.setModifyname(inputName);
		int result = courseDao.updateByPrimaryKeySelective(course);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增课程
	public String addCourse(Course course, String inputName) {
		
		CourseExample example = new CourseExample();
		CourseExample.Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(course.getName());
		int count = courseDao.countByExample(example);
		if(count != 0) {
			return "课程名称已存在，请重新输入！！！";
		}
		
		course.setIsUse("1");
		course.setInputname(inputName);
		course.setInputdate(new Date());

		int result = courseDao.insertSelective(course);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 分配学生【删除】
	public String deleteStudentToClass(String deleteIds, String modifyName) {
		List<Integer> idList = new ArrayList<Integer>();
		String[] ids = deleteIds.split(",");

		if (ids == null || ids.length == 0) {
			return "没有需要删除的学生！！！";
		}

		for (String id : ids) {
			idList.add(Integer.parseInt(id));
		}
		Student student = new Student();
		student.setClassid(0);
		student.setModifydate(new Date());
		student.setModifyname(modifyName);
		StudentExample example = new StudentExample();
		StudentExample.Criteria criteria = example.createCriteria();
		criteria.andIndexidIn(idList);
		studentDao.updateByExampleSelective(student, example);
		return "SUCCESS";
	}

	// 分配学生【新增】
	public String addStudentToClass(String addIds, Integer classId, String modifyName) {
		List<Integer> idList = new ArrayList<Integer>();
		String[] ids = addIds.split(",");

		if (ids == null || ids.length == 0) {
			return "没有需要新增的学生！！！";
		}

		for (String id : ids) {
			idList.add(Integer.parseInt(id));
		}
		Student student = new Student();
		student.setClassid(classId);
		student.setModifydate(new Date());
		student.setModifyname(modifyName);
		StudentExample example = new StudentExample();
		StudentExample.Criteria criteria = example.createCriteria();
		criteria.andIndexidIn(idList);
		// 批量修改
		studentDao.updateByExampleSelective(student, example);
		return "SUCCESS";
	}

	// 删除班级信息
	public String deleteClasses(Integer indexid) {
		
		Classes classes = classesDao.selectByPrimaryKey(indexid);
		if("1".equals(classes.getIsuse())) {
			return "班级正在使用中，请修改班级使用状态再删除！！";
		}
		
		int result = classesDao.deleteByPrimaryKey(indexid);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 修改班级信息
	public String updateClasses(Classes classes, String inputName) {
		//如果修改班级状态
		if("0".equals(classes.getIsuse())) {
			StudentExample example = new StudentExample();
			StudentExample.Criteria criteria = example.createCriteria();
			criteria.andClassidEqualTo(classes.getIndexid());
			int count = studentDao.countByExample(example);
			if(count != 0) {
				return "班级还有学生，请移除班级内学生再修改班级状态！！！";
			}
			
			ClassArrangeExample example2 = new ClassArrangeExample();
			ClassArrangeExample.Criteria criteria2 = example2.createCriteria();
			criteria2.andClassidEqualTo(classes.getIndexid());
			int count2 = classArrangeDao.countByExample(example2);
			if(count2 != 0) {
				return "该班级还有课程安排，请删除课程安排再修改班级状态！！！";
			}
			
		}
		
		classes.setModifydate(new Date());
		classes.setModifyname(inputName);
		int result = classesDao.updateByPrimaryKeySelective(classes);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增班级
	public String addClasses(Classes classes, String inputName) {

		ClassesExample example = new ClassesExample();
		ClassesExample.Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(classes.getName());
		int count = classesDao.countByExample(example);
		if(count != 0) {
			return "班级名字已存在，请重新输入！！";
		}
		
		
		classes.setInputname(inputName);
		classes.setInputdate(new Date());

		int result = classesDao.insertSelective(classes);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 删除学生信息
	public String deleteStudent(Integer indexid) {
		int result = studentDao.deleteByPrimaryKey(indexid);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 修改学生信息
	public String updateStudent(Student student, String inputName) {
		student.setModifydate(new Date());
		student.setModifyname(inputName);
		int result = studentDao.updateByPrimaryKeySelective(student);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增学生
	public String addStudent(Student student, String inputName) {

		//校验学号是否存在
		StudentExample example = new StudentExample();
		StudentExample.Criteria criteria = example.createCriteria();
		criteria.andSpare1EqualTo(student.getSpare1());
		int count = studentDao.countByExample(example);
		if(count!=0) {
			return "学号已存在，请刷新重试！！！";
		}
		
		student.setInputname(inputName);
		student.setClassid(0);
		student.setInputdate(new Date());

		int result = studentDao.insertSelective(student);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 删除教师信息
	public String deleteTeacher(Integer indexid) {
		Teacher tea = teacherDao.selectByPrimaryKey(indexid);
		if("1".equals(tea.getOnjob())) {
			return "删除失败，该教师还在职中，请修改教室状态再删除！！！";
		}
		
		
		int result = teacherDao.deleteByPrimaryKey(indexid);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 修改教师信息
	public String updateTeacher(Teacher teacher, String inputName) {
		if("0".equals(teacher.getOnjob())) {
			CourseArrangeExample example = new CourseArrangeExample();
			com.education.pojo.CourseArrangeExample.Criteria criteria = example.createCriteria();
			criteria.andCidEqualTo(teacher.getIndexid());
			int count = courseArrangeDao.countByExample(example);
			if(count != 0) {
				return "修改状态失败，该教师还有课程安排，请先删除课程安排再修改教师在职状态！！！";
			}
		}
		
		
		teacher.setModifydate(new Date());
		teacher.setModifyname(inputName);
		int result = teacherDao.updateByPrimaryKeySelective(teacher);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增教师
	public String addTeacher(Teacher teacher, String inputName) {
		
		//校验教师号是否存在
		TeacherExample example = new TeacherExample();
		TeacherExample.Criteria criteria = example.createCriteria();
		criteria.andSpare1EqualTo(teacher.getSpare1());
		int count = teacherDao.countByExample(example);
		if(count!=0) {
			return "教师号已存在，请刷新重试！！";
		}
		
		teacher.setOnjob("1");
		teacher.setInputdate(new Date());
		teacher.setInputname(inputName);
		int result = teacherDao.insertSelective(teacher);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// ------------------------------------------------------

	// 删除管理员
	public String deleteAdmin(Integer adminId) {
		AdminExample example = new AdminExample();
		int count = adminDao.countByExample(example);
		if (count == 1) {
			return "管理员仅剩一位，不能删除！！";
		}
		if (adminDao.selectByPrimaryKey(adminId) == null) {
			return "管理员不存在请刷新重试！！";
		}

		int result = adminDao.deleteByPrimaryKey(adminId);
		return result == 1 ? "SUCCESS" : "未知错误，请刷新重试！";

	}

	// 新增管理员
	public String addAdmin(String adminName, String adminPass) {
		Admin admin = new Admin();
		admin.setName(adminName);
		admin.setPass(adminPass);
		int result = adminDao.insertSelective(admin);

		return result == 1 ? "SUCCESS" : "ERROR";
	}

	// 获取所有管理员
	public List<Admin> getAllAdmin() {
		AdminExample example = new AdminExample();
		List<Admin> result = adminDao.selectByExample(example);
		return result;
	}


	// 修改密码
	public String changePass(Admin user, String newPass, String oldPass, HttpServletRequest request) {

		if (!oldPass.equals(user.getPass())) {
			return "旧密码错误，请重试！";
		}

		user.setPass(newPass);
		int result = adminDao.updateByPrimaryKeySelective(user);

		if (result == 1) {
			request.getSession().setAttribute("admin", adminDao.selectByPrimaryKey(user.getIndexid()));
			return "success";
		}
		return "修改密码失败，请重试";

	}

	// 管理员登录
	public String login(String loginAccount, String loginPass, HttpServletRequest request) {
		if (StringUtils.isNullOrEmpty(loginAccount)) {
			return "用户名不能为空！";
		}
		if (StringUtils.isNullOrEmpty(loginPass)) {
			return "密码不能为空！！";
		}
		AdminExample example = new AdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(loginAccount);
		List<Admin> admins = adminDao.selectByExample(example);
		System.out.println("adminsSize=" + admins.size());
		if (admins.size() != 1) {
			return "用户名错误！！！";
		}

		if (!admins.get(0).getPass().equals(loginPass)) {
			return "密码错误！！！！";
		}

		Admin admin = admins.get(0);
		admin.setLastlogindate(new Date());
		// 更新最后登录时间
		adminDao.updateByPrimaryKeySelective(admin);
		request.getSession().setAttribute("admin", admin);
		return "SUCCESS";
	}
	
	
	public  String getNewNo(String type) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		switch (type) {
		case "1":
			StudentExample example = new StudentExample();
			StudentExample.Criteria criteria = example.createCriteria();
			criteria.andSpare1Like("1"+(sdf.format(new Date()))+"%");
			example.setOrderByClause("spare1 desc");
			List<Student> lists = studentDao.selectByExample(example);
			if(lists==null||lists.size()==0) {
				return "1"+sdf.format(new Date())+"01";
			}else {
				Student stu = lists.get(0);
				String NO = stu.getSpare1().replace("1"+sdf.format(new Date()), "");
				String result = "1"+sdf.format(new Date())+String.format("%02d", Integer.parseInt(NO)+1);
				return result;
			}
		case "2":
			TeacherExample example2 = new TeacherExample();
			TeacherExample.Criteria criteria2 = example2.createCriteria();
			criteria2.andSpare1Like("2"+(sdf.format(new Date()))+"%");
			example2.setOrderByClause("spare1 desc");
			List<Teacher> lists2 = teacherDao.selectByExample(example2);
			if(lists2==null||lists2.size()==0) {
				return "2"+sdf.format(new Date())+"01";
			}else {
				Teacher tea = lists2.get(0);
				String NO = tea.getSpare1().replace("2"+sdf.format(new Date()), "");
				String result = "2"+sdf.format(new Date())+String.format("%02d", Integer.parseInt(NO)+1);
				return result;
			}
		case "3":
			SupervisorExample example3 = new SupervisorExample();
			 com.education.pojo.SupervisorExample.Criteria criteria3 = example3.createCriteria();
			criteria3.andSpare1Like("3"+(sdf.format(new Date()))+"%");
			example3.setOrderByClause("spare1 desc");
			List<Supervisor> lists3 = superDao.selectByExample(example3);
			if(lists3==null||lists3.size()==0) {
				return "3"+sdf.format(new Date())+"01";
			}else {
				Supervisor super1 = lists3.get(0);
				String NO = super1.getSpare1().replace("3"+sdf.format(new Date()), "");
				String result = "3"+sdf.format(new Date())+String.format("%02d", Integer.parseInt(NO)+1);
				return result;
			}

		default:
			return "0";
		}
		
		
	}
	public static boolean isEmpty(Object value) {
		return value == null ? true : value.toString().trim().isEmpty();
	}
	
	public static void main(String[] ssss) {
		String str = " ";
		System.out.println(isEmpty(str));
	}
}
