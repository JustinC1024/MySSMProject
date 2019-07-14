package cn.as.service;

import cn.as.pojo.Admin;

import java.util.List;

public interface AdminService {

    public boolean doAdmin(Admin admin);//开发者注册
    public boolean deleAdmin(String code);//管理员删除开发者
    public boolean updateAdmin(Admin admin);//用户修改信息
    public boolean updateAdminState(String code,int state);//管理员管理开发者
    public Admin findAdminByCode(String code,int type);//用户登录 & 用户修改信息
    public List<Admin> findAllAdmin();//管理员查看开发者
    public List<Admin> findAdminByState(int state);//管理员搜索开发者
    public Admin findAdminById(int id);//主键查找

    public List<Admin> findAllAdmin1(int start,int end);//用户列表（分页）

}
