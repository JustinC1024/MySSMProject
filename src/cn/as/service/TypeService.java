package cn.as.service;

import cn.as.pojo.Type;

import java.util.List;

public interface TypeService {

    List<Type> findAllType();//用户类型
    Type findTypeById(int id);//根据主键查找

}
