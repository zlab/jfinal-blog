package net.zhanqi.app.blog.service;

import com.jfinal.plugin.activerecord.Page;
import net.zhanqi.app.blog.model.BlogLink;

public class LinkService {

    public static final LinkService me = new LinkService();

    public Page<BlogLink> queryLinkList(int pageNumber, int pageSize) {
        return BlogLink.me.paginate(pageNumber, pageSize, "select *",
                "from blog_link order by category, sort");
    }

    public Object queryLink(Long id) {
        return BlogLink.me.findById(id);
    }

    public void saveLink(BlogLink link) {
        if (link.getLong("id") == null) {
            link.save();
        } else {
            link.update();
        }
    }

    public void deleteLink(Long id) {
        BlogLink.me.deleteById(id);
    }

}
