<header class="site-header" role="banner">
    <h1 class="site-title">
        <a href="${ctx}/" title="" rel="home">${options['blog.name']!}</a>
    </h1>

    <h2 class="site-description">${options['blog.desc']!}</h2>

    <nav class="main-navigation" role="navigation">
        <ul class="nav-menu">
        <#list links['nav-menu-main'] as link>
          <#assign currentMenuItem = " " />
          <#if servletPath == link.href>
            <#assign currentMenuItem = " current-menu-item" />
          </#if>
          <#if link.href?starts_with("/")>
              <li class="menu-item ${currentMenuItem!}">
                  <a href="${ctx}${link.href}" target="${link.target}">${link.name}</a>
              </li>
          <#else>
              <li class="menu-item ${currentMenuItem!}">
                  <a href="${link.href}" target="${link.target}">${link.name}</a>
              </li>
          </#if>
        </#list>
        </ul>
    </nav>
    <!-- main-navigation -->
</header>
<!-- site-header -->