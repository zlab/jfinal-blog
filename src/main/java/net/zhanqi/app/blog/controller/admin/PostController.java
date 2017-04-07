package net.zhanqi.app.blog.controller.admin;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import net.zhanqi.app.blog.extend.AdminInterceptorStack;
import net.zhanqi.app.blog.model.BlogPost;
import net.zhanqi.app.blog.service.ParamService;
import net.zhanqi.app.blog.service.PostService;

import java.util.List;

/**
 * 文章管理
 */
@Before(AdminInterceptorStack.class)
public class PostController extends Controller {

    public void index() {
        render("postMain.ftl");
    }

    public void list() {
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 8);
        String title = getPara("title");
        Integer status = getParaToInt("status");

        setAttr("page", PostService.me.queryPostList(pageNumber, pageSize, title, status));
        render("postList.ftl");
    }

    public void input() {
        Long postId = getParaToLong("id");
        if (postId != null) {
            setAttr("post", PostService.me.queryPost(postId));
        }

        List<Record> params = getAttr("params");
        params.addAll(ParamService.me.queryCategoryParamList());

        setAttr("tagList", PostService.me.queryTagList(postId));

        render("postInput.ftl");
    }

    public void savePost() {
        BlogPost post = getModel(BlogPost.class, "post");

        PostService.me.savePost(post, getParaValuesToLong("addTags"), getParaValuesToLong("delTags"));

        renderJson(true);
    }

    public void deletePost() {
        PostService.me.deletePost(getParaToLong("id"));
        renderJson(true);
    }
}
