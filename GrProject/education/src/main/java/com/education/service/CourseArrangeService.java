package com.education.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.CourseArrangeMapper;
import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;

@Service
public class CourseArrangeService {

	@Autowired
	private CourseArrangeMapper dao;

	
	//编辑修改
	public String editCourseArrange(CourseArrange courseArrange,String modifyName) {
		
		courseArrange.setModifydate(new Date());
		courseArrange.setModifyname(modifyName);
		
		return dao.updateByPrimaryKeySelective(courseArrange)==1?"SUCCESS":"ERROR";
		
	}
	
	//安排课程的任课教师
	public String addCourseTeacher(CourseArrange courseArrange,String inputName) {
		courseArrange.setInputdate(new Date());
		courseArrange.setInputname(inputName);
		courseArrange.setIsuse("1");
		int result = dao.insertSelective(courseArrange);
		if(result != 1) {
			return "ERROR";
		}
		
		return "SUCCESS";
	}
	
	
	// 获取所有课程安排列表
	public List<CourseArrange> getAllCourseArranges() {
		CourseArrangeExample caExample = new CourseArrangeExample();
		List<CourseArrange> students = dao.selectByExample(caExample);
		return students;

	}

	// 根据Id获取课程安排信息
	public CourseArrange getCourseArrangeById(Integer caId) {
		return dao.selectByPrimaryKey(caId);
	}

}

