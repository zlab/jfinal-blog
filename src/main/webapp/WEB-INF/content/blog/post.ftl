<#include "../common/window.ftl">
<#include "sidebar.ftl">
<@window>
<div id="page" class="site">

  <#include "header.ftl">

    <div id="main" class="wrapper">
        <div id="primary" class="site-content">
            <div id="content" role="main">
                <article class="post">
                    <header class="entry-header">
                        <h1 class="entry-title">${post.title}</h1>
                    </header>

                    <div class="entry-content">${post.content}</div>

                  <#include "meta.ftl">
                </article>
                <nav class="nav-single">
                    <div class="nav-previous">
                        <span class="meta-nav-text">上一篇：</span>
                      <#if post.prevPost??>
                          <a href="${ctx}/${post.prevPost.id}/" rel="prev">
                              <span class="meta-nav">←</span>
                          ${post.prevPost.title}
                          </a>
                      <#else>
                          呃，老板，没有比这更老的文章了！
                      </#if>
                    </div>
                    <div class="nav-next">
                        <span class="meta-nav-text">下一篇：</span>
                      <#if post.nextPost??>
                          <a href="${ctx}/${post.nextPost.id}/" rel="next">
                          ${post.nextPost.title}
                              <span class="meta-nav">→</span>
                          </a>
                      <#else>
                          嘿，伙计，这已经是最新的文章啦！
                      </#if>
                    </div>
                </nav>
            </div>
            <!-- #content -->

            <div id="comments">
                <div class="ds-thread" data-thread-key="${post.id}" data-title="${post.title}"
                     data-url="${ctx}/${post.id}/"></div>
            </div>
            <!-- 多说评论框 end -->
        </div>
        <!-- #primary -->

      <@sidebar />
    </div>
    <!-- #main -->

  <#include "footer.ftl">
</div>
<!-- #page -->

</@window>
