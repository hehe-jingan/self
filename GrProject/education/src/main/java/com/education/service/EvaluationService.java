package com.education.service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.education.dao.CourseArrangeMapper;
import com.education.dao.EvaluationMapper;
import com.education.pojo.CourseArrange;
import com.education.pojo.CourseArrangeExample;
import com.education.pojo.Evaluation;
import com.education.pojo.EvaluationExample;
import com.education.pojo.EvaluationExample.Criteria;

@Service
public class EvaluationService {

	@Autowired
	private EvaluationMapper dao;

	@Autowired
	private CourseArrangeMapper coaDao;

	public List<Evaluation> getAllEvaByGroupBy(List<String> val,String year,Integer coId,Integer clId,Integer tId) {
		List<Evaluation> list = dao.selectAllEvaGroupBy(val,year,coId,clId,tId);
		return list;
	}

	// 删除评价
	public String deleteEvaluation(Integer evId) {
		return dao.deleteByPrimaryKey(evId) == 1 ? "SUCCESS" : "ERROR";
	}

	// 管理员修改评价
	public String editEvaluation(Evaluation evaluation, String inputName) {
		evaluation.setModifydate(new Date());
		evaluation.setModifyname(inputName);
		return dao.updateByPrimaryKeySelective(evaluation) == 1 ? "SUCCESS" : "ERROR";
	}

	// 新增评价
	public String addNewEvaluation(Evaluation evaluation, String inputName) {
		evaluation.setIsDelete("0");
		evaluation.setInputdate(new Date());
		evaluation.setInputname(inputName);
		return dao.insertSelective(evaluation) == 1 ? "SUCCESS" : "ERROR";
	}

	// 根据教师Id获取全部评价
	public List<Evaluation> getAllEvaluationByTeacherId(Integer teaId) {
		CourseArrangeExample example = new CourseArrangeExample();
		CourseArrangeExample.Criteria criteria = example.createCriteria();
		criteria.andTidEqualTo(teaId);
		List<CourseArrange> coaList = coaDao.selectByExample(example);
		if (coaList == null || coaList.size() == 0) {
			return null;
		}
		List<Integer> coaIds = coaList.stream().map(CourseArrange::getIndexid).collect(Collectors.toList());
		EvaluationExample example2 = new EvaluationExample();
		Criteria criteria2 = example2.createCriteria();
		criteria2.andCaidIn(coaIds);
		return dao.selectByExample(example2);

	}

	// 根据学生Id获取全部评价
	public List<Evaluation> getAllEvalationsByStudentId(Integer stuId) {
		EvaluationExample example = new EvaluationExample();
		Criteria criteria = example.createCriteria();
		criteria.andScoreIsNotNull();
		criteria.andSidEqualTo(stuId);
		return dao.selectByExample(example);
	}

	// 获取所有评价列表通过条件
	public List<Evaluation> getAllEvalationsByFilter(String chooseYear, Integer chooseCourse) {
		EvaluationExample example = new EvaluationExample();
		Criteria criteria = example.createCriteria();
		if(!(StringUtils.isEmpty(chooseYear.trim())||"all".equals(chooseYear))) {
			criteria.andYearEqualTo(chooseYear);
		}
		if(chooseCourse!=null&&(!(new Integer(0).equals(chooseCourse)))) {
			CourseArrangeExample example2 = new CourseArrangeExample();
			com.education.pojo.CourseArrangeExample.Criteria criteria2 = example2.createCriteria();
			criteria2.andCidEqualTo(chooseCourse);
			List<CourseArrange> listc = coaDao.selectByExample(example2);
			List<Integer> coaIds = listc.stream().map(CourseArrange::getIndexid).collect(Collectors.toList());
			criteria.andCaidIn(coaIds);
		}
		
		return dao.selectByExample(example);
	}

	// 获取所有评价列表
	public List<Evaluation> getAllEvalations() {
		EvaluationExample example = new EvaluationExample();
		return dao.selectByExample(example);
	}

	// 根据Id获取评价信息
	public Evaluation getEvaluationByEvId(Integer evId) {
		return dao.selectByPrimaryKey(evId);
	}

}
