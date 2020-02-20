package ypc.zwz.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ypc.zwz.model.User;
import ypc.zwz.service.UsersService;

import javax.servlet.http.HttpSession;

/**
 *      表现层（springMVC）：Controller层
 *
 *      Controller层负责具体的业务模块流程的控制。
 */

//      在此层里面要调用Service层的接口来控制业务流程，使程序结构变得清晰，也大大减少了代码量。

@Controller
@RequestMapping(value = "/users")
public class UsersController {

    @Autowired
    private UsersService usersService;

    /**
     * 跳转到系统登录首页（两种）
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "mainPage";
    }

    @RequestMapping(value = "/page")
    public String page() {
        return "mainPage";
    }

    /**
     *  登入
     */
    @RequestMapping(value = "/login")
    public String login(@RequestParam String a_name, @RequestParam String a_password, Model model, HttpSession session) {
        User admin = usersService.login(a_name);
        if (admin != null) {
            if (admin.getA_password().equals(a_password)) {
                session.setAttribute("name", admin.getA_name());
                return "mainPage";
            } else {
                model.addAttribute("message", "用户名或密码错误");
                return "login/loginFail";
            }
        } else {
            model.addAttribute("message", "登录失败");
            return "login/loginFail";
        }
    }

    /**
     * 注册
     */
    @RequestMapping(value = "/register")
    public String register(User user, HttpSession session) {
        usersService.insert(user);
        session.setAttribute("name", user.getA_name());
        return "mainPage";
    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "/outLogin")
    public String outLogin(HttpSession session) {
        session.invalidate();
        return "login/login";
    }

    /**
     * 根据用户名查询 注册判存在用
     */
    @ResponseBody
    @RequestMapping(value = "/findByName")
    public String findByName(@RequestBody User admin) {
        User info = usersService.findByName(admin.getA_name());
        System.out.println(JSONObject.toJSONString(info));
        return JSONObject.toJSONString(info);
    }

}
