package cn.as.service.impl;

import cn.as.dao.StateMapper;
import cn.as.pojo.State;
import cn.as.service.StateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StateServiceImpl implements StateService {

    @Resource
    private StateMapper stateMapper;

    @Override
    public List<State> findAllState() {
        return stateMapper.selectAllState();
    }

    @Override
    public State findStateById(int id) {
        return stateMapper.selectStateById(id);
    }
}
