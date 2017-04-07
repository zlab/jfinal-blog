package net.zhanqi.app.blog.extend;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.service.BlogService;

import javax.servlet.http.HttpServletRequest;

/**
 * 不建议在拦截器里面写数据库，会影响事务
 */
public class BlogInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        controller.setAttr("links", BlogService.me.queryLinkMap());
        controller.setAttr("categorys", BlogService.me.queryCategoryList());
        controller.setAttr("tags", BlogService.me.queryTagList());
        controller.setAttr("recentPosts", BlogService.me.queryRecentPostList());

        HttpServletRequest request = controller.getRequest();
        controller.setAttr("servletPath", request.getServletPath());
        controller.setAttr("isMobile", request.getHeader("user-agent").contains("Mobile"));

        inv.invoke();
    }

}
