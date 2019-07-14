package cn.as.dao;

import cn.as.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

    int addAppInfo(AppInfo appInfo);//增加数据
    int deleAppInfo(int id);//根据id删除数据
    int updateAppInfo(AppInfo appInfo);//更新数据
    int updateAppInfoByState(@Param("id") int id, @Param("state") int state);//根据id更新数据
    List<AppInfo> selectAllAppInfo();//查询所有数据
    List<AppInfo> selectAppInfoByAdmin(int id);//根据aId查询数据
    List<AppInfo> selectAppInfoByState(int id);//根据sId查询数据
    List<AppInfo> selectAppInfoByType(int id);//根据atId查询数据
    List<AppInfo> selectAppInfoByName(String name);//根据aiNam模糊查询
    AppInfo selectAppInfoById(int id);//根据id查询数据

    List<AppInfo> selectAllAppInfo1(@Param("start")int start,@Param("end")int end);//分页查询
    List<AppInfo> selectAppInfoBy1(
            @Param("name")String name,
            @Param("state")int state,
            @Param("type")int type,
            @Param("flatformId")int flatformId,
            @Param("start")int start,@Param("end")int end);//分页条件查询

}
