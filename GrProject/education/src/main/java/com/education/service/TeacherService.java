package com.education.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.CourseArrangeMapper;
import com.education.dao.TeacherMapper;
import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;
import com.education.pojo.Teacher;
import com.education.pojo.TeacherExample;
import com.education.pojo.TeacherExample.Criteria;

@Service
public class TeacherService {

	@Autowired
	private TeacherMapper teaDao;

	@Autowired
	private CourseArrangeMapper caDao;

	// 获取所有教师列表
	public List<Teacher> getAllTeachers() {
		TeacherExample teacherExample = new TeacherExample();
		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
		return teachers;

	}

	// 根据Id获取教师信息
	public Teacher getTeacherById(Integer teacherId) {
		return teaDao.selectByPrimaryKey(teacherId);
	}

	// 根据课程Id获取教师信息
	public List<Teacher> getTeachersByCourseId(Integer courseId) {
		// 获取所有课程教师关联信息
		CourseArrangeExample caExample = new CourseArrangeExample();
		com.education.pojo.CourseArrangeExample.Criteria caCriteria = caExample.createCriteria();
		caCriteria.andCidEqualTo(courseId);
		List<CourseArrange> caList = caDao.selectByExample(caExample);
		// 获取所有教师Id
		List<Integer> tidList = caList.stream().map(CourseArrange::getTid).collect(Collectors.toList());
		// 如果该课程没有教师 则返回null
		if (tidList == null || tidList.size() == 0) {
			return null;
		}
		TeacherExample teacherExample = new TeacherExample();
		Criteria criteria = teacherExample.createCriteria();
		criteria.andIndexidIn(tidList);
		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
		return teachers;
	}

	// 根据课程Id获取没有该课程的教师信息
	public List<Teacher> getNoTeachersByCourseId(Integer courseId) {
		// 获取所有课程教师关联信息
		CourseArrangeExample caExample = new CourseArrangeExample();
		com.education.pojo.CourseArrangeExample.Criteria caCriteria = caExample.createCriteria();
		caCriteria.andCidEqualTo(courseId);
		List<CourseArrange> caList = caDao.selectByExample(caExample);
		// 获取所有教师Id
		List<Integer> tidList = caList.stream().map(CourseArrange::getTid).collect(Collectors.toList());
		TeacherExample teacherExample = new TeacherExample();
		// 如果该课程没有教师 则返回全部教师
		if (tidList == null || tidList.size() == 0) {
			return teaDao.selectByExample(teacherExample);
		}
		Criteria criteria = teacherExample.createCriteria();
		criteria.andIndexidNotIn(tidList);
		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
		return teachers;
	}

}
