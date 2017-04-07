package net.zhanqi.app.blog.model;

import com.jfinal.plugin.activerecord.Model;

public class BlogTag extends Model<BlogTag> {

    public static final BlogTag me = new BlogTag();
    private static final long serialVersionUID = 1L;

    public boolean getChecked() {
        return getLong("checked") == 1;
    }
}
