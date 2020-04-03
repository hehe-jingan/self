package com.education.service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.ClassArrangeMapper;
import com.education.dao.CourseArrangeMapper;
import com.education.dao.EvaluationMapper;
import com.education.pojo.ClassArrange;
import com.education.pojo.ClassArrangeExample;
import com.education.pojo.ClassArrangeExample.Criteria;
import com.education.pojo.Classes;
import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;
import com.education.pojo.Evaluation;
import com.education.pojo.EvaluationExample;
import com.education.pojo.Student;
import com.education.pojo.Teacher;

@Service
public class ClassesCourseArrangeService {

	@Autowired
	private ClassArrangeMapper dao;

	@Autowired
	private CourseArrangeMapper coaDao;
	
	@Autowired
	private EvaluationMapper evDao;
	
	@Autowired
	private ClassesService service;

//	//编辑修改
//	public String editCourseArrange(CourseArrange courseArrange,String modifyName) {
//		
//		courseArrange.setModifydate(new Date());
//		courseArrange.setModifyname(modifyName);
//		
//		return dao.updateByPrimaryKeySelective(courseArrange)==1?"SUCCESS":"ERROR";
//		
//	}

	// 新增课程安排
	public String addClassArrange(String[] ids, Integer coaId, String inputName) {

		List<Classes> cList = service.getClassesBycoaId(coaId);
		ClassArrange ca = new ClassArrange();
		// 原本没有安排班级
		if (cList == null || cList.size() == 0) {
			//
			if (ids == null || ids.length == 0) {
				return "没有变更，无需更改！";
			} else {
				ca.setCaid(coaId);
				ca.setInputdate(new Date());
				ca.setInputname(inputName);
				ca.setIsuse("1");
				for (String id : ids) {
					ca.setClassid(Integer.parseInt(id));
					dao.insertSelective(ca);

				}
				return "SUCCESS";
			}
			// 原本已有安排班级
		} else {
			List<Integer> idsList = cList.stream().map(Classes::getIndexid).collect(Collectors.toList());
			int leng = idsList.size();
			boolean flag = true;
			// 如果新增没有，则全部删除
			if (ids == null || ids.length == 0) {
				ClassArrangeExample example = new ClassArrangeExample();
				Criteria criteria = example.createCriteria();
				criteria.andCaidEqualTo(coaId);
				criteria.andClassidIn(idsList);
				dao.deleteByExample(example);
				
				
				
				return "SUCCESS";
				// 如果有新增的
			} else {
				for (String id : ids) {
					Integer i = Integer.parseInt(id);
					if (idsList.contains(i)) {
						idsList.remove(i);
					} else {
						ca.setClassid(i);
						ca.setCaid(coaId);
						ca.setIsuse("1");
						ca.setInputdate(new Date());
						ca.setInputname(inputName);
						dao.insertSelective(ca);
						flag = false;
					}
				}
				if (idsList.size() > 0) {
					ClassArrangeExample example2 = new ClassArrangeExample();
					Criteria criteria2 = example2.createCriteria();
					criteria2.andCaidEqualTo(coaId);
					criteria2.andClassidIn(idsList);
					dao.deleteByExample(example2);
				}

				if (leng == ids.length && flag) {
					return "没有变更，无需更改！";
				}

				return "SUCCESS";
			}
		}
	}

	// 获取所有教室安排列表
	public List<ClassArrange> getAllCourseArranges() {
		ClassArrangeExample caExample = new ClassArrangeExample();
		List<ClassArrange> lists = dao.selectByExample(caExample);
		return lists;

	}

	// 根据Id获取课程安排信息
	public ClassArrange getClassArrangeById(Integer caId) {
		return dao.selectByPrimaryKey(caId);
	}

	//根据教师Id获取所有课程信息
	public List<CourseArrange> getCourseByTeacherId(Teacher teacher){
		List<CourseArrange> list = coaDao.selectAllTeacherCourse(teacher.getIndexid());
		return list;
	}
	
	// 根据学生ID获取所有课程信息
	public List<CourseArrange> getCoursesByStudentId(Student student) {
		//班级Id
		Integer classid = student.getClassid();
		//如果没有班级Id，则返回null
		if (classid == null || classid.equals(0)) {
			return null;
		}
		//根据班级Id获取 课程安排信息
		ClassArrangeExample example = new ClassArrangeExample();
		Criteria criteria = example.createCriteria();
		criteria.andClassidEqualTo(classid);
		List<ClassArrange> claList = dao.selectByExample(example);
		List<Integer> coaIdList = claList.stream().map(ClassArrange::getCaid).collect(Collectors.toList());
		//如果没有课程安排 则返回null
		if (coaIdList == null || coaIdList.size() == 0) {
			return null;
		}
		//根据课程安排查找 课程Id
		CourseArrangeExample courseArrangeExample = new CourseArrangeExample();
		CourseArrangeExample.Criteria createCriteria = courseArrangeExample.createCriteria();
		createCriteria.andIndexidIn(coaIdList);
		List<CourseArrange> coaList = coaDao.selectByExample(courseArrangeExample);
	
		for (CourseArrange courseArrange : coaList) {
			
			EvaluationExample example2 = new EvaluationExample();
			EvaluationExample.Criteria criteria2 = example2.createCriteria();
			criteria2.andCaidEqualTo(courseArrange.getIndexid());
			criteria2.andSidEqualTo(student.getIndexid());
			List<Evaluation> list = evDao.selectByExample(example2);
			if(list==null||list.size()==0) {
				courseArrange.setSiseva(0);
			}else {
				courseArrange.setSiseva(1);
			}
			
			
		}
//		List<Integer> courseList = coaList.stream().map(CourseArrange::getCid).collect(Collectors.toList());
//		//如果没有课程 则返回null
//		if(courseList == null || courseList.size() == 0) {
//			return null;
//		}
//		CourseExample courseExample = new CourseExample();
//		CourseExample.Criteria courseCriteria = courseExample.createCriteria();
//		courseCriteria.andIndexidIn(courseList);
		return coaList;

	}
}
