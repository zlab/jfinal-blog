package net.zhanqi.app.blog.config;

import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ServerNameRedirect301Handler;
import com.jfinal.ext.handler.UrlSkipHandler;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.FreeMarkerRender;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import net.zhanqi.app.blog.controller.BlogController;
import net.zhanqi.app.blog.controller.admin.*;
import net.zhanqi.app.blog.extend.OptionInterceptor;
import net.zhanqi.app.blog.extend.PermanentRedirectHandler;
import net.zhanqi.app.blog.model.*;

/**
 * API引导式配置
 */
public class AppConfig extends JFinalConfig {

    /**
     * 配置常量
     */
    public void configConstant(Constants me) {
        loadPropertyFile("config.properties");

        me.setDevMode(getPropertyToBoolean("devMode", false));
        me.setBaseViewPath(getProperty("baseViewPath"));
        me.setError404View(getProperty("baseViewPath") + "/blog/404.ftl");

        try {
            Configuration config = FreeMarkerRender.getConfiguration();
            config.setSharedVariable("viewPath", getProperty("baseViewPath"));

            String ctxPath = JFinal.me().getContextPath();
            if (ctxPath.equals("/")) {
                ctxPath = "";
            }

            config.setSharedVariable("ctx", getProperty("serverName") + ctxPath);

        } catch (TemplateModelException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 配置路由
     */
    public void configRoute(Routes me) {
        me.add("/", BlogController.class, "/blog");
        me.add("/admin", AdminController.class);
        me.add("/admin/post", PostController.class);
        me.add("/admin/tag", TagController.class);
        me.add("/admin/category", CategoryController.class);
        me.add("/admin/link", LinkController.class);
        me.add("/admin/user", UserController.class);
        me.add("/admin/option", OptionController.class);
    }

    /**
     * 配置插件
     */
    public void configPlugin(Plugins me) {
        // 数据源
        DruidPlugin druidPlugin = new DruidPlugin(getProperty("jdbcUrl"), getProperty("username"),
                getProperty("password"));
        me.add(druidPlugin);

        ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
        me.add(arp);

        // 库表映射
        arp.addMapping("blog_post", BlogPost.class);
        arp.addMapping("blog_option", BlogOption.class);
        arp.addMapping("blog_category", BlogCategory.class);
        arp.addMapping("blog_tag", BlogTag.class);
        arp.addMapping("blog_link", BlogLink.class);
        arp.addMapping("blog_user", BlogUser.class);
        // arp.addMapping("blog_param", BlogParam.class);
    }

    /**
     * 配置全局拦截器
     * <p/>
     * 执行顺序：@see AdminInterceptorStack
     */
    public void configInterceptor(Interceptors me) {
        me.add(new OptionInterceptor());
    }

    /**
     * 配置处理器
     * <p/>
     * 执行顺序：先加后执行
     */
    public void configHandler(Handlers me) {
        me.add(new PermanentRedirectHandler());
        me.add(new UrlSkipHandler(".+\\.\\w{1,4}", false));
        me.add(new ServerNameRedirect301Handler(getProperty("originalServerName"),
                getProperty("targetServerName")));
    }
}
