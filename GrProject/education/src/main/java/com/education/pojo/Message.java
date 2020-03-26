package com.education.pojo;

public class Message {
    private Integer messageid;

    private String messtype;

    private Integer messid;

    private String content;

    private String messflag;

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
    }

    public String getMesstype() {
        return messtype;
    }

    public void setMesstype(String messtype) {
        this.messtype = messtype == null ? null : messtype.trim();
    }

    public Integer getMessid() {
        return messid;
    }

    public void setMessid(Integer messid) {
        this.messid = messid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getMessflag() {
        return messflag;
    }

    public void setMessflag(String messflag) {
        this.messflag = messflag == null ? null : messflag.trim();
    }
}