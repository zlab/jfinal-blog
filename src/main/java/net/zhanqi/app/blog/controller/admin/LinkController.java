package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.model.BlogLink;
import net.zhanqi.app.blog.service.LinkService;

/**
 * 链接管理
 */
@Before(AdminInterceptorStack.class)
public class LinkController extends Controller {

    public void index() {
        render("linkMain.ftl");
    }

    public void list() {
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 8);
        setAttr("page", LinkService.me.queryLinkList(pageNumber, pageSize));
        render("linkList.ftl");
    }

    public void input() {
        if (getPara("id") != null) {
            setAttr("link", LinkService.me.queryLink(getParaToLong("id")));
        }
        render("linkInput.ftl");
    }

    public void saveLink() {
        LinkService.me.saveLink(getModel(BlogLink.class, "link"));
        renderJson(true);
    }

    public void deleteLink() {
        LinkService.me.deleteLink(getParaToLong("id"));
        renderJson(true);
    }

}
