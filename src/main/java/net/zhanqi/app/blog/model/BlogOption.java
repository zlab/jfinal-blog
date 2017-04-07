package net.zhanqi.app.blog.model;

import com.jfinal.plugin.activerecord.Model;

public class BlogOption extends Model<BlogOption> {

    public static final BlogOption me = new BlogOption();
    private static final long serialVersionUID = 1L;

    public String getName() {
        return getStr("name");
    }

    public String getValue() {
        return getStr("value");
    }


}
