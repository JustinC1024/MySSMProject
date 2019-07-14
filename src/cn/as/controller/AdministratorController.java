package cn.as.controller;


import cn.as.pojo.Admin;
import cn.as.pojo.AppInfo;
import cn.as.pojo.AppVersion;
import cn.as.service.AdminService;
import cn.as.service.AppInfoService;
import cn.as.service.AppVersionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping(value = "/administrator")
public class AdministratorController {

    @Resource
    private AppInfoService appInfoService;
    @Resource
    private AdminService adminService;
    @Resource
    private AppVersionService appVersionService;

    //审核app
    @RequestMapping(value = "/passApp/{id}/{sta}")
    public String passApp(@PathVariable int id,@PathVariable int sta,Model model){
        List<AppVersion> avl=appVersionService.findAppVersionByAppInfo(id);
        if (avl.size()>0) {
            if (appInfoService.updateAppInfoByState(id,sta)){
                model.addAttribute("msg", "操作成功");
                return "redirect:/user/index";
            }else{
                model.addAttribute("msg","操作失败");
                return "redirect:/user/index";
            }
        }else {
            model.addAttribute("msg","操作失败");
            return "redirect:/user/index";
        }
    }

    //查看开发者
    @RequestMapping(value = "/admIndex")
    public String adminIndwx(Model model){
        List<Admin> al=adminService.findAllAdmin();
        model.addAttribute("admin",al);
        return "adm/adminList";
    }

    //开发者详情
    @RequestMapping(value = "admDetail/{code}")
    public String admDetail(@PathVariable String code,Model model){
        Admin a=adminService.findAdminByCode(code,1);
        model.addAttribute("admin",a);
        return "adm/admDetail";
    }

    // 冻结开发者
    @RequestMapping(value = "/freeze/{code}/{sta}")
    public String freezeAdmin(@PathVariable String code,@PathVariable int sta, Model model){
        if (adminService.updateAdminState(code,sta)){
            if (sta==7){
                model.addAttribute("msg","冻结成功");
            }else {
                model.addAttribute("msg","解封成功");
            }
        }else {
            model.addAttribute("msg","操作失败");
        }
        return "redirect:/administrator/admIndex";
    }

    @RequestMapping(value = "/freeze")
    public String freeze1Admin(String code,int sta, Model model){
        if (adminService.updateAdminState(code,sta)){
            if (sta==7){
                model.addAttribute("msg","冻结成功");
            }else {
                model.addAttribute("msg","解封成功");
            }
        }else {
            model.addAttribute("msg","操作失败");
        }
        return "redirect:/administrator/admDetail/"+code;
    }

    //删除开发者
    @RequestMapping(value = "/delAdmin/{id}/{code}")
    public String delAdmin(@PathVariable int id,@PathVariable String code,Model model){
        List<AppInfo> ail=appInfoService.findAppInfoByAdmin(id);
        for (AppInfo ai:ail){
            List<AppVersion> avl=appVersionService.findAppVersionByAppInfo(ai.getAId());
            for (AppVersion av:avl){
                appVersionService.deleAppVersion(av.getId());
            }
            appInfoService.deleAppInfo(ai.getId());
        }
        if (adminService.deleAdmin(code)){
            model.addAttribute("msg","删除成功");
            return "redirect:/administrator/admIndex";
        }else {
            model.addAttribute("msg","删除失败");
            return "redirect:/administrator/admDetail/"+code;
        }
    }
}
