package cn.as.service;

import cn.as.pojo.AppInfo;

import java.util.List;

public interface AppInfoService {

    public boolean doAppInfo(AppInfo appInfo);//开发者开发app
    public boolean deleAppInfo(int id);//开发者删除app
    public boolean updateAppInfo(AppInfo appInfo);//开发者修改app信息
    public boolean updateAppInfoByState(int id,int state);//管理员审核app
    public List<AppInfo> findAllAppInfo();//用户查看app
    public List<AppInfo> findAppInfoByAdmin(int id);//开发者查看自己作品 & 管理员查询
    public List<AppInfo> findAppInfoByState(int id);//用户查询特定状态的app
    public List<AppInfo> findAppInfoByType(int id);//用户查询特定类型的app
    public List<AppInfo> findAppInfoByName(String name);//搜索框功能
    public AppInfo findAppInfoById(int id);//修改app信息

    List<AppInfo> findAllAppInfo1(int start,int end);//主页（分页）
    List<AppInfo> findAppInfoBy1(String name,int state,int type,int flatformId,
                                   int start,int end);//搜索框（分页）
}
