package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.StudentMapper;
import com.education.pojo.Student;
import com.education.pojo.StudentExample;

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

}
