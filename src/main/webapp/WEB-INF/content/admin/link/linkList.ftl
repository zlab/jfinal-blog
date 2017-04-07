<#include "../../common/pagination.ftl">
<#include "../../common/translate.ftl">

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>分类</th>
        <th>名称</th>
        <th>别名</th>
        <th>地址</th>
        <th>打开方式</th>
        <th>排序</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list (page.list)! as link>
    <tr>
        <td><@translate 'LINK_CATEGORY' '${link.category!}' '未知类型' /></td>
        <td>${link.name}</td>
        <td>${link.slug}</td>
        <td>${link.href!}</td>
        <td><@translate 'LINK_TARGET' '${link.target!}' '未知打开方式' /></td>
        <td>${link.sort!}</td>
        <td><@translate 'LINK_STATUS' '${link.status!}' '未知未知状态' /></td>
        <td class="padding-6">
            <button type="button" class="btn btn-primary btn-white btn-xs"
                    onclick="link.showInput('edit', ${link.id})">修改
            </button>
            <button type="button" class="btn btn-danger btn-xs  btn-white"
                    onclick="link.deleteLink(${link.id}, '${link.name!}')">删除
            </button>
        </td>
    </tr>
    </#list>
    </tbody>
</table>

<!-- pagination -->
<@pagination page! />

<script type="text/javascript">
    $('.table').table();
    $('.paging').paging(link.queryLinkList, '#query-btn');
</script>
