package cn.as.controller;

import cn.as.pojo.*;
import cn.as.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;


@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private AdminService adminService;
    @Resource
    private AppInfoService appInfoService;
    @Resource
    private AppTypeService appTypeService;
    @Resource
    private AppVersionService appVersionService;
    @Resource
    private StateService stateService;
    @Resource
    private TypeService typeService;

    public Pages initPage(){
        Pages p=new Pages();
        p.setCount(2);
        p.setTotal(appInfoService.findAllAppInfo().size());
        p.setNum(p.getTotal()%p.getCount()==0?
                p.getTotal()/p.getCount():
                p.getTotal()/p.getCount()+1);
        p.setNow(1);
        return p;
    }

    //登录
    @RequestMapping(value = "/replyLogin/{id}")
    public String replyLogin(@PathVariable int id,String msg,HttpSession session,Model model){
        if (id==1){
            session.setAttribute("flag",1);
            session.setAttribute("title","APP开发者平台");
        }else {
            session.setAttribute("flag",2);
            session.setAttribute("title","后台管理系统");
        }
        model.addAttribute("msg",msg);
        return "login";
    }

    @RequestMapping(value = "/login")
    public String login(String  code, String password, int type,
                        Model model, HttpSession session){
        Admin a=adminService.findAdminByCode(code,type);
        if (a!=null){
            if (a.getAPassword().equals(password)){
                session.setAttribute("user",a);
                if (a.getSId()==7){
                    model.addAttribute("msg","用户已被冻结");
                    return "redirect:/user/replyLogin/"+type;
                }
                return "redirect:/user/index";
            }else {
                model.addAttribute("msg","用户密码错误");
                return "redirect:/user/replyLogin/"+type;
            }
        }else {
            model.addAttribute("msg","账号错误");
            return "redirect:/user/replyLogin/"+type;
        }
    }

    //注销
    @RequestMapping(value = "/loginout")
    public String loginout(Model model,HttpSession session){
        session.invalidate();
        model.addAttribute("tie","注销成功");
        return "../index";
    }

    //主页
    @RequestMapping(value = "/index")
    public String appIndex(Model model,HttpSession session){
        Pages p=initPage();
        session.setAttribute("pages",p);
        /*List<AppInfo> ail=appInfoService.findAllAppInfo();
        model.addAttribute("app",ail);*/
        List<AppInfo> ail=appInfoService.findAllAppInfo1(0,p.getCount());
        model.addAttribute("app",ail);
        List<AppType> atl=appTypeService.findAllAppType();
        session.setAttribute("appType",atl);
        List<State> sl=stateService.findAllState();
        session.setAttribute("state",sl);
        List<Type> tl=typeService.findAllType();
        session.setAttribute("type",tl);
        return "appList";
    }

    //翻页
    @RequestMapping(value = "/index/{now}")
    public String pageIndex(@PathVariable int now,HttpSession session,Model model){
        Pages p=(Pages)session.getAttribute("pages");
        p.setNow(now);
        List<AppInfo> ail=appInfoService.findAllAppInfo1(((now-1)*p.getCount()),(p.getCount()));
        model.addAttribute("app",ail);
        return "appList";
    }

    //搜索框功能
    @RequestMapping(value = "/searchByName")
    public String searchByName(String name,Model model){
        List<AppInfo> ail=appInfoService.findAppInfoByName(name);
        model.addAttribute("app",ail);
        return "appList";
    }

    @RequestMapping(value = "/searchByType/{type}")
    public String searchByType(@PathVariable int type,Model model){
        List<AppInfo> ail=appInfoService.findAppInfoByType(type);
        model.addAttribute("app",ail);
        return "appList";
    }

    @RequestMapping(value = "/searchByState/{state}")
    public String searchByState(@PathVariable int state,Model model){
        List<AppInfo> ail=appInfoService.findAppInfoByState(state);
        model.addAttribute("app",ail);
        return "appList";
    }

    @RequestMapping(value = "/searchByAdmin/{admin}")
    public String searchByAdmin(@PathVariable int admin,Model model){
        List<AppInfo> ail=appInfoService.findAppInfoByAdmin(admin);
        model.addAttribute("app",ail);
        return "appList";
    }

    @RequestMapping(value = "/search")
    public String search(String name,int state,int type,int flatformId,
                         Model model,HttpSession session){
        Pages p=initPage();
        List<AppInfo> ail=appInfoService.findAppInfoBy1(name,state,type,flatformId,0,p.getCount());
        p.setTotal(ail.size());
        p.setNum(p.getTotal()%p.getCount()==0?
                p.getTotal()/p.getCount():
                p.getTotal()/p.getCount()+1);
        p.setNow(1);
        session.setAttribute("pages",p);

        model.addAttribute("app",ail);
        model.addAttribute("t1",name);
        model.addAttribute("t2",state);
        model.addAttribute("t3",type);
        model.addAttribute("t4",flatformId);
        return "search";
    }
    @RequestMapping(value = "/search1/{now}")
    public String search1(String name,int state,int type,int flatformId,@PathVariable int now,
                         Model model,HttpSession session){
        Pages p=(Pages)session.getAttribute("pages");
        p.setNow(now);
        List<AppInfo> ail=appInfoService.findAppInfoBy1(name,state,type,flatformId,
                ((now-1)*p.getCount()),(now*p.getCount()));
        model.addAttribute("app",ail);
        model.addAttribute("t1",name);
        model.addAttribute("t2",state);
        model.addAttribute("t3",type);
        model.addAttribute("t4",flatformId);
        return "search";
    }

    //app详情
    @RequestMapping(value = "/appDetail/{id}")
    public String appDetail(@PathVariable int id,Model model){
        AppInfo ai=appInfoService.findAppInfoById(id);
        model.addAttribute("app",ai);
        List<AppVersion> avl=appVersionService.findAppVersionByAppInfo(id);
        model.addAttribute("version",avl);
        return "appDetail";
    }

    //查看个人信息
    @RequestMapping(value = "/userInfo")
    public String userInfo(){
        return "userInfo";
    }

    //更改个人信息
    @RequestMapping(value = "/replyUpdateUser")
    public String replyUpdateUser(){
        return "updateUser";
    }

    @RequestMapping(value = "/updateUser")
    public String updateUser(Admin admin,Model model,HttpSession session){
        if (adminService.updateAdmin(admin)){
            model.addAttribute("msg","更改成功");
            Admin a=adminService.findAdminByCode(admin.getACode(),admin.getTId());
            session.setAttribute("user",a);
            return "redirect:/user/userInfo";
        }else {
            model.addAttribute("msg","更改失败");
            return "redirect:/user/replyUpdateUser/"+admin.getId();
        }
    }

    //APP类型
    @RequestMapping(value = "/appType")
    @ResponseBody
    public Object findAppType(int typeNum){
        List<AppType> atl=appTypeService.findAppTypeByParent(typeNum);
        return atl;
    }

    //下载
    @RequestMapping(value="/download/{downId}",method= RequestMethod.GET)
    public void download(@PathVariable int downId,
                         HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        String apkFileName=appVersionService.findAppVersionById(downId).getApkFileName();
        String apkLocPath = request.getSession().getServletContext().getRealPath("statics/uploadfiles")+"\\"+apkFileName;
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(apkLocPath)));
        //转码，免得文件名中文乱码
        apkFileName = URLEncoder.encode(apkFileName,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + apkFileName);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }

    //查版本号
    @RequestMapping(value = "/appV")
    @ResponseBody
    public Object appV(int ver){
        AppVersion av=appVersionService.findAppVersionFirstBy(ver);
        return av;
    }
}
