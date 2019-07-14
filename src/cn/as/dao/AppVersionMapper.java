package cn.as.dao;

import cn.as.pojo.AppVersion;

import java.util.List;

public interface AppVersionMapper {

    int addAppVersion(AppVersion appVersion);//增加数据
    int deleAppVersion(int id);//删除数据
    List<AppVersion> selectAppVersionByAppInfo(int id);//根据aiId查询数据
    AppVersion selectAppVersionById(int id);//根据id查询数据
    AppVersion selectAppVersionFirstBy(int id);//查询第一条

}
