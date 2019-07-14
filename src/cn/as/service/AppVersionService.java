package cn.as.service;

import cn.as.pojo.AppVersion;

import java.util.List;

public interface AppVersionService {

    boolean doAppVersion(AppVersion appVersion);//开发者添加app新版本
    boolean deleAppVersion(int id);//开发者删除app版本 & 开发者删除app
    List<AppVersion> findAppVersionByAppInfo(int id);//用户查看app
    AppVersion findAppVersionById(int id);//根据主键查找

    AppVersion findAppVersionFirstBy(int id);//主页效果

}
