package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.StudentMapper;
import com.education.pojo.Student;
import com.education.pojo.StudentExample;
import com.education.pojo.StudentExample.Criteria;

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

}
