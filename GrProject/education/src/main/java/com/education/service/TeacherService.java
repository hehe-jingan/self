package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.TeacherMapper;
import com.education.pojo.Teacher;
import com.education.pojo.TeacherExample;

@Service
public class TeacherService {
	
	
	
	@Autowired
	private TeacherMapper teaDao;
	
	
	//获取所有教师列表
	public List<Teacher> getAllTeachers(){
		TeacherExample teacherExample = new TeacherExample();
		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
		return teachers;
		
	}
	
	//根据Id获取教师信息
	public Teacher getTeacherById(Integer teacherId){
		return teaDao.selectByPrimaryKey(teacherId);
	}
	
	
	
	
}
