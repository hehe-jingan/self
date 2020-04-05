package com.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.CourseMapper;
import com.education.pojo.Course;
import com.education.pojo.CourseExample;

@Service
public class CourseService {

	@Autowired
	private CourseMapper stuDao;

	// 获取所有课程列表
	public List<Course> getAllCourses() {
		CourseExample courseExample = new CourseExample();
		List<Course> courses = stuDao.selectByExample(courseExample);
		return courses;
	}

	// 根据Id获取课程信息
	public Course getCourseById(Integer courseId) {
		return stuDao.selectByPrimaryKey(courseId);
	}

	
	


}
