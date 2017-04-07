package net.zhanqi.app.blog.service;

import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.model.BlogCategory;
import net.zhanqi.app.blog.model.BlogLink;
import net.zhanqi.app.blog.model.BlogPost;
import net.zhanqi.app.blog.model.BlogTag;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlogService {

    public static final BlogService me = new BlogService();

    /**
     * 首页文章列表
     *
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<BlogPost> queryHomePostList(int pageNumber, int pageSize) {
        String select = "select t1.*, t2.slug catslug, t2.name catname";
        String from = "from blog_post t1, blog_category t2 where t1.status=2 and t1.catid=t2.id order by id desc";
        return BlogPost.me.paginate(pageNumber, pageSize, select, from);
    }

    /**
     * 分类目录归档
     *
     * @param pageNumber
     * @param pageSize
     * @param slug
     * @return
     */
    public Page<BlogPost> queryCategoryPostList(int pageNumber, int pageSize, String slug) {
        String select = "select t1.*, t2.slug catslug, t2.name catname";
        String from = "from blog_post t1, blog_category t2 where t1.status=2 and t1.catid=t2.id and t2.slug=? order by id desc";
        return BlogPost.me.paginate(pageNumber, pageSize, select, from, slug);
    }

    /**
     * 标签归档
     *
     * @param pageNumber
     * @param pageSize
     * @param slug
     * @return
     */
    public Page<BlogPost> queryTagPostList(int pageNumber, int pageSize, String slug) {
        String select = "select t1.*, t2.slug catslug, t2.name catname";

        StringBuilder sb = new StringBuilder();
        sb.append("from blog_post t1, blog_category t2");
        sb.append(" where t1.catid=t2.id and t1.status=2");
        sb.append(" and exists");
        sb.append(" (select 1 from blog_tag t3, blog_post_tag t4");
        sb.append(" where t3.id=t4.tagid and t4.postid=t1.id and t3.slug=?)");
        sb.append(" order by id desc");

        return BlogPost.me.paginate(pageNumber, pageSize, select,
                sb.toString(), slug);
    }


    /**
     * 搜索
     *
     * @param pageNumber
     * @param pageSize
     * @param key
     * @return
     */
    public Page<BlogPost> querySearchPostList(int pageNumber, int pageSize, String key) {
        String select = "select t1.*, t2.slug catslug, t2.name catname";

        StringBuilder sb = new StringBuilder();
        sb.append("from blog_post t1, blog_category t2");
        sb.append(" where t1.catid=t2.id and t1.status=2");
        sb.append(" and (t1.title like ? or t1.title like ? or t1.content like ? or t1.content like ?)");
        sb.append(" order by id desc");

        return BlogPost.me.paginate(pageNumber, pageSize, select, sb.toString(),
                "%" + key.toUpperCase() + "%",
                "%" + key.toLowerCase() + "%",
                "%" + key.toUpperCase() + "%",
                "%" + key.toLowerCase() + "%");
    }

    /**
     * 文章详情
     *
     * @param postId
     * @return
     */
    public BlogPost queryPost(long postId) {
        StringBuilder sb = new StringBuilder();
        sb.append("select t1.*, t2.slug catslug, t2.name catname");
        sb.append(" from blog_post t1, blog_category t2");
        sb.append(" where t1.catid=t2.id and t1.id=?");

        BlogPost post = BlogPost.me.findFirst(sb.toString(), postId);

        if (post == null) {
            return null;
        }

        // 标签
        sb = new StringBuilder();
        sb.append("select t2.slug, t2.name");
        sb.append(" from blog_post_tag t1, blog_tag t2");
        sb.append(" where t1.tagid=t2.id and t1.postid=?");

        post.put("postTags", BlogTag.me.find(sb.toString(), postId));

        // 上一篇
        sb = new StringBuilder();
        sb.append("select * from blog_post where status=2 and id<? order by id desc");

        post.put("prevPost", BlogPost.me.findFirst(sb.toString(), postId));

        // 下一篇
        sb = new StringBuilder();
        sb.append("select * from blog_post where status=2 and id>? order by id asc");

        post.put("nextPost", BlogPost.me.findFirst(sb.toString(), postId));

        return post;
    }

    // 随机文章
    // String sql = "select t.* from blog_post t where t.status=? and t.id<>? order by rand() limit ?";

    // 相关文章
    // sql = "select t.* from blog_post t where t.status=? and t.id<>? order by rand() limit ?";


    /**
     * 分类目录详情
     *
     * @param slug
     * @return
     */
    public BlogCategory queryCategory(String slug) {
        return BlogCategory.me.findFirst("select * from blog_category where slug=?", slug);
    }

    /**
     * 标签详情
     *
     * @param slug
     * @return
     */
    public BlogTag queryTag(String slug) {
        return BlogTag.me.findFirst("select * from blog_tag where slug=?", slug);
    }

    public List<BlogCategory> queryCategoryList() {
        return BlogCategory.me.find("select * from blog_category");
    }

    public List<BlogTag> queryTagList() {
        return BlogTag.me.find("select * from blog_tag");
    }

    public Map<String, List<BlogLink>> queryLinkMap() {
        List<BlogLink> list = BlogLink.me.find("select * from blog_link order by sort");
        Map<String, List<BlogLink>> map = new HashMap<String, List<BlogLink>>();
        for (BlogLink link : list) {
            if (!map.containsKey(link.getCategory())) {
                map.put(link.getCategory(), new ArrayList<BlogLink>());
            }

            map.get(link.getCategory()).add(link);
        }

        return map;
    }

    public List<BlogPost> queryRecentPostList() {
        return BlogPost.me.find("select id, title from blog_post where status=2 order by id desc limit 5");
    }

}
