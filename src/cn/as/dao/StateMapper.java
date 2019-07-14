package cn.as.dao;

import cn.as.pojo.State;

import java.util.List;

public interface StateMapper {

    List<State> selectAllState();//查询所有数据
    State selectStateById(int id);//根据id查询数据

}
