package cn.as.service.impl;

import cn.as.dao.AppTypeMapper;
import cn.as.pojo.AppType;
import cn.as.service.AppTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AppTypeServiceImpl implements AppTypeService {

    @Resource
    private AppTypeMapper appTypeMapper;

    @Override
    public List<AppType> findAppTypeByParent(int id) {
        return appTypeMapper.selectAppTypeByParent(id);
    }

    @Override
    public List<AppType> findAllAppType() {
        return appTypeMapper.selectAllAppType();
    }

    @Override
    public AppType findAppTypeById(int id) {
        return appTypeMapper.selectAppTypeById(id);
    }
}
