package com.education.pojo;

import java.util.Date;

public class Classes {
    private Integer indexid;

    private String name;

    private String isuse;

    private Date inputdate;

    private String inputname;

    private Date modifydate;

    private String modifyname;

    private Date spare1;

    private String spare2;
    
    private Integer stucount;

    public Integer getIndexid() {
        return indexid;
    }

    public void setIndexid(Integer indexid) {
        this.indexid = indexid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIsuse() {
        return isuse;
    }

    public void setIsuse(String isuse) {
        this.isuse = isuse == null ? null : isuse.trim();
    }

    public Date getInputdate() {
        return inputdate;
    }

    public void setInputdate(Date inputdate) {
    	 this.inputdate = inputdate;
    }

    public String getInputname() {
        return inputname;
    }

    public void setInputname(String inputname) {
        this.inputname = inputname == null ? null : inputname.trim();
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public String getModifyname() {
        return modifyname;
    }

    public void setModifyname(String modifyname) {
        this.modifyname = modifyname == null ? null : modifyname.trim();
    }

    public Date getSpare1() {
        return spare1;
    }

    public void setSpare1(Date spare1) {
        this.spare1 = spare1;
    }

    public String getSpare2() {
        return spare2;
    }

    public void setSpare2(String spare2) {
        this.spare2 = spare2 == null ? null : spare2.trim();
    }

	public Integer getStucount() {
		return stucount;
	}

	public void setStucount(Integer stucount) {
		this.stucount = stucount;
	}
}