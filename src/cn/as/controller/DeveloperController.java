package cn.as.controller;

import cn.as.pojo.Admin;
import cn.as.pojo.AppInfo;
import cn.as.pojo.AppType;
import cn.as.pojo.AppVersion;
import cn.as.service.AdminService;
import cn.as.service.AppInfoService;
import cn.as.service.AppTypeService;
import cn.as.service.AppVersionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/developer")
public class DeveloperController {

    @Resource
    private AdminService adminService;
    @Resource
    private AppInfoService appInfoService;
    @Resource
    private AppVersionService appVersionService;
    @Resource
    private AppTypeService appTypeService;

    //注册
    @RequestMapping(value = "/replyDoDev")
    public String repluDoDev(){
        return "dev/regist";
    }

    @RequestMapping(value = "/doDev")
    public String doDev(Admin admin,Model model){
        if (admin==null){
            return "dev/regist";
        }else {
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            admin.setCreationDate(Timestamp.valueOf(sdf.format(new Date())));
            if (adminService.doAdmin(admin)){
                model.addAttribute("msg","注册成功");
                return "login";
            }else {
                model.addAttribute("msg","注册失败");
                return "dev/regist";
            }
        }
    }

    //发布app
    @RequestMapping(value = "/replyDoApp")
    public String replyDoApp(){
        return "dev/doApp";
    }

    @RequestMapping(value = "/doApp")
    public String doApp(AppInfo appInfo,Model model){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        appInfo.setCreationDate(Timestamp.valueOf(sdf.format(new Date())));
        if (appInfoService.doAppInfo(appInfo)){
            model.addAttribute("msg","发布成功");
            return "redirect:/user/index";
        }else{
            model.addAttribute("msg","发布失败");
            return "dev/doApp";
        }
    }

    //更改app信息
    @RequestMapping(value = "/replyUpdateApp")
    public String replyUpdateApp(int id,Model model){
        AppInfo ai=appInfoService.findAppInfoById(id);
        AppType at=appTypeService.findAppTypeById(ai.getAtId());
        AppType at1=appTypeService.findAppTypeById(at.getParentId());
        AppType at2=appTypeService.findAppTypeById(at1.getParentId());
        model.addAttribute("app",ai);
        model.addAttribute("appts",at1);
        model.addAttribute("apptf",at2);
        return "dev/updateApp";
    }

    @RequestMapping(value = "/updateApp")
    public String updateApp(AppInfo appInfo,Model model){
        if (appInfoService.updateAppInfo(appInfo)){
            model.addAttribute("msg","更改成功");
            return "redirect:/user/appDetail/"+appInfo.getId();
        }else {
            model.addAttribute("msg","更改失败");
            return "redirect:/developer/replyUpdateApp/"+appInfo.getId();
        }
    }

    //更改app状态
    @RequestMapping(value = "/updateState/{id}/{state}")
    public String updateState(@PathVariable int id,@PathVariable int state){
        appInfoService.updateAppInfoByState(id,state);
        return "redirect:/user/index";
    }

    //删除app
    @RequestMapping(value = "/delApp/{id}")
    public String delApp(@PathVariable int id, Model model){
        List<AppVersion> avl=appVersionService.findAppVersionByAppInfo(id);
        for (AppVersion av:avl){
            appVersionService.deleAppVersion(av.getId());
        }
        if (appInfoService.deleAppInfo(id)){
            model.addAttribute("msg","删除成功");
        }else {
            model.addAttribute("msg","删除失败");
        }
        return "redirect:/user/index";
    }

    @RequestMapping(value = "/delApp")
    public String delApp1(int id, Model model){
        List<AppVersion> avl=appVersionService.findAppVersionByAppInfo(id);
        for (AppVersion av:avl){
            appVersionService.deleAppVersion(av.getId());
        }
        if (appInfoService.deleAppInfo(id)){
            model.addAttribute("msg","删除成功");
        }else {
            model.addAttribute("msg","删除失败");
        }
        return "redirect:/user/appDetail/"+id;
    }

    //增加版本
    @RequestMapping(value = "/replyDoAppVersion/{id}")
    public String replyDoAppVersion(@PathVariable int id, Model model){
        model.addAttribute("ap",id);
        return "dev/doAppVersion";
    }

    @RequestMapping(value = "/doAppVersion")
    public String doAppVersion(AppVersion appVersion,Model model){
        if (appVersionService.doAppVersion(appVersion)){
            model.addAttribute("msg","增加成功");
            return "redirect:/user/appDetail/"+appVersion.getAiId();
        }else {
            model.addAttribute("msg","增加失败");
            return "dev/doAppVersion";
        }
    }

    //删除版本
    @RequestMapping(value = "/deleAppVersion/{id}")
    public String deleAppVersion(@PathVariable int id,Model model){
        AppVersion av=appVersionService.findAppVersionById(id);
        if (appVersionService.deleAppVersion(id)){
            model.addAttribute("msg","删除成功");
        }else{
            model.addAttribute("msg","删除失败");
        }
        return "redirect:/user/appDetail/"+av.getAiId();
    }

    //上传
    @RequestMapping(value = "/doAppVersion1")
    public String doAppVersion1(AppVersion appVersion, MultipartFile file,
                                       HttpServletRequest request, Model model){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        appVersion.setCreationDate(Timestamp.valueOf(sdf.format(new Date())));
        // 获得原始文件名
        file.getOriginalFilename();
        appVersion.setApkFileName(file.getOriginalFilename());
        // 获得项目的路径
        ServletContext sc = request.getSession().getServletContext();
        // 上传位置
        appVersion.setApkLocPath(sc.getRealPath("statics/uploadfiles"));

        appVersion.setDownloadLink("/download");
        // 设定文件保存的目录
        File dir = new File(appVersion.getApkLocPath(),appVersion.getApkFileName());
        if(!dir.exists()){
            dir.mkdirs();
        }
        try {
            file.transferTo(dir);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Date modifyDate = new Date();
        boolean flag = appVersionService.doAppVersion(appVersion);
        if (flag == true){
            request.setAttribute("msg","修改成功");

        }else {
            request.setAttribute("msg","修改失败");
        }
        return "redirect:/user/appDetail/"+appVersion.getAiId();
    }
}
