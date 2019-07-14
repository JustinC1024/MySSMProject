package demo;

import cn.as.pojo.*;
import cn.as.service.*;
import cn.as.service.impl.AdminServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Demo {

    ApplicationContext ap=new ClassPathXmlApplicationContext("classpath:applicationContext-mybatis.xml");
    AdminService as=ap.getBean("adminServiceImpl",AdminService.class);
    AppInfoService ais=ap.getBean("appInfoServiceImpl",AppInfoService.class);
    AppTypeService ats=ap.getBean("appTypeServiceImpl",AppTypeService.class);
    AppVersionService avs=ap.getBean("appVersionServiceImpl",AppVersionService.class);
    StateService ss=ap.getBean("stateServiceImpl",StateService.class);
    TypeService ts=ap.getBean("typeServiceImpl",TypeService.class);

    @Test
    public void test1(){
        List<Admin> al=as.findAllAdmin();
        for (Admin a:al){
            System.out.println(a.getAName());
        }
    }

    @Test
    public void test2(){
        List<State> sl=ss.findAllState();
        for (State s:sl){
            System.out.println(s.getId()+"\t"+s.getSName());
        }
    }

    @Test
    public void test3(){
        List<Type> tl=ts.findAllType();
        for (Type t:tl){
            System.out.println(t.getId()+"\t"+t.getTName());
        }
    }

    @Test
    public void test4(){
        Admin a=as.findAdminByCode("qwe",1);
        if (a.getAPassword().equals("zxc")){
            System.out.println("OK");
        }
    }

    @Test
    public void test5(){
        Admin a=new Admin();
        a.setACode("iop");
        a.setAName("jkl");
        a.setAPassword("789");
        a.setAEmail("789456@qq.com");
        a.setAInfo("asdfghjkl");
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        a.setCreationDate(Timestamp.valueOf(sdf.format(new Date())));
        if (as.doAdmin(a)) System.out.println("add ok");
    }

    @Test
    public void test6(){
        BigDecimal a=new BigDecimal(16);
        AppInfo ai=new AppInfo();
        ai.setAiName("谷歌拼音输入法");
        ai.setAPKName("com.google.android.inputmethod.pinyin");
        ai.setSupportROM("4.2及更高版本");
        ai.setInterfaceLanguage("zh");
        ai.setAId(1);
        ai.setAppInfo("asdfasd");
        ai.setAppSize(a);
        ai.setAtId(104);
        ai.setFlatformId(1);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        ai.setCreationDate(Timestamp.valueOf(sdf.format(new Date())));
        if (ais.doAppInfo(ai)) System.out.println("delete ok");
    }

    @Test
    public void test7(){
        List<AppType> atl=ats.findAllAppType();
        for (AppType at:atl){
            System.out.println(at.getAtName());
        }
    }

    @Test
    public void test8(){
        List<AppInfo> ail=ais.findAppInfoByName("乐");
        for (AppInfo ai:ail){
            System.out.println(ai.getAiName());
        }
    }

    @Test
    public void test9(){
        AppVersion av=avs.findAppVersionById(5);
        System.out.println(av.getCreationDate());
    }

    @Test
    public void test10(){
        if (ais.updateAppInfoByState(1,4))
            System.out.println("OK");
    }

    @Test
    public void test11(){
        Admin a=new Admin();
        if (as.updateAdmin(a))
            System.out.println("OK");
    }

    @Test
    public void test12(){
        List<AppInfo> ail=ais.findAppInfoBy1("U",0,0,0,0,1);
        for (AppInfo ai:ail){
            System.out.println(ai.getAiName());
        }
    }

    @Test
    public void test13(){
        List<Admin> al=as.findAllAdmin1(0,1);
        for (Admin a:al){
            System.out.println(a.getAName());
        }
    }
}
