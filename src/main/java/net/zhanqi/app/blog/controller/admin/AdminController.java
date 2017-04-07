package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.model.BlogUser;
import net.zhanqi.app.blog.service.AdminService;

/**
 * BlogController
 */
@Before(AdminInterceptorStack.class)
public class AdminController extends Controller {

    /**
     * 后台主框架
     */
    public void index() {
        render("admin.ftl");
    }

    /**
     * 登陆
     */
    public void login() {
        if (!isParaExists("type")) {
            // 注销
            removeSessionAttr("loginUser");
            render("login.ftl");
            return;
        }

        // 登陆验证
        BlogUser user = AdminService.me.login(getPara("username"), getPara("password"));
        setSessionAttr("loginUser", user);
        renderJson(true);
    }

    /**
     * 后台首页
     */
    public void dashboard() {
        render("dashboard.ftl");
    }

}
