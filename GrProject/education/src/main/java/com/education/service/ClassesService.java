package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.ClassesMapper;
import com.education.pojo.Classes;
import com.education.pojo.ClassesExample;

@Service
public class ClassesService {

	@Autowired
	private ClassesMapper classesDao;

	// 获取所有班级列表
	public List<Classes> getAllClasses() {
		ClassesExample studentExample = new ClassesExample();
		List<Classes> students = classesDao.selectByExample(studentExample);
		return students;

	}

	// 根据Id获取班级信息
	public Classes getClassesById(Integer studentId) {
		return classesDao.selectByPrimaryKey(studentId);
	}

}
