package com.education.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.StudentMapper;
import com.education.pojo.Student;
import com.education.pojo.StudentExample;
import com.education.pojo.StudentExample.Criteria;
import com.mysql.jdbc.StringUtils;

@Service
public class StudentService {

	@Autowired
	private StudentMapper stuDao;

	// 获取所有学生列表
	public List<Student> getAllStudents() {
		StudentExample studentExample = new StudentExample();
		List<Student> students = stuDao.selectByExample(studentExample);
		return students;
	}

	// 根据Id获取学生信息
	public Student getStudentById(Integer studentId) {
		return stuDao.selectByPrimaryKey(studentId);
	}

	// 根据ClassId获取所有学生
	public List<Student> getStudentByClassId(Integer classId) {
		StudentExample studentExample = new StudentExample();
		Criteria criteria = studentExample.createCriteria();
		criteria.andClassidEqualTo(classId);
		List<Student> students = stuDao.selectByExample(studentExample);
		return students;
	}

	
	// 获取所有未分配的学生
	public List<Student> getAllStudentWithNoClass() {
		StudentExample studentExample = new StudentExample();
		Criteria criteria = studentExample.createCriteria();
		criteria.andClassidEqualTo(0);
		List<Student> students = stuDao.selectByExample(studentExample);
		return students;
	}

	// 修改密码
	public String changePass(Student user, String newPass, String oldPass, HttpServletRequest request) {

		if (!oldPass.equals(user.getPass())) {
			return "旧密码错误，请重试！";
		}

		user.setPass(newPass);
		int result = stuDao.updateByPrimaryKeySelective(user);

		if (result == 1) {
			request.getSession().setAttribute("student", stuDao.selectByPrimaryKey(user.getIndexid()));
			return "success";
		}
		return "修改密码失败，请重试";

	}
	
	// 学生登录
		public String login(String loginAccount, String loginPass, HttpServletRequest request) {
			if (StringUtils.isNullOrEmpty(loginAccount)) {
				return "用户名不能为空！";
			}
			if (StringUtils.isNullOrEmpty(loginPass)) {
				return "密码不能为空！！";
			}
			StudentExample example = new StudentExample();
			Criteria criteria = example.createCriteria();
			criteria.andSpare1EqualTo(loginAccount);
			List<Student> stus = stuDao.selectByExample(example);
			System.out.println("studentSize=" + stus.size());
			if (stus.size() != 1) {
				return "学号错误！！！";
			}

			if (!stus.get(0).getPass().equals(loginPass)) {
				return "密码错误！！！！";
			}
			Student s = stus.get(0);
			request.getSession().setAttribute("student", s);
			return "SUCCESS";
		}

}
