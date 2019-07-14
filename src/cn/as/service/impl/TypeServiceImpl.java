package cn.as.service.impl;

import cn.as.dao.TypeMapper;
import cn.as.pojo.Type;
import cn.as.service.TypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Resource
    private TypeMapper typeMapper;

    @Override
    public List<Type> findAllType() {
        return typeMapper.selectAllType();
    }

    @Override
    public Type findTypeById(int id) {
        return typeMapper.selectTypeById(id);
    }
}
