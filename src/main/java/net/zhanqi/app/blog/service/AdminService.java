package net.zhanqi.app.blog.service;

import com.jfinal.kit.HashKit;
import net.zhanqi.app.blog.model.BlogUser;
import net.zhanqi.app.blog.util.CheckUtils;

public class AdminService {

    public static final AdminService me = new AdminService();

    public BlogUser login(String username, String password) {
        CheckUtils.checkBlank(username, "帐号不能为空");
        CheckUtils.checkBlank(password, "密码不能为空");

        BlogUser user = BlogUser.me.findFirst("select * from blog_user where username=?",
                username);
        CheckUtils.checkNull(user, "帐号【%s】不存在", username);

        boolean valid = HashKit.md5(password).equals(user.get("password"));
        CheckUtils.checkTrue(!valid, "密码错误");

        return user;
    }
}
