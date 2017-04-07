package net.zhanqi.app.blog.extend;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.service.ParamService;

public class OptionInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        controller.setAttr("options", ParamService.me.queryOptionMap());
        controller.setAttr("params", ParamService.me.queryBlogParamList());
        inv.invoke();
    }

}
