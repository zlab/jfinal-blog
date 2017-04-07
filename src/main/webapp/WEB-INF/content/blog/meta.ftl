<footer class="entry-meta">
    <span> 作者：zhanqi </span>
    <span> &nbsp; </span>
    <span>时间：${post.pubdate?string("yyyy-MM-dd HH:mm")}</span>
    <span> &nbsp; </span>
    <br class="meta-br"/>
    <span> 分类：<a href="${ctx}/category/${post.catslug}/" rel="category">${post.catname}</a></span>
    <span> &nbsp; </span>
<#if postPage??>
    <span> 评论：<a class="ds-thread-count" data-thread-key="${post.id}" href="${ctx}/${post.id}/#comments"></a></span>
<#else>
    <span> 标签：<#list post.postTags! as tag>
        <a href="${ctx}/tag/${tag.slug}/">${tag.name}</a>
    </#list></span>
</#if>
</footer>
<!-- .entry-meta -->