package com.education.pojo;

import java.util.Date;

public class BookContent {
    private Integer id;

    private Integer bookid;

    private Integer userid;

    private String contentval;

    private Date contentdate;

    private String spare1;

    private String spare2;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContentval() {
        return contentval;
    }

    public void setContentval(String contentval) {
        this.contentval = contentval == null ? null : contentval.trim();
    }

    public Date getContentdate() {
        return contentdate;
    }

    public void setContentdate(Date contentdate) {
        this.contentdate = contentdate;
    }

    public String getSpare1() {
        return spare1;
    }

    public void setSpare1(String spare1) {
        this.spare1 = spare1 == null ? null : spare1.trim();
    }

    public String getSpare2() {
        return spare2;
    }

    public void setSpare2(String spare2) {
        this.spare2 = spare2 == null ? null : spare2.trim();
    }
}