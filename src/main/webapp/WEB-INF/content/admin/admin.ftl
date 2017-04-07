<#include "../common/window.ftl" />
<@window "admin" "no-skin">
<div id="navbar" class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-container" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand">
                <small><i class="fa fa-leaf"></i> 博客后台管理
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <span class="user-info"></span>
                    ${session.loginUser.username} <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li><a href="#">
                            <i class="ace-icon fa fa-cog"></i> Settings
                        </a></li>

                        <li><a href="#">
                            <i class="ace-icon fa fa-user"></i> Profile
                        </a></li>

                        <li class="divider"></li>

                        <li><a href="${ctx}/admin/login/">
                            <i class="ace-icon fa fa-power-off"></i> Logout
                        </a></li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>

        <!-- /section:basics/navbar.dropdown -->
    </div>
    <!-- /.navbar-container -->
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <div id="sidebar" class="sidebar responsive sidebar-fixed">
        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                <button class="btn btn-success">
                    <i class="ace-icon fa fa-signal"></i>
                </button>

                <button class="btn btn-info">
                    <i class="ace-icon fa fa-pencil"></i>
                </button>

                <button class="btn btn-warning">
                    <i class="ace-icon fa fa-users"></i>
                </button>

                <a href="${ctx}/" class="btn btn-danger" target="_blank">
                    <i class="ace-icon fa fa-cogs"></i>
                </a>
            </div>

            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>
                <span class="btn btn-info"></span>
                <span class="btn btn-warning"></span>
                <span class="btn btn-danger"></span>
            </div>
        </div>

        <ul class="nav nav-list">
            <li><a data-url="/admin/dashboard/" href="#/admin/dashboard/">
                <i class="menu-icon fa fa-tachometer"></i>
                <span class="menu-text"> 仪表盘 </span>
            </a> <b class="arrow"></b></li>

            <li><a href="javascript:void(0)" class="dropdown-toggle">
                <i class="menu-icon fa fa-pencil-square-o"></i>
                <span class="menu-text"> 博客管理 </span>
                <b class="arrow fa fa-angle-down"></b>
            </a> <b class="arrow"></b>

                <ul class="submenu">
                    <li><a data-url="/admin/post/" href="#/admin/post/">
                        <i class="menu-icon fa fa-caret-right"></i> 文章管理
                    </a> <b class="arrow"></b></li>
                    <li><a data-url="/admin/category/" href="#/admin/category/">
                        <i class="menu-icon fa fa-caret-right"></i> 分类目录
                    </a> <b class="arrow"></b></li>
                    <li><a data-url="/admin/tag/" href="#/admin/tag/">
                        <i class="menu-icon fa fa-caret-right"></i> 标签
                    </a> <b class="arrow"></b></li>
                    <li><a data-url="/admin/link/" href="#/admin/link/">
                        <i class="menu-icon fa fa-caret-right"></i> 链接
                    </a> <b class="arrow"></b></li>
                </ul>
            </li>
            <li class=""><a href="javascript:void(0)" class="dropdown-toggle">
                <i class="menu-icon fa fa-desktop"></i>
                <span class="menu-text"> 系统管理 </span>
                <b class="arrow fa fa-angle-down"></b>
            </a> <b class="arrow"></b>

                <ul class="submenu">
                    <li><a data-url="/admin/option/" href="#/admin/option/">
                        <i class="menu-icon fa fa-caret-right"></i> 参数管理
                    </a> <b class="arrow"></b></li>
                    <li><a data-url="/admin/user/" href="#/admin/user/">
                        <i class="menu-icon fa fa-caret-right"></i> 用户管理
                    </a> <b class="arrow"></b></li>
                    <li><a data-url="/biz/teacher/pd/" href="${ctx}/">
                        <i class="menu-icon fa fa-caret-right"></i> 博客首页
                    </a> <b class="arrow"></b></li>
                </ul>
            </li>
        </ul>
        <!-- /.nav-list -->

        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
               data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <!-- /section:basics/sidebar.layout.minimize -->
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <!-- #section:basics/content.breadcrumbs -->
        <div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#/admin/dashboard/">首页</a></li>
            </ul>
            <!-- /.breadcrumb -->

            <!-- /section:basics/content.searchbox -->
        </div>

        <!-- /section:basics/content.breadcrumbs -->
        <div class="page-content">
            <!-- /section:settings.box -->
            <div class="page-content-area">
                <!-- ajax content goes here -->
            </div>
            <!-- /.page-content-area -->
        </div>
        <!-- /.page-content -->
    </div>
    <!-- /.main-content -->

    <div class="footer">
        <div class="footer-inner">
            <!-- #section:basics/footer -->
            <div class="footer-content">
                <span class="bigger-120">
                    <span class="blue bolder">${options['blog.name']!}</span>
                    &copy; 2011-2015
                </span>
            </div>

            <!-- /section:basics/footer -->
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>
<!-- /.main-container -->

<script type="text/javascript">
    $(function () {
        $('.page-content-area').ace_ajax({
            close_active: true,
            max_load_wait: 10,
            default_url: '/admin/dashboard/',
            content_url: function (hash) {
                return ctx + hash;
            }
        }).on('ajaxloadcomplete', function () {
            $('body>.modal').remove();
            $('.modal').appendTo('body');
        });
    });
</script>

</@window>
