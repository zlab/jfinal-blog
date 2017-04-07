<#macro sidebar search=true categories=true>
<div id="secondary" class="widget-area">
  <#if search>
      <aside class="widget widget_search">
        <#include "search-form.ftl" />
      </aside>
  </#if>

    <aside id="categories" class="widget widget_categories">
        <h3 class="widget-title">分类目录</h3>
        <ul>
          <#list categorys as category>
              <li class="cat-item"><a href="${ctx}/category/${category.slug}/">${category.name}</a></li>
          </#list>
        </ul>
    </aside>

    <aside id="tags" class="widget widget_tags">
        <h3 class="widget-title">标签</h3>
        <ul>
          <#list tags as tag>
              <li class="tag-item"><a href="${ctx}/tag/${tag.slug}/">${tag.name}</a></li>
          </#list>
        </ul>
    </aside>

    <aside id="recent-posts" class="widget widget_recent_posts">
        <h3 class="widget-title">近期文章</h3>
        <ul>
          <#list recentPosts as post>
            <#assign postTitle = post.title />
            <#if postTitle?length &gt; 26>
              <#assign postTitle = postTitle?substring(0, 26) />
            </#if>
              <li><a href="${ctx}/${post.id}/" title="${post.title}">${postTitle}</a></li>
          </#list>
        </ul>
    </aside>

    <aside id="top-read-posts" class="widget widget_top_read_posts">
        <h3 class="widget-title">热评文章</h3>

        <ul class="ds-top-threads" data-range="all" data-num-items="5"></ul>
    </aside>

    <aside id="recent-comments" class="widget widget_recent_comments">
        <h3 class="widget-title">最新评论</h3>

        <ul class="ds-recent-comments" data-num-items="5" data-show-avatars="1"
            data-show-time="1" data-show-title="1"
            data-show-admin="1" data-excerpt-length="70"></ul>
    </aside>

    <aside id="recent-recent-visitors" class="widget widget_recent_visitors">
        <h3 class="widget-title">最近访客</h3>

        <div class="ds-recent-visitors" data-num-items="10"></div>
    </aside>
</div>
<!-- #secondary -->
</#macro>