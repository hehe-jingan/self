package com.education.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Evaluation {
	private Integer indexid;

	private Integer sid;

	private Integer caid;

	private BigDecimal score;
	
	private BigDecimal evatotal;
	
	private BigDecimal evaavg;
	
	private Integer evacount;

	private String content;

	private String clName;

	
	private String year;

	private String isDelete;

	private Date inputdate;

	private String inputname;

	private Date modifydate;

	private String modifyname;

	private String spare1;

	private String spare2;

	private Teacher teacher;

	private Course course;

	private Student student;

	public Integer getCaid() {
		return caid;
	}

	public String getContent() {
		return content;
	}

	public Course getCourse() {
		return course;
	}

	public BigDecimal getEvaavg() {
		return evaavg;
	}

	public Integer getEvacount() {
		return evacount;
	}

	public BigDecimal getEvatotal() {
		return evatotal;
	}

	public Integer getIndexid() {
		return indexid;
	}

	public Date getInputdate() {
		return inputdate;
	}

	public String getInputname() {
		return inputname;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public String getModifyname() {
		return modifyname;
	}

	public BigDecimal getScore() {
		return score;
	}

	public Integer getSid() {
		return sid;
	}

	public String getSpare1() {
		return spare1;
	}

	public String getSpare2() {
		return spare2;
	}

	public Student getStudent() {
		return student;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public String getYear() {
		return year;
	}

	public void setCaid(Integer caid) {
		this.caid = caid;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public void setEvaavg(BigDecimal evaavg) {
		this.evaavg = evaavg;
	}

	public void setEvacount(Integer evacount) {
		this.evacount = evacount;
	}

	public void setEvatotal(BigDecimal evatotal) {
		this.evatotal = evatotal;
	}

	public void setIndexid(Integer indexid) {
		this.indexid = indexid;
	}

	public void setInputdate(Date inputdate) {
		this.inputdate = inputdate;
	}

	public void setInputname(String inputname) {
		this.inputname = inputname == null ? null : inputname.trim();
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete == null ? null : isDelete.trim();
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public void setModifyname(String modifyname) {
		this.modifyname = modifyname == null ? null : modifyname.trim();
	}

	public void setScore(BigDecimal score) {
		this.score = score;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public void setSpare1(String spare1) {
		this.spare1 = spare1 == null ? null : spare1.trim();
	}

	public void setSpare2(String spare2) {
		this.spare2 = spare2 == null ? null : spare2.trim();
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public void setYear(String year) {
		this.year = year == null ? null : year.trim();
	}

	/**
	 * @return the clName
	 */
	public String getClName() {
		return clName;
	}

	/**
	 * @param clName the clName to set
	 */
	public void setClName(String clName) {
		this.clName = clName;
	}
}