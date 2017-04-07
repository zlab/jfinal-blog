<#include "../../common/pagination.ftl">

<table class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>帐号</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#list (page.list)! as user>
    <tr>
        <td>${user.username}</td>
        <td>${user.name!}</td>
        <td class="padding-6">
            <button type="button" class="btn btn-primary btn-white btn-xs"
                    onclick="user.showInput('edit', ${user.id})">修改
            </button>
            <button type="button" class="btn btn-danger btn-xs  btn-white"
                    onclick="user.deletePost(${user.id}, '${user.username}')">删除
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
    $('.paging').paging(user.queryUserList, '#query-btn');
</script>
