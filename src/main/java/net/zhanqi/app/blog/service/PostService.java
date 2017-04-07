package net.zhanqi.app.blog.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.model.BlogPost;
import net.zhanqi.app.blog.model.BlogTag;
import net.zhanqi.app.blog.util.CheckUtils;

import java.util.ArrayList;
import java.util.List;

public class PostService {

    public static final PostService me = new PostService();

    public Page<BlogPost> queryPostList(int pageNumber, int pageSize, String title, Integer status) {
        String select = "select t.*, (select name from blog_category where id=t.catid) catname";
        return BlogPost.me.paginate(pageNumber, pageSize, select,
                "from blog_post t order by id desc");
    }

    public List<BlogTag> queryTagList(Long postId) {
        StringBuilder sb = new StringBuilder();
        List<Object> params = new ArrayList<Object>();

        sb.append("select t.*,");
        if (postId == null) {
            sb.append(" false checked");
        } else {
            sb.append(" (select count(1)>0 from blog_post_tag where postid=? and tagid=t.id) checked");
            params.add(postId);
        }

        sb.append(" from blog_tag t order by name");

        return BlogTag.me.find(sb.toString(), params.toArray());
    }

    public BlogPost queryPost(Long postId) {
        BlogPost post = BlogPost.me.findById(postId);

        if (post == null) {
            return null;
        }

        // 标签
        StringBuilder sb = new StringBuilder();
        sb.append("select t2.id, t2.name");
        sb.append(" from blog_post_tag t1, blog_tag t2");
        sb.append(" where t1.tagid=t2.id and t1.postid=?");
        post.put("postTags", BlogTag.me.find(sb.toString(), postId));

        return post;
    }

    public void savePost(BlogPost post, Long[] addTags, Long[] delTags) {
        Long postId = post.getLong("id");
        if (postId == null) {
            post.save();

            postId = post.getLong("id");
            CheckUtils.checkNull(postId, "保存失败");
        } else {
            post.update();
        }

        // 新增标签
        if (addTags != null && addTags.length > 0) {
            String sql = "insert into blog_post_tag(postid, tagid) values (?, ?)";
            for (Long tagId : addTags) {
                Db.update(sql, postId, tagId);
            }
        }

        // 删除标签
        if (delTags != null && delTags.length > 0) {
            String sql = "delete from blog_post_tag where postid=? and tagid=?";
            for (Long tagId : delTags) {
                Db.update(sql, postId, tagId);
            }
        }

    }

    public void deletePost(Long id) {
        // BlogPost.me.deleteById(id);
    }

}
