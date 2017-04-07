<#assign title = "404 Not Found" />
<#include "../common/window.ftl">
<#include "sidebar.ftl">
<@window>
<#--<#if isMobile!false>-->

<div id="page" class="site">

  <#include "header.ftl">

    <div id="main" class="wrapper">
        <div id="primary" class="site-content">
            <div id="content" role="main">
                <article class="post">
                    <header class="entry-header">
                        <h1 class="entry-title">页面未找到</h1>
                    </header>
                    <div class="entry-content">
                      <#include "search-form.ftl" />
                    </div>
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

<#--<#else>-->
<#--<script type="text/javascript" src="http://www.qq.com/404/search_children.js"></script>-->
<#--<script type="text/javascript" src="http://www.qq.com/404/search_children.js?edition=small"></script>-->
<#--</#if>-->

</@window>
