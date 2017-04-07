package net.zhanqi.app.blog.service;

import net.zhanqi.app.blog.model.BlogOption;
import net.zhanqi.app.blog.util.CheckUtils;

public class OptionService {

    public static final OptionService me = new OptionService();

    public void saveOption(String name, String value) {
        CheckUtils.checkBlank(name, "参数名称不能为空");
        CheckUtils.checkBlank(value, "参数值不能为空");

        BlogOption option = BlogOption.me.findFirst("select * from blog_option where name=?", name);
        CheckUtils.checkNull(option, "参数【%s】不存在", name);

        option.set("value", value);
        option.update();
    }
}
