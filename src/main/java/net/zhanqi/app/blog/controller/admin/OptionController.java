package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.service.OptionService;

/**
 * 参数管理
 */
@Before(AdminInterceptorStack.class)
public class OptionController extends Controller {

    public void index() {
        render("optionMain.ftl");
    }

    public void saveOption() {
        OptionService.me.saveOption(getPara("name"), getPara("value"));
        renderJson(true);
    }

}
