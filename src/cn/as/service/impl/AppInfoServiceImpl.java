package cn.as.service.impl;

import cn.as.dao.AppInfoMapper;
import cn.as.pojo.AppInfo;
import cn.as.service.AppInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AppInfoServiceImpl implements AppInfoService {

    @Resource
    private AppInfoMapper appInfoMapper;

    @Override
    public boolean doAppInfo(AppInfo appInfo) {
        if (appInfoMapper.addAppInfo(appInfo)>0)return true;
        else return false;
    }

    @Override
    public boolean deleAppInfo(int id) {
        if (appInfoMapper.deleAppInfo(id)>0)return true;
        else return false;
    }

    @Override
    public boolean updateAppInfo(AppInfo appInfo) {
        if (appInfoMapper.updateAppInfo(appInfo)>0)return true;
        else return false;
    }

    @Override
    public boolean updateAppInfoByState(int id, int state) {
        if (appInfoMapper.updateAppInfoByState(id,state)>0)return true;
        else return false;
    }

    @Override
    public List<AppInfo> findAllAppInfo() {
        return appInfoMapper.selectAllAppInfo();
    }

    @Override
    public List<AppInfo> findAppInfoByAdmin(int id) {
        return appInfoMapper.selectAppInfoByAdmin(id);
    }

    @Override
    public List<AppInfo> findAppInfoByState(int id) {
        return appInfoMapper.selectAppInfoByState(id);
    }

    @Override
    public List<AppInfo> findAppInfoByType(int id) {
        return appInfoMapper.selectAppInfoByType(id);
    }

    @Override
    public List<AppInfo> findAppInfoByName(String name) {
        return appInfoMapper.selectAppInfoByName(name);
    }

    @Override
    public AppInfo findAppInfoById(int id) {
        return appInfoMapper.selectAppInfoById(id);
    }

    @Override
    public List<AppInfo> findAllAppInfo1(int start, int end) {
        return appInfoMapper.selectAllAppInfo1(start,end);
    }

    @Override
    public List<AppInfo> findAppInfoBy1(String name, int state, int type, int flatformId, int start, int end) {
        return appInfoMapper.selectAppInfoBy1(name,state,type,flatformId,start,end);
    }
}
