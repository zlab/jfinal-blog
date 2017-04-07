package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.model.BlogTag;
import net.zhanqi.app.blog.service.TagService;

/**
 * 标签管理
 */
@Before(AdminInterceptorStack.class)
public class TagController extends Controller {

    public void index() {
        render("tagMain.ftl");
    }

    public void list() {
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 8);
        setAttr("page", TagService.me.queryTagList(pageNumber, pageSize, getPara("key")));
        render("tagList.ftl");
    }

    public void input() {
        if (getPara("id") != null) {
            setAttr("tag", TagService.me.queryTag(getParaToLong("id")));
        }
        render("tagInput.ftl");
    }

    public void saveTag() {
        TagService.me.saveTag(getModel(BlogTag.class, "tag"));
        renderJson(true);
    }

    public void deleteTag() {
        TagService.me.deleteTag(getParaToLong("id"));
        renderJson(true);
    }

}
