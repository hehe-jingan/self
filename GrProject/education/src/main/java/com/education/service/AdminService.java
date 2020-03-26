/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.AdminMapper;
import com.education.dao.ClassesMapper;
import com.education.dao.StudentMapper;
import com.education.dao.TeacherMapper;
import com.education.dao.UserMapper;
import com.education.pojo.Admin;
import com.education.pojo.AdminExample;
import com.education.pojo.AdminExample.Criteria;
import com.education.pojo.Classes;
import com.education.pojo.Student;
import com.education.pojo.Teacher;
import com.education.pojo.User;
import com.education.pojo.UserExample;
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
	private UserMapper userDao;

	@Autowired
	private TeacherMapper teacherDao;

	@Autowired
	private StudentMapper studentDao;

	@Autowired
	private ClassesMapper classesDao;

	
	// 删除班级信息
	public String deleteClasses(Integer indexid) {
		int result = classesDao.deleteByPrimaryKey(indexid);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 修改班级信息
	public String updateClasses(Classes classes,String inputName) {
		classes.setModifydate(new Date());
		classes.setModifyname(inputName);
		int result = classesDao.updateByPrimaryKeySelective(classes);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增班级
	public String addClasses(Classes classes,String inputName) {
		
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
	public String updateStudent(Student student,String inputName) {
		student.setModifydate(new Date());
		student.setModifyname(inputName);
		int result = studentDao.updateByPrimaryKeySelective(student);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增学生
	public String addStudent(Student student,String inputName) {
		
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
		int result = teacherDao.deleteByPrimaryKey(indexid);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 修改教师信息
	public String updateTeacher(Teacher teacher,String inputName) {
		teacher.setModifydate(new Date());
		teacher.setModifyname(inputName);
		int result = teacherDao.updateByPrimaryKeySelective(teacher);
		if (result != 1) {
			return "ERROR";
		}
		return "SUCCESS";
	}

	// 新增教师
	public String addTeacher(Teacher teacher,String inputName) {
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

	// 删除用户
	public String deleteUser(Integer userId) {

		int result = userDao.deleteByPrimaryKey(userId);
		if (result == 1) {
			return "SUCCESS";
		}
		return "删除用户失败，请重试！！";
	}

	// 获取所有用户
	public List<User> getAllUser() {
		UserExample example = new UserExample();
		return userDao.selectByExample(example);
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

}
