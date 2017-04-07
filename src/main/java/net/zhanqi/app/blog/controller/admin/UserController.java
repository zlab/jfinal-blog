package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.model.BlogUser;
import net.zhanqi.app.blog.service.UserService;

/**
 * 用户管理
 */
@Before(AdminInterceptorStack.class)
public class UserController extends Controller {

    public void index() {
        render("userMain.ftl");
    }

    public void list() {
        String key = getPara("key");
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 8);
        setAttr("page", UserService.me.queryUserList(pageNumber, pageSize, key));
        render("userList.ftl");
    }

    public void input() {
        if (getPara("id") != null) {
            setAttr("user", UserService.me.queryUser(getParaToLong("id")));
        }

        render("userInput.ftl");
    }

    public void saveUser() {
        UserService.me.saveUser(getModel(BlogUser.class, "user"));
        renderJson(true);
    }

    public void deleteUser() {
        UserService.me.deleteUser(getParaToLong("id"));
        renderJson(true);
    }

}
