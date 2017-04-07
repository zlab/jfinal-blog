package net.zhanqi.app.blog.extend;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import net.zhanqi.app.blog.model.BlogUser;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

public class LoginInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        BlogUser user = controller.getSessionAttr("loginUser");

        String key = inv.getActionKey();
        if (user != null || "/admin/login".equals(key)) {
            inv.invoke();
            return;
        }

        // ajax
        HttpServletRequest request = controller.getRequest();
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("success", false);
            result.put("code", 401);
            result.put("msg", "登陆已超时，请重新登陆！");
            controller.renderJson(result);
            return;
        }

        controller.redirect("/admin/login/");
    }

}
