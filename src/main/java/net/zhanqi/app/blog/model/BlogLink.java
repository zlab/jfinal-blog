package net.zhanqi.app.blog.model;

import com.jfinal.plugin.activerecord.Model;

public class BlogLink extends Model<BlogLink> {

    public static final BlogLink me = new BlogLink();
    private static final long serialVersionUID = 1L;

    public String getCategory() {
        return getStr("category");
    }
}
