package net.zhanqi.app.blog.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlogParam extends Model<BlogParam> {

    public static final BlogParam me = new BlogParam();
    private static final long serialVersionUID = 1L;

    public Map<String, Map<String, String>> queryParamMap22() {
        List<BlogParam> list = find("select * from blog_param order by sort");
        Map<String, Map<String, String>> map = new HashMap<String, Map<String, String>>();
        for (BlogParam param : list) {
            if (!map.containsKey(param.getCode())) {
                map.put(param.getCode(), new HashMap<String, String>());
            }
            map.get(param.getCode()).put(param.getValue(), param.getName());
        }
        return map;
    }

    public String getCode() {
        return getStr("code");
    }

    public String getValue() {
        return getStr("value");
    }

    public String getName() {
        return getStr("name");
    }

}
