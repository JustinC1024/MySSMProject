package cn.as.service.impl;

import cn.as.dao.AppVersionMapper;
import cn.as.pojo.AppVersion;
import cn.as.service.AppVersionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AppVersionServiceImpl implements AppVersionService {

    @Resource
    private AppVersionMapper appVersionMapper;

    @Override
    public boolean doAppVersion(AppVersion appVersion) {
        if (appVersionMapper.addAppVersion(appVersion)>0)return true;
        else return false;
    }

    @Override
    public boolean deleAppVersion(int id) {
        if (appVersionMapper.deleAppVersion(id)>0)return true;
        else return false;
    }

    @Override
    public List<AppVersion> findAppVersionByAppInfo(int id) {
        return appVersionMapper.selectAppVersionByAppInfo(id);
    }

    @Override
    public AppVersion findAppVersionById(int id) {
        return appVersionMapper.selectAppVersionById(id);
    }

    @Override
    public AppVersion findAppVersionFirstBy(int id) {
        return appVersionMapper.selectAppVersionFirstBy(id);
    }
}
