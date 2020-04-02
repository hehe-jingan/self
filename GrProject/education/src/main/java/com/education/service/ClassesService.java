package com.education.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.ClassArrangeMapper;
import com.education.dao.ClassesMapper;
import com.education.dao.CourseArrangeMapper;
import com.education.pojo.ClassArrange;
import com.education.pojo.ClassArrangeExample;
import com.education.pojo.ClassArrangeExample.Criteria;
import com.education.pojo.Classes;
import com.education.pojo.ClassesExample;
import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;

@Service
public class ClassesService {

	@Autowired
	private ClassesMapper classesDao;

	@Autowired
	private ClassArrangeMapper claDao;
	
	@Autowired
	private CourseArrangeMapper coaDao;

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
	
	//根据教师Id获取所有班级
	public List<ClassArrange> getClassesByTeacherId(Integer teaId){
		CourseArrangeExample example = new CourseArrangeExample();
		CourseArrangeExample.Criteria criteria = example.createCriteria();
		criteria.andTidEqualTo(teaId);
		List<CourseArrange> coaList = coaDao.selectByExample(example);
		if(coaList == null || coaList.size() == 0) {
			return null;
		}
		List<Integer> coaIds = coaList.stream().map(CourseArrange::getIndexid).collect(Collectors.toList());
		ClassArrangeExample example2 = new ClassArrangeExample();
		Criteria criteria2 = example2.createCriteria();
		criteria2.andCaidIn(coaIds);
		List<ClassArrange> list = claDao.selectByExample(example2);
		if(list == null || list.size() == 0) {
			return null;
		} 
		return list;
	}

	// 根据coId获取所有class
	public List<Classes> getClassesBycoaId(Integer coaId) {

		ClassArrangeExample claExample = new ClassArrangeExample();
		Criteria claCriteria = claExample.createCriteria();
		claCriteria.andCaidEqualTo(coaId);
		List<ClassArrange> lists = claDao.selectByExample(claExample);
		if (lists == null || lists.size() == 0) {
			return null;
		}
		List<Integer> classIds = lists.stream().map(ClassArrange::getClassid).collect(Collectors.toList());
		
		ClassesExample classesExample = new ClassesExample();
		com.education.pojo.ClassesExample.Criteria classCriteria = classesExample.createCriteria();
		classCriteria.andIndexidIn(classIds);
		return classesDao.selectByExample(classesExample);

	}
	
	// 根据coId获取所有不包含的class
		public List<Classes> getNoClassesBycoaId(Integer coaId) {

			ClassArrangeExample claExample = new ClassArrangeExample();
			Criteria claCriteria = claExample.createCriteria();
			claCriteria.andCaidEqualTo(coaId);
			List<ClassArrange> lists = claDao.selectByExample(claExample);
			ClassesExample classesExample = new ClassesExample();
			if (lists == null || lists.size() == 0) {
				return classesDao.selectByExample(classesExample);
			}
			List<Integer> classIds = lists.stream().map(ClassArrange::getClassid).collect(Collectors.toList());
			ClassesExample.Criteria classCriteria = classesExample.createCriteria();
			classCriteria.andIndexidNotIn(classIds);
			return classesDao.selectByExample(classesExample);
		}

}
