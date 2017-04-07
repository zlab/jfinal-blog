package net.zhanqi.app.blog.extend;

import com.jfinal.aop.InterceptorStack;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * 拦截器栈，执行顺序很重要 <br/>
 * <p/>
 * invoke before 先加先执行<br/>
 * <p/>
 * invoke after 先加后执行
 *
 * @author zhanqi
 */
public class AdminInterceptorStack extends InterceptorStack {

    @Override
    public void config() {
        addInterceptors(new ExceptionInterceptor()); // 必须放Tx前面，否则事物不会回滚，最好放第一
        addInterceptors(new LoginInterceptor());
        addInterceptors(new SessionInViewInterceptor(true));
        addInterceptors(new Tx()); // 放最后，有异常第一个知道，否则不能回滚
    }

}
