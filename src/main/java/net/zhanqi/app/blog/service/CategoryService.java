package net.zhanqi.app.blog.service;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.model.BlogCategory;
import net.zhanqi.app.blog.util.CheckUtils;

import java.util.ArrayList;
import java.util.List;

public class CategoryService {

    public static final CategoryService me = new CategoryService();

    public Page<BlogCategory> queryCategoryList(int pageNumber, int pageSize, String key) {
        StringBuilder sb = new StringBuilder("from blog_category t where 1=1");
        List<Object> params = new ArrayList<Object>();

        if (!StrKit.isBlank(key)) {
            sb.append(" and (slug like ? or name like ?)");
            params.add("%" + key + "%");
            params.add("%" + key + "%");
        }

        sb.append(" order by id asc");

        return BlogCategory.me.paginate(pageNumber, pageSize, "select t.*", sb.toString(),
                params.toArray());
    }

    public BlogCategory queryCategory(Long id) {
        return BlogCategory.me.findById(id);
    }

    public void saveCategory(BlogCategory category) {
        String slug = category.getStr("slug");

        CheckUtils.checkBlank(category.getStr("name"), "名称不能为空");
        CheckUtils.checkBlank(slug, "别名不能为空");

        if (category.getLong("id") == null) {
            String sql = "select count(1) from blog_category where slug=?";
            long count = Db.queryLong(sql, slug);
            CheckUtils.checkTrue(count > 0, "分类目录【%s】已经存在", slug);
            category.save();
        } else {
            String sql = "select count(1) from blog_category where slug=? and id<>?";
            long count = Db.queryLong(sql, slug, category.getLong("id"));
            CheckUtils.checkTrue(count > 0, "分类目录【%s】已经存在", slug);
            category.update();
        }
    }

    public void deleteCategory(Long id) {
        String sql = "select count(1) from blog_post where catid=?";
        long count = Db.queryLong(sql, id);
        CheckUtils.checkTrue(count > 0, "该分类目录下有文章，不能删除");

        BlogCategory.me.deleteById(id);
    }
}
