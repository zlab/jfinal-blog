<#include "../common/window.ftl">
<#include "sidebar.ftl">
<@window>
<div id="page" class="site">

  <#include "header.ftl">

    <div id="main" class="wrapper">
        <div id="primary" class="site-content">
            <div id="content" role="main">
                <article class="post">
                  <#if key??>
                      <header class="entry-header">
                          <h1 class="entry-title">未找到：${key}</h1>
                      </header>
                      <div class="entry-content">
                          <p>抱歉，没有符合您搜索条件的结果，请换其它关键词再试。</p>
                        <#include "search-form.ftl" />
                      </div>
                  <#else>
                      <header class="entry-header">
                          <h1 class="entry-title">搜索</h1>
                      </header>
                      <div class="entry-content">
                        <#include "search-form.ftl" />
                      </div>
                  </#if>
                </article>
            </div>
            <!-- #content -->

        </div>
        <!-- #primary -->

      <@sidebar search=false />
    </div>
    <!-- #main -->

  <#include "footer.ftl">
</div>
<!-- #page -->

</@window>
