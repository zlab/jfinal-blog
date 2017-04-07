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
    <#list (page.list)! as category>
    <tr>
        <td>${category.name}</td>
        <td>${category.slug}</td>
        <td class="padding-6">
            <button type="button" class="btn btn-primary btn-white btn-xs"
                    onclick="category.showInput('edit', ${category.id})">修改
            </button>
            <button type="button" class="btn btn-danger btn-xs  btn-white"
                    onclick="category.deleteCategory(${category.id}, '${category.name}')">删除
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
    $('.paging').paging(category.queryCategoryList, '#query-btn');
</script>
