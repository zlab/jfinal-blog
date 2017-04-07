<#include "../common/pagination.ftl" />
<#include "../common/readmore.ftl"/>
<#include "../common/window.ftl" />
<#include "sidebar.ftl">
<@window>
<div id="page" class="site">

  <#include "header.ftl" />

    <div id="main" class="wrapper">
        <div id="primary" class="site-content">
            <div id="content" role="main">
              <#assign paginateUrl = "${ctx}/" />
                <!-- 文章归档 -->
              <#if archive??>
                  <header class="archive-header">
                    <#if category??>
                      <#assign paginateUrl = "${ctx}/category/${category.slug}/" />
                        <h1 class="archive-title">分类目录归档：<span>${category.name}</span></h1>
                    <#elseif tag??>
                      <#assign paginateUrl = "${ctx}/tag/${tag.slug}/" />
                        <h1 class="archive-title">标签归档：<span>${tag.name}</span></h1>
                    <#elseif key??>
                      <#assign paginateUrl = "${ctx}/search/?key=${key}" />
                        <h1 class="archive-title">搜索：<span>${key}</span></h1>
                    </#if>
                  </header>
              </#if>

              <#if postPage.list?size == 0>
                  <article class="post">
                      <header class="entry-header">
                          <h1 class="entry-title">没有文章</h1>
                      </header>
                  </article>
              <#else>
                <#list postPage.list as post>
                    <article class="post">
                        <header class="entry-header">
                            <h1 class="entry-title">
                                <a href="${ctx}/${post.id}/" rel="bookmark">${post.title}</a>
                            </h1>
                        </header>
                        <div class="entry-content"><@readmore post.content "${ctx}/${post.id}/" post.title />
                        </div>

                      <#include "meta.ftl">

                    </article>
                </#list>
              </#if>

                <!-- pagination -->
              <@pagination postPage "${paginateUrl}" />
            </div>
            <!-- #content -->
        </div>
        <!-- #primary -->

      <@sidebar />

    </div>
    <!-- #main -->

  <#include "footer.ftl">

</div>
<!-- #page -->

</@window>