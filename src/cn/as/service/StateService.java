package cn.as.service;

import cn.as.pojo.State;

import java.util.List;

public interface StateService {

    List<State> findAllState();//更改app状态
    State findStateById(int id);//根据主键查找

}
