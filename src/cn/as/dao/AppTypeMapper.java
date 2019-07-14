package cn.as.dao;

import cn.as.pojo.AppType;

import java.util.List;

public interface AppTypeMapper {

    List<AppType> selectAllAppType();//查询所有数据
    List<AppType> selectAppTypeByParent(int id);//根据parentId查询数据
    AppType selectAppTypeById(int id);//根据id查询数据

}
