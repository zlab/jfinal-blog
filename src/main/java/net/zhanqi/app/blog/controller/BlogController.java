package net.zhanqi.app.blog.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.extend.BlogInterceptor;
import net.zhanqi.app.blog.model.BlogCategory;
import net.zhanqi.app.blog.model.BlogPost;
import net.zhanqi.app.blog.model.BlogTag;
import net.zhanqi.app.blog.service.BlogService;

import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * BlogController
 */
@Before(BlogInterceptor.class)
public class BlogController extends Controller {

    private static final String TITLE = "title";

    /**
     * 首页列表，文章详情，独立页面
     * <p/>
     * /123 文章详情
     * <p/>
     * /xxx 独立页面
     * <p/>
     * /?page=2 首页文章列表
     */
    public void index() {
        Map<String, String> options = getAttr("options");

        String param = getPara();

        // 首页文章列表
        if (param == null) {
            int pageNumber = getParaToInt("page", 1);
            int pageSize = Integer.parseInt(options.get("post.pagesize"));
            setAttr("postPage", BlogService.me.queryHomePostList(pageNumber, pageSize));
            setAttr(TITLE, options.get("blog.name") + " | " + options.get("blog.desc"));
            render("home.ftl");
            return;
        }

        try {
            // 文章详情
            long postId = Long.parseLong(param);
            BlogPost post = BlogService.me.queryPost(postId);
            if (post == null) {
                renderError(404);
                return;
            }

            setAttr("post", post);
            setAttr(TITLE, post.get("title") + " | " + options.get("blog.name"));
            render("post.ftl");
        } catch (NumberFormatException e) {
            renderError(404);
        }

    }

    /**
     * /category 分类目录-文章标题
     * <p/>
     * /category/xxxx/?page=2 分类目录-文章列表
     */
    public void category() {
        setAttr("archive", true);

        Map<String, String> options = getAttr("options");

        String slug = getPara(0, null);

        // 分类目录-文章列表
        if (slug != null) {
            BlogCategory category = BlogService.me.queryCategory(slug);
            if (category == null) {
                renderError(404);
                return;
            }

            setAttr("category", category);

            int pageNumber = getParaToInt("page", 1);
            int pageSize = Integer.parseInt(options.get("post.pagesize"));
            setAttr("postPage", BlogService.me.queryCategoryPostList(pageNumber, pageSize, slug));
            setAttr(TITLE, category.getStr("name") + " | " + options.get("blog.name"));
            render("home.ftl");
        } else {
            render("category.ftl");
        }
    }

    /**
     * /tag 标签-文章标题
     * <p/>
     * /tag/xxxx/?page=2 标签-文章列表
     */
    public void tag() {
        setAttr("archive", true);

        Map<String, String> options = getAttr("options");

        String slug = getPara(0, null);

        // 标签-文章列表
        if (slug != null) {
            BlogTag tag = BlogService.me.queryTag(slug);
            if (tag == null) {
                renderError(404);
                return;
            }

            setAttr("tag", tag);

            int pageNumber = getParaToInt("page", 1);
            int pageSize = Integer.parseInt(options.get("post.pagesize"));
            setAttr("postPage", BlogService.me.queryTagPostList(pageNumber, pageSize, slug));
            setAttr(TITLE, tag.getStr("name") + " | " + options.get("blog.name"));
            render("home.ftl");
        } else {
            render("tag.ftl");
        }
    }

    /**
     * /search 搜索界面
     * <p/>
     * /search/?key=xxx&page=xx 搜索文章列表
     */
    public void search() throws UnsupportedEncodingException {
        setAttr("archive", true);

        Map<String, String> options = getAttr("options");

        String key = getPara("key", null);
        if (key != null) {
            key = new String(key.getBytes("ISO8859-1"), "UTF-8");
            setAttr(TITLE, key + " | 搜索结果 | " + options.get("blog.name"));
            setAttr("key", key);

            int pageNumber = getParaToInt("page", 1);
            int pageSize = Integer.parseInt(options.get("post.pagesize"));

            Page<BlogPost> postPage = BlogService.me.querySearchPostList(pageNumber, pageSize, key);
            if (postPage.getList().isEmpty()) {
                render("search.ftl");
                return;
            }

            setAttr("postPage", postPage);
            render("home.ftl");
        } else {
            render("search.ftl");
        }
    }

    /**
     * 关于
     */
    public void about() {
        render("about.ftl");
    }

}