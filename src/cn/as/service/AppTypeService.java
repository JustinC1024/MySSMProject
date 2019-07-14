package cn.as.service;

import cn.as.pojo.AppType;

import java.util.List;

public interface AppTypeService {

    public List<AppType> findAppTypeByParent(int id);//搜索条件 & 开发者开发app
    public List<AppType> findAllAppType();//下拉框内容
    public AppType findAppTypeById(int id);//主键查找

}
