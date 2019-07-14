package cn.as.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Admin {

    private Integer id;//主键id
    private String aCode;//登录账号
    private String aName;//用户昵称
    private String aPassword;//用户密码
    private Integer tId;//类型id
    private String aEmail;//用户邮箱
    private String aInfo;//用户简介
    private Integer sId;//用户状态
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date creationDate;//创建时间

    public Integer getSId() {
        return sId;
    }

    public void setSId(Integer sId) {
        this.sId = sId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getACode() {
        return aCode;
    }

    public void setACode(String aCode) {
        this.aCode = aCode;
    }

    public String getAName() {
        return aName;
    }

    public void setAName(String aName) {
        this.aName = aName;
    }

    public String getAPassword() {
        return aPassword;
    }

    public void setAPassword(String aPassword) {
        this.aPassword = aPassword;
    }

    public Integer getTId() {
        return tId;
    }

    public void setTId(Integer tId) {
        this.tId = tId;
    }

    public String getAEmail() {
        return aEmail;
    }

    public void setAEmail(String aEmail) {
        this.aEmail = aEmail;
    }

    public String getAInfo() {
        return aInfo;
    }

    public void setAInfo(String aInfo) {
        this.aInfo = aInfo;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
}
