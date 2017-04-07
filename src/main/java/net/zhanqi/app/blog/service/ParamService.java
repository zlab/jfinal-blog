package net.zhanqi.app.blog.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import net.zhanqi.app.blog.model.BlogOption;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ParamService {

    public static final ParamService me = new ParamService();

    public Map<String, String> queryOptionMap() {
        List<BlogOption> list = BlogOption.me.find("select * from blog_option");
        Map<String, String> map = new HashMap<String, String>();
        for (BlogOption option : list) {
            map.put(option.getName(), option.getValue());
        }
        return map;
    }

    public List<Record> queryBlogParamList() {
        return Db.find("select * from blog_param order by sort");
    }

    public List<Record> queryCategoryParamList() {
        return Db.find("select 'CATEGORY_LIST' code, id value, name from blog_category order by id");
    }
}
