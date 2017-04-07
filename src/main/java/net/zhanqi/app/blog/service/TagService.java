package net.zhanqi.app.blog.service;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.model.BlogTag;
import net.zhanqi.app.blog.util.CheckUtils;

import java.util.ArrayList;
import java.util.List;

public class TagService {

    public static final TagService me = new TagService();

    public Page<BlogTag> queryTagList(int pageNumber, int pageSize, String key) {

        StringBuilder sb = new StringBuilder("from blog_tag t where 1=1");
        List<Object> params = new ArrayList<Object>();

        if (!StrKit.isBlank(key)) {
            sb.append(" and (slug like ? or name like ?)");
            params.add("%" + key + "%");
            params.add("%" + key + "%");
        }

        sb.append(" order by id asc");

        return BlogTag.me.paginate(pageNumber, pageSize, "select *", sb.toString(),
                params.toArray());
    }

    public BlogTag queryTag(Long id) {
        return BlogTag.me.findById(id);
    }

    public void saveTag(BlogTag tag) {
        String slug = tag.getStr("slug");

        CheckUtils.checkBlank(tag.getStr("name"), "名称不能为空");
        CheckUtils.checkBlank(slug, "别名不能为空");

        if (tag.getLong("id") == null) {
            String sql = "select count(1) from blog_tag where slug=?";
            long count = Db.queryLong(sql, slug);
            CheckUtils.checkTrue(count > 0, "标签【%s】已经存在", slug);
            tag.save();
        } else {
            String sql = "select count(1) from blog_tag where slug=? and id<>?";
            long count = Db.queryLong(sql, slug, tag.getLong("id"));
            CheckUtils.checkTrue(count > 0, "标签【%s】已经存在", slug);
            tag.update();
        }
    }

    public void deleteTag(Long id) {
        BlogTag.me.deleteById(id);

        String sql = "delete from blog_post_tag where tagid=?";
        Db.update(sql, id);
    }
}
