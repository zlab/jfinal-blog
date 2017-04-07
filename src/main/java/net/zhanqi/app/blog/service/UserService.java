package net.zhanqi.app.blog.service;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.extend.CustomException;
import net.zhanqi.app.blog.model.BlogUser;
import net.zhanqi.app.blog.util.CheckUtils;

import java.util.ArrayList;
import java.util.List;

public class UserService {

    public static final UserService me = new UserService();

    public Page<BlogUser> queryUserList(int pageNumber, int pageSize, String key) {

        StringBuilder sb = new StringBuilder("from blog_user t where 1=1");
        List<Object> params = new ArrayList<Object>();

        if (!StrKit.isBlank(key)) {
            sb.append(" and (username like ? or name like ?)");
            params.add("%" + key + "%");
            params.add("%" + key + "%");
        }

        sb.append(" order by id asc");

        return BlogUser.me.paginate(pageNumber, pageSize, "select *", sb.toString(),
                params.toArray());
    }

    public BlogUser queryUser(Long id) {
        return BlogUser.me.findById(id);
    }

    public void saveUser(BlogUser user) {
        String username = user.getStr("username");

        CheckUtils.checkBlank(username, "账号不能为空");

        if (user.getLong("id") == null) {
            String sql = "select count(1) from blog_user where username=?";
            long count = Db.queryLong(sql, username);
            CheckUtils.checkTrue(count > 0, "账号【%s】已经存在", username);
            user.save();
        } else {
            String sql = "select count(1) from blog_user where username=? and id<>?";
            long count = Db.queryLong(sql, username, user.getLong("id"));
            CheckUtils.checkTrue(count > 0, "账号【%s】已经存在", username);
            user.update();
        }
    }

    public void deleteUser(Long id) {
        // BlogUser.me.deleteById(id);

        // String sql = "delete from blog_post_user where userid=?";
        // Db.update(sql, id);

        throw new CustomException("不能删除");
    }
}
