package cn.as.dao;

import cn.as.pojo.Admin;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface AdminMapper {

    int addAdmin(Admin admin);//增加数据
    int deleAdmin(String code);//根据aCode删除数据
    int updateAdmin(Admin admin);//更新数据
    int updateAdminState(@Param("code") String code,@Param("state") int state);//根据aCode更新数据
    Admin selectAdminByCode(@Param("code") String code,@Param("type") int type);//根据aCode和tId查询数据
    List<Admin> selectAllAdmin();//查询特定类型数据
    List<Admin> selectAdminByState(int state);//根据sId查询数据
    Admin selectAdminById(int id);//根据id查询数据

    List<Admin> selectAllAdmin1(@Param("start")int start,@Param("end")int end);//分页查询

}
