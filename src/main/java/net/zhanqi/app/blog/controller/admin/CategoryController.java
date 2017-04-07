package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.model.BlogCategory;
import net.zhanqi.app.blog.service.CategoryService;

/**
 * 分类目录管理
 */
@Before(AdminInterceptorStack.class)
public class CategoryController extends Controller {

    public void index() {
        render("categoryMain.ftl");
    }

    public void list() {
        String key = getPara("key");
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 8);
        setAttr("page", CategoryService.me.queryCategoryList(pageNumber, pageSize, key));
        render("categoryList.ftl");
    }

    public void input() {
        Long id = getParaToLong("id");
        if (id != null) {
            setAttr("category", CategoryService.me.queryCategory(id));
        }

        render("categoryInput.ftl");
    }

    public void saveCategory() {
        CategoryService.me.saveCategory(getModel(BlogCategory.class, "category"));
        renderJson(true);
    }

    public void deleteCategory() {
        CategoryService.me.deleteCategory(getParaToLong("id"));
        renderJson(true);
    }

}
