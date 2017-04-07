package net.zhanqi.app.blog.extend;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * ExceptionInterceptor
 */
public class ExceptionInterceptor implements Interceptor {

    private static final Log log = Log.getLog(ExceptionInterceptor.class);

    public void intercept(Invocation inv) {

        try {
            inv.invoke();
        } catch (RuntimeException e) {
            if (e.getCause() != null && e.getCause() instanceof CustomException) {
                e = (CustomException) e.getCause();
            }

            Controller controller = inv.getController();

            // ajax
            HttpServletRequest request = controller.getRequest();
            if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                Map<String, Object> result = new HashMap<String, Object>();
                result.put("success", false);
                if (e instanceof CustomException) {
                    result.put("code", 400);
                    result.put("msg", e.getMessage());
                } else {
                    result.put("code", 500);
                    result.put("msg", "服务器内部错误");
                    log.error(e.getMessage(), e);
                }

                controller.renderJson(result);
                return;
            }

            // 不处理
            throw e;
        }
    }
}
