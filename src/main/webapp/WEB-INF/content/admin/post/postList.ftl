<#include "../../common/pagination.ftl">
<#include "../../common/translate.ftl">

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>标题</th>
        <th>分类目录</th>
        <th>发布时间</th>
        <th>状态</th>
        <th>评论</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list (page.list)! as post>
    <tr>
        <td>${post.id}</td>
        <td><a href="${ctx}/${post.id}/" target="_blank">${post.title}</a></td>
        <td>${post.catname}</td>
        <td>${post.pubdate?string("yyyy-MM-dd HH:mm:ss")}</td>
        <td><@translate 'POST_STATUS' '${post.status!}' '未知状态' /></td>
        <td>${post.cc!"未同步"}</td>
        <td class="padding-6">
            <button type="button" class="btn btn-primary btn-white btn-xs"
                    onclick="post.showInput('edit', ${post.id})">修改
            </button>
            <button type="button" class="btn btn-danger btn-xs  btn-white"
                    onclick="post.deletePost(${post.id}, '${post.title}')">删除
            </button>
        </td>
    </tr>
    </#list>
    </tbody>
</table>

<!-- pagination -->
<@pagination page! />

<script type="text/javascript">
    $('.table').table(8);
    $('.paging').paging(post.queryPostList, '#query-btn');
</script>
