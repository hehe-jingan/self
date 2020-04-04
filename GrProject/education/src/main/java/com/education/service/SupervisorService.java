package com.education.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.SupervisorMapper;
import com.education.dao.TeacherMapper;
import com.education.pojo.Supervisor;
import com.education.pojo.SupervisorExample;
import com.education.pojo.SupervisorExample.Criteria;
import com.education.pojo.Teacher;
import com.education.pojo.TeacherExample;
import com.mysql.jdbc.StringUtils;

@Service
public class SupervisorService {

	@Autowired
	private TeacherMapper teaDao;

	@Autowired
	private SupervisorMapper superDao;

	// 获取所有教师列表
	public List<Teacher> getAllTeachers() {
		TeacherExample teacherExample = new TeacherExample();
		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
		return teachers;

	}

	// 根据Id获取督导信息
	public Supervisor getSupervisorById(Integer superId) {
		return superDao.selectByPrimaryKey(superId);
	}

//	// 根据课程Id获取教师信息
//	public List<Teacher> getTeachersByCourseId(Integer courseId) {
//		// 获取所有课程教师关联信息
//		CourseArrangeExample caExample = new CourseArrangeExample();
//		com.education.pojo.CourseArrangeExample.Criteria caCriteria = caExample.createCriteria();
//		caCriteria.andCidEqualTo(courseId);
//		List<CourseArrange> caList = caDao.selectByExample(caExample);
//		// 获取所有教师Id
//		List<Integer> tidList = caList.stream().map(CourseArrange::getTid).collect(Collectors.toList());
//		// 如果该课程没有教师 则返回null
//		if (tidList == null || tidList.size() == 0) {
//			return null;
//		}
//		TeacherExample teacherExample = new TeacherExample();
//		Criteria criteria = teacherExample.createCriteria();
//		criteria.andIndexidIn(tidList);
//		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
//		return teachers;
//	}

//	// 根据课程Id获取没有该课程的教师信息
//	public List<Teacher> getNoTeachersByCourseId(Integer courseId) {
//		// 获取所有课程教师关联信息
//		CourseArrangeExample caExample = new CourseArrangeExample();
//		com.education.pojo.CourseArrangeExample.Criteria caCriteria = caExample.createCriteria();
//		caCriteria.andCidEqualTo(courseId);
//		List<CourseArrange> caList = caDao.selectByExample(caExample);
//		// 获取所有教师Id
//		List<Integer> tidList = caList.stream().map(CourseArrange::getTid).collect(Collectors.toList());
//		TeacherExample teacherExample = new TeacherExample();
//		// 如果该课程没有教师 则返回全部教师
//		if (tidList == null || tidList.size() == 0) {
//			return teaDao.selectByExample(teacherExample);
//		}
//		Criteria criteria = teacherExample.createCriteria();
//		criteria.andIndexidNotIn(tidList);
//		List<Teacher> teachers = teaDao.selectByExample(teacherExample);
//		return teachers;
//	}

	// 修改密码
	public String changePass(Supervisor user, String newPass, String oldPass, HttpServletRequest request) {

		if (!oldPass.equals(user.getPass())) {
			return "旧密码错误，请重试！";
		}

		user.setPass(newPass);
		int result = superDao.updateByPrimaryKeySelective(user);

		if (result == 1) {
			request.getSession().setAttribute("supervisor", superDao.selectByPrimaryKey(user.getIndexid()));
			return "success";
		}
		return "修改密码失败，请重试";

	}

	// 督导登录
	public String login(String loginAccount, String loginPass, HttpServletRequest request) {
		if (StringUtils.isNullOrEmpty(loginAccount)) {
			return "用户名不能为空！";
		}
		if (StringUtils.isNullOrEmpty(loginPass)) {
			return "密码不能为空！！";
		}
		SupervisorExample example = new SupervisorExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(loginAccount);
		List<Supervisor> sup = superDao.selectByExample(example);
		if (sup.size() != 1) {
			if (sup.size() != 1) {
				SupervisorExample example2 = new SupervisorExample();
				Criteria criteria2 = example2.createCriteria();
				criteria2.andSpare1EqualTo(loginAccount);
				sup = superDao.selectByExample(example2);
				if(sup.size() != 1) {
					return "用户名错误！！！";
				}
			}		
		}

		if (!sup.get(0).getPass().equals(loginPass)) {
			return "密码错误！！！！";
		}
		Supervisor t = sup.get(0);
		t.setLastlogindate(new Date());
		superDao.updateByPrimaryKeySelective(t);
		request.getSession().setAttribute("supervisor", t);
		return "SUCCESS";
	}

	// 删除督导
	public String deleteSupervisor(Integer supervisorId) {
		SupervisorExample example = new SupervisorExample();
		int count = superDao.countByExample(example);
		if (count == 1) {
			return "督导仅剩一位，不能删除！！";
		}
		if (superDao.selectByPrimaryKey(supervisorId) == null) {
			return "督导不存在请刷新重试！！";
		}

		int result = superDao.deleteByPrimaryKey(supervisorId);
		return result == 1 ? "SUCCESS" : "未知错误，请刷新重试！";

	}

	// 新增督导
	public String addSupervisor(String supervisorName, String supervisorPass,String spare1) {
		
		SupervisorExample example = new SupervisorExample();
		Criteria criteria = example.createCriteria();
		criteria.andSpare1EqualTo(spare1);
		int count = superDao.countByExample(example);
		if(count != 0) {
			return "督导号已存在，请重新输入！！！";
			
		}
		
		
		Supervisor supervisor = new Supervisor();
		supervisor.setName(supervisorName);
		supervisor.setPass(supervisorPass);
		int result = superDao.insertSelective(supervisor);

		return result == 1 ? "SUCCESS" : "ERROR";
	}

	// 获取所有督导
	public List<Supervisor> getAllSupervisor() {
		SupervisorExample example = new SupervisorExample();
		List<Supervisor> result = superDao.selectByExample(example);
		return result;
	}

}
