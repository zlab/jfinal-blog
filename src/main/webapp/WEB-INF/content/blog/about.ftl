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
                        <h1 class="entry-title">关于</h1>
                    </header>

                    <div class="entry-content">
                        <p>请稍后再试。。。</p>
                    </div>

                </article>
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
