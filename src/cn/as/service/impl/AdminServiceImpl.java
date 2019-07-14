package cn.as.service.impl;

import cn.as.dao.AdminMapper;
import cn.as.pojo.Admin;
import cn.as.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public boolean doAdmin(Admin admin) {
        if(adminMapper.addAdmin(admin)>0)return true;
        else return false;
    }

    @Override
    public boolean deleAdmin(String code) {
        if (adminMapper.deleAdmin(code)>0)return true;
        else return false;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        if (adminMapper.updateAdmin(admin)>0)return true;
        else return false;
    }

    @Override
    public boolean updateAdminState(String code, int state) {
        if (adminMapper.updateAdminState(code,state)>0)return true;
        else return false;
    }

    @Override
    public Admin findAdminByCode(String code, int type) {
        return adminMapper.selectAdminByCode(code,type);
    }

    @Override
    public List<Admin> findAllAdmin() {
        return adminMapper.selectAllAdmin();
    }

    @Override
    public List<Admin> findAdminByState(int state) {
        return adminMapper.selectAdminByState(state);
    }

    @Override
    public Admin findAdminById(int id) {
        return adminMapper.selectAdminById(id);
    }

    @Override
    public List<Admin> findAllAdmin1(int start,int end) {
        return adminMapper.selectAllAdmin1(start,end);
    }
}
