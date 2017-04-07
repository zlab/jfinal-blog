package net.zhanqi.app.blog.model;

import com.jfinal.plugin.activerecord.Model;

public class BlogUser extends Model<BlogUser> {

    public static final BlogUser me = new BlogUser();
    private static final long serialVersionUID = 1L;
}
