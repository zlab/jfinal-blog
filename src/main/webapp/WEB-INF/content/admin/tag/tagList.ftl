<#include "../../common/pagination.ftl">

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>名称</th>
        <th>别名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list (page.list)! as tag>
    <tr>
        <td>${tag.name}</td>
        <td>${tag.slug}</td>
        <td class="padding-6">
            <button type="button" class="btn btn-primary btn-white btn-xs"
                    onclick="tag.showInput('edit', ${tag.id})">修改
            </button>
            <button type="button" class="btn btn-danger btn-xs  btn-white"
                    onclick="tag.deleteTag(${tag.id}, '${tag.name}')">删除
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
    $('.paging').paging(tag.queryTagList, '#query-btn');
</script>
