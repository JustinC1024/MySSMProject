package cn.as.dao;

import cn.as.pojo.Type;

import java.util.List;

public interface TypeMapper {

    List<Type> selectAllType();//查询所有数据
    Type selectTypeById(int id);//根据id查询数据

}
